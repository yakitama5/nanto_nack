import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:system/system.dart';

import '../update/update_dialog.dart';

/// アプリ起動時に表示するスプラッシュスクリーン。
///
/// Lottie アニメーションを1回再生し、完了後にシステム状態を確認して遷移する。
/// Firebase 初期化は main() で完了済み。
///
/// 遷移ルール:
/// - Normal / Maintenance: ホーム画面へ遷移（Maintenance は GoRouter redirect が処理）
/// - ForceUpdate: ダイアログを表示（閉じ不可）
/// - OptionalUpdate: ダイアログを表示し、閉じたらホーム画面へ遷移
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// アニメーションの再生速度倍率（1.5 = 1.5倍速）。
  static const double _playbackSpeed = 1.5;

  /// Lottie 読み込み失敗時のフォールバックタイムアウト。
  /// アニメーション完了時にキャンセルされるため、ダイアログ表示中には発火しない。
  static const Duration _timeout = Duration(seconds: 5);

  late final AnimationController _controller;
  Timer? _timeoutTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // Lottie 読み込み失敗やアニメーション未完了に備えたフォールバック。
    // アニメーションが正常に完了した場合は _onAnimationCompleted でキャンセルされる。
    _timeoutTimer = Timer(_timeout, () async {
      if (!mounted) return;
      try {
        final systemState = await ref.read(systemConfigProvider.future);
        if (!mounted) return;
        await _handleSystemState(systemState);
      } catch (_) {
        _navigateToHome();
      }
    });
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
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

  /// アニメーション完了後、システム状態確認を経てから遷移する。
  Future<void> _onAnimationCompleted() async {
    // タイムアウトをキャンセル。ダイアログ表示中にホームへ遷移してしまうのを防ぐ。
    _timeoutTimer?.cancel();
    if (!mounted) return;
    try {
      final systemState = await ref.read(systemConfigProvider.future);
      if (!mounted) return;
      await _handleSystemState(systemState);
    } catch (_) {
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
        // 強制アップデート: スプラッシュ上でダイアログを表示（閉じ不可）
        await showUpdateDialog(context, isForced: true);
      case SystemOptionalUpdate():
        // 任意アップデート: ダイアログを閉じた後にホームへ遷移
        await showUpdateDialog(context, isForced: false);
        _navigateToHome();
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
            // アセット読み込み失敗時はシステム状態確認を経て遷移する。
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (!mounted) return;
              try {
                final systemState =
                    await ref.read(systemConfigProvider.future);
                if (!mounted) return;
                await _handleSystemState(systemState);
              } catch (_) {
                _navigateToHome();
              }
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
