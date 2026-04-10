import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:system/system.dart';

import '../update/update_dialog.dart';

/// アプリ起動時に表示するスプラッシュスクリーン。
///
/// Lottie アニメーション（splash.lottie）を1回再生しながら、
/// バックグラウンドで [AppInitializer.initialize] を実行する。
/// ① アニメーション1周完了 AND ② 初期化完了、の両条件が揃った時点で
/// システム状態（メンテナンス・アップデート）を確認し、適切な画面へ遷移する。
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// アニメーションの再生速度倍率（1.5 = 1.5倍速）。
  static const double _playbackSpeed = 1.5;

  /// アセット読み込み失敗・アニメーション未完了時のフォールバックタイムアウト。
  static const Duration _timeout = Duration(seconds: 5);

  late final AnimationController _controller;

  /// バックグラウンドで実行するアプリ初期化 Future。
  late final Future<void> _initFuture;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // アニメーションと並行してアプリ初期化を開始する。
    _initFuture = AppInitializer.initialize();
    // アセット読み込み失敗やアニメーション未完了に備えたタイムアウト。
    // 一定時間内に完了しなかった場合はホーム画面へ強制遷移する。
    Future.delayed(_timeout, () {
      if (mounted) {
        _navigateToHome();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onAnimationLoaded(LottieComposition composition) {
    _controller
      ..duration = Duration(
        milliseconds: (composition.duration.inMilliseconds / _playbackSpeed)
            .round(),
      )
      ..forward().whenComplete(_onAnimationCompleted);
  }

  /// アニメーション完了後、初期化完了とシステム状態確認を経てから遷移する。
  Future<void> _onAnimationCompleted() async {
    try {
      await _initFuture;
      if (!mounted) return;

      // Firebase 初期化完了後にシステム状態を取得する
      final systemState = await ref.read(systemConfigProvider.future);
      if (!mounted) return;

      await _handleSystemState(systemState);
    } catch (_) {
      // 初期化・状態取得失敗時もホーム画面へ遷移する
      _navigateToHome();
    }
  }

  /// システム状態に応じた画面遷移を行う。
  Future<void> _handleSystemState(SystemAppState state) async {
    if (!mounted) return;

    switch (state) {
      case SystemMaintenance():
        // GoRouter の redirect がメンテナンス画面へリダイレクトする
        context.go('/');
      case SystemForceUpdate():
        // 強制アップデート: 閉じることができないダイアログを表示
        await showUpdateDialog(context, isForced: true);
      case SystemOptionalUpdate():
        // 任意アップデート: ホーム遷移後にダイアログを表示
        _navigateToHome();
        if (mounted) {
          await showUpdateDialog(context, isForced: false);
        }
      case SystemNormal():
        _navigateToHome();
    }
  }

  void _navigateToHome() {
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
          controller: _controller,
          onLoaded: _onAnimationLoaded,
          errorBuilder: (context, error, stackTrace) {
            // アセット読み込み失敗時は初期化完了後にホーム画面へ遷移する。
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              try {
                await _initFuture;
              } catch (_) {
                // 初期化失敗時もタイムアウト到達前にホーム画面へ遷移する。
              }
              _navigateToHome();
            });
            return const SizedBox.shrink();
          },
          width: 240,
          height: 240,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
