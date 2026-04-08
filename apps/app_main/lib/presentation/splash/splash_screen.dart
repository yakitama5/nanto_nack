import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

/// アプリ起動時に表示するスプラッシュスクリーン。
///
/// Lottie アニメーション（loading.json）を1回再生し、
/// 完了後にホーム画面（`/`）へ遷移する。
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  /// アニメーションの再生速度倍率（1.5 = 1.5倍速）。
  static const double _playbackSpeed = 1.5;

  /// アセット読み込み失敗・アニメーション未完了時のフォールバックタイムアウト。
  static const Duration _timeout = Duration(seconds: 5);

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // アセット読み込み失敗やアニメーション未完了に備えたタイムアウト。
    // 一定時間内に完了しなかった場合はホーム画面へ強制遷移する。
    Future.delayed(_timeout, () {
      if (mounted && !_controller.isCompleted) {
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
      ..forward().whenComplete(_navigateToHome);
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
          'assets/lottie/loading.json',
          controller: _controller,
          onLoaded: _onAnimationLoaded,
          errorBuilder: (context, error, stackTrace) {
            // アセット読み込み失敗時はすぐにホーム画面へ遷移する。
            WidgetsBinding.instance.addPostFrameCallback((_) {
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
