import 'package:flutter/material.dart';

/// ダッシュボードのスケルトン（ローディング）表示
///
/// データ読み込み中にグレーのグラデーションが動く骨組みUIを表示する。
class SkeletonDashboard extends StatefulWidget {
  const SkeletonDashboard({super.key});

  @override
  State<SkeletonDashboard> createState() => _SkeletonDashboardState();
}

class _SkeletonDashboardState extends State<SkeletonDashboard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tips カードのスケルトン
              _SkeletonCard(
                animation: _animation,
                height: 120,
              ),
              const SizedBox(height: 16),
              // ストリーク・残りプレイ数のスケルトン
              Row(
                children: [
                  Expanded(
                    child: _SkeletonCard(
                      animation: _animation,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _SkeletonCard(
                      animation: _animation,
                      height: 80,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // ヒートマップのスケルトン
              _SkeletonCard(
                animation: _animation,
                height: 180,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({
    required this.animation,
    required this.height,
  });

  final Animation<double> animation;
  final double height;

  @override
  Widget build(BuildContext context) {
    final baseColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlightColor = Theme.of(context).colorScheme.surface;

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.lerp(baseColor, highlightColor, animation.value),
      ),
    );
  }
}
