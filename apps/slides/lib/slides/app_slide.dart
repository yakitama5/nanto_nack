import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';

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
  static const _steps = <({IconData icon, String title, String detail})>[
    (
      icon: Icons.flag,
      title: 'お題が出る',
      // 出典: packages/quizzes/market/assets/i18n/ja.i18n.json の quiz1
      detail: '「裏側に傷がないか気になるな。最後の写真までスワイプして確認しよう」',
    ),
    (
      icon: Icons.touch_app,
      title: '本物そっくりのUIを、実際に指で触る',
      detail: 'タップ／スワイプ／ピンチ／長押し ——「選ぶ」のではなく「操作する」',
    ),
    (
      icon: Icons.timer_outlined,
      title: '制限時間内に達成できたらクリア',
      detail: '測っているのは知識量ではなく、迷わなさ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('文字が読めない世界の、\nUIクイズ', style: SlideText.title),
        const SizedBox(height: 28),
        const Text(
          'マスコット「ナントム」のノロいで、アプリの文字が全部読めなくなった。',
          style: SlideText.body,
        ),
        const SizedBox(height: 48),
        for (var i = 0; i < _steps.length; i++)
          _Step(
            number: i + 1,
            icon: _steps[i].icon,
            title: _steps[i].title,
            detail: _steps[i].detail,
          ),
        const SizedBox(height: 28),
        const Text('4択ではない。触って答えるクイズ。', style: SlideText.punch),
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
    required this.detail,
  });

  final int number;
  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
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
                fontSize: 22,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          const SizedBox(width: 20),
          // 番号バッジと同じ高さの箱に入れて、見出しの行と高さを揃える。
          SizedBox(
            height: 46,
            child: Center(
              child: Icon(icon, size: 40, color: SlideColors.primary),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: SlideText.body),
                const SizedBox(height: 4),
                Text(detail, style: SlideText.caption),
              ],
            ),
          ),
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
        Image.asset(
          'assets/images/normal.png',
          width: 320,
          filterQuality: FilterQuality.medium,
        ),
        const SizedBox(height: 36),
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
