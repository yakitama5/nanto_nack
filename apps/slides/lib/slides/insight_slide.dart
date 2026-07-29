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
          configuration: const FlutterDeckSlideConfiguration(route: '/insight'),
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
    return const SplitSlide(
      textWidth: 780,
      device: _InsightCard(),
      text: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('「あ、わかった！」で\n終わらせない', style: SlideText.title),
          SizedBox(height: 40),
          Text(
            'クリアした直後、いま働いた感覚の正体が\nUI/UX の原則として言語化される。',
            style: SlideText.body,
          ),
          SizedBox(height: 36),
          Text('感覚 → 言語化。だから残る。', style: SlideText.punch),
          SizedBox(height: 24),
          Text(
            '先に体でわかってから言葉が来るので、勘が「使える知識」に変わる。\n'
            'ダッシュボードの「今日のUI/UXヒント」で、毎日1つ思い出せる。',
            style: SlideText.caption,
          ),
        ],
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
