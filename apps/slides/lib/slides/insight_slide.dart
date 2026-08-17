import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/i18n/strings.g.dart' as shopping_i18n;
import 'package:slides/theme.dart';
import 'package:slides/widgets/slide_scaffold.dart';

/// 5枚目 (2:10-2:45)
///
/// 「あ、わかった！」で終わらせず、働いた感覚を言語化する仕組みを見せる。
///
/// 右に出るのは 1・2枚目で見せた「水を2つ買う」ミッションの解説そのもの。
/// スライド2で挙げた手がかり（アイコン・色・パターン）が、アプリ側で
/// そのまま原則として言い直されるので、通しで見ると答え合わせになる。
class InsightSlide extends FlutterDeckSlideWidget {
  const InsightSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/insight',
            title: '言語化',
            speakerNotes: '''
［2:10-2:45］

ただ、「わかった」で終わると、たいてい忘れます。

クリアすると、いま使った手がかりの解説が出ます。
右にあるのは実際のアプリの画面そのものです。

アイコン、色、パターン。さっきの答え合わせが、そのまま出る。

触ってわかる。その場で言語化する。だから、残る。''',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const InsightLayout());
  }
}

/// [InsightSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class InsightLayout extends StatelessWidget {
  const InsightLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitSlide(
      textWidth: 780,
      device: const _InsightCard(),
      text: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('わかった、で\n終わらせない', style: SlideText.title),
          const SizedBox(height: 48),
          // 「感覚が先、言葉が後、だから残る」という順番そのものが伝えたい
          // ことなので、文章ではなく**工程図**にする。
          const _Flow(),
          const SizedBox(height: 48),
          Text('だから、残る。', style: SlideText.punch),
        ],
      ),
    );
  }
}

/// 「触ってわかる → その場で言語化 → 残る」の工程図。
///
/// 3段の縦並びにしているのは、右に実機の解説パネルが縦長で入るため。
/// 横に流すと札が小さくなって、投影で読めなくなる。
class _Flow extends StatelessWidget {
  const _Flow();

  static const _steps = <({IconData icon, String label, bool emphasized})>[
    (icon: Icons.touch_app, label: '触って、わかる', emphasized: false),
    (icon: Icons.menu_book, label: 'その場で言語化', emphasized: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _steps.length; i++) ...[
          if (i > 0) const _DownArrow(),
          _Step(
            icon: _steps[i].icon,
            label: _steps[i].label,
            emphasized: _steps[i].emphasized,
          ),
        ],
      ],
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.icon,
    required this.label,
    required this.emphasized,
  });

  final IconData icon;
  final String label;

  /// 強調する側（言語化）だけ色を変える。ここがこのアプリの主張なので、
  /// 2つを同じ重みで並べると何を言いたいか分からなくなる。
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final c = emphasized ? SlideColors.accent : SlideColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 60, color: c),
          const SizedBox(width: 24),
          Text(label, style: SlideText.body.copyWith(color: c)),
        ],
      ),
    );
  }
}

/// 工程をつなぐ下向きの矢印。
class _DownArrow extends StatelessWidget {
  const _DownArrow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 52, top: 12, bottom: 12),
      child: Icon(
        Icons.arrow_downward_rounded,
        size: 48,
        color: SlideColors.subText,
      ),
    );
  }
}

/// クリア後に出る解説パネル。アプリ本体と同じ [QuizInsightContent] を描く。
///
/// 文言も [shopping_i18n] の ja ロケールから直に読むので、実機と一字一句同じ。
/// クイズUIは架空言語（xx）だが、解説だけは読める言語で出るのが本来の挙動。
class _InsightCard extends StatelessWidget {
  const _InsightCard();

  /// 実機のリザルトカードの中身の幅（端末幅 390 − Card の余白 − 内側 padding）。
  /// この幅で組んでから拡大することで、実機と同じ行送り・折り返しになる。
  static const _cardWidth = 326.0;

  @override
  Widget build(BuildContext context) {
    final insight = shopping_i18n.AppLocale.ja.buildSync().water.insight;

    return SizedBox(
      width: 820,
      height: 940,
      child: FittedBox(
        child: Container(
          width: _cardWidth,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          // QuizInsightContent は textTheme と colorScheme を読むため、
          // アプリ本体と同じ AppTheme を被せる。
          child: Theme(
            data: AppTheme.light(),
            child: QuizInsightContent(
              title: insight.title,
              subtitle: insight.subtitle,
              items: [
                QuizInsightItem(
                  emoji: '🛒',
                  title: insight.iconTitle,
                  desc: insight.iconDesc,
                ),
                QuizInsightItem(
                  emoji: '🎨',
                  title: insight.colorTitle,
                  desc: insight.colorDesc,
                ),
                QuizInsightItem(
                  emoji: '📱',
                  title: insight.patternTitle,
                  desc: insight.patternDesc,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
