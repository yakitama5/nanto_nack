import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/animations.dart';

/// 3枚目 (1:05-1:35)
///
/// 世界観とプレイの流れを伝える、唯一の「アプリ紹介」。
///
/// 1・2枚目で同じ EC 画面を見せ続けているので、ここは端末を出さずに
/// マスコットと流れ図に切り替える。同じ絵が3枚続くと「1画面だけのアプリ」
/// に見えてしまうため。
class AppSlide extends FlutterDeckSlideWidget {
  const AppSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/app'),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const AppLayout());
  }
}

/// [AppSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 72, vertical: 52),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded は子に縦いっぱいの制約を渡すので、Align を挟まないと
          // 中身が上に張り付いて下に大きな余白ができる。
          Expanded(
            child: Align(alignment: Alignment.centerLeft, child: _Story()),
          ),
          SizedBox(width: 72),
          _Mascot(),
        ],
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story();

  /// プレイの流れ。番号は [_Step] 側で振る。
  static const _steps = <({IconData icon, String title})>[
    (icon: Icons.flag, title: 'お題が出る'),
    (icon: Icons.touch_app, title: '指で触る'),
    (icon: Icons.timer_outlined, title: '時間内にクリア'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('文字が読めない世界の\nUIクイズ', style: SlideText.title),
        const SizedBox(height: 24),
        const Text('ナントムのノロい。', style: SlideText.body),
        const SizedBox(height: 52),
        for (var i = 0; i < _steps.length; i++)
          _Step(
            number: i + 1,
            icon: _steps[i].icon,
            title: _steps[i].title,
          ),
        const SizedBox(height: 36),
        const PulseLoop(
          child: Text('4択じゃない。触って答える。', style: SlideText.punch),
        ),
      ],
    );
  }
}

/// プレイの流れの1ステップ。番号バッジはスライド2の手がかりと同じ見た目にして、
/// 「番号が付いているものは順番に読む」という約束を通しで揃えている。
class _Step extends StatelessWidget {
  const _Step({
    required this.number,
    required this.icon,
    required this.title,
  });

  final int number;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: SlideColors.primary,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                fontFamily: 'packages/quiz_core/NotoSansJP',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(width: 24),
          // ステップごとに位相をずらして、順番に弾むように見せる
          FloatLoop(
            distance: 8,
            delay: Duration(milliseconds: 400 * number),
            child: Icon(icon, size: 52, color: SlideColors.primary),
          ),
          const SizedBox(width: 22),
          Expanded(child: Text(title, style: SlideText.body)),
        ],
      ),
    );
  }
}

class _Mascot extends StatelessWidget {
  const _Mascot();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatLoop(
          child: Image.asset(
            'assets/images/normal.png',
            width: 340,
            filterQuality: FilterQuality.medium,
          ),
        ),
        const SizedBox(height: 40),
        const _ScaleBadge(),
      ],
    );
  }
}

/// 規模は一言だけ添えて深追いしない。
class _ScaleBadge extends StatelessWidget {
  const _ScaleBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: SlideColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Text('18カテゴリ × 4ステージ', style: SlideText.caption),
          SizedBox(height: 4),
          Text('72ミッション', style: SlideText.lead),
        ],
      ),
    );
  }
}
