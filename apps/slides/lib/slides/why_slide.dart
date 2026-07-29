import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/annotation_marker.dart';
import 'package:slides/widgets/app_screen.dart';
import 'package:slides/widgets/slide_scaffold.dart';

/// 2枚目 (0:30-1:05)
///
/// 手がかりを1つずつ明かし、最後に種明かしをする。
/// ステップ 1-4 が手がかりの提示、5 が種明かし。
class WhySlide extends FlutterDeckSlideWidget {
  const WhySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/why',
            steps: 5,
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) => WhyLayout(step: step),
      ),
    );
  }
}

/// [WhySlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class WhyLayout extends StatelessWidget {
  const WhyLayout({super.key, required this.step});

  /// 1-4 が手がかりの提示、5 で種明かしを出す
  final int step;

  static const cues = <({AnnotationTarget target, String text})>[
    (target: AnnotationTarget.cart, text: 'カートのアイコンの形'),
    (target: AnnotationTarget.price, text: '¥ 記号と、3桁の区切り'),
    (target: AnnotationTarget.addButton, text: '黄色い丸という「押せそうな」形'),
    (target: AnnotationTarget.bottomNav, text: 'いつもそこにある、下部タブの位置'),
  ];

  @override
  Widget build(BuildContext context) {
    return SplitSlide(
      text: _Explanation(step: step),
      device: DeviceFrame(
        child: const AppScreen(),
        overlay: Stack(
          children: [
            for (var i = 0; i < cues.length; i++)
              AnnotationMarker(
                target: cues[i].target,
                number: i + 1,
                visible: step > i,
                color: SlideColors.accent,
              ),
          ],
        ),
      ),
    );
  }
}

class _Explanation extends StatelessWidget {
  const _Explanation({required this.step});

  final int step;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('一文字も読めないのに、\nなぜ分かったのか', style: SlideText.title),
        const SizedBox(height: 44),
        for (var i = 0; i < WhyLayout.cues.length; i++)
          _Cue(
            index: i + 1,
            text: WhyLayout.cues[i].text,
            visible: step > i,
          ),
        const SizedBox(height: 36),
        AnimatedOpacity(
          opacity: step >= 5 ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const _Punchline(),
        ),
      ],
    );
  }
}

class _Cue extends StatelessWidget {
  const _Cue({required this.index, required this.text, required this.visible});

  final int index;
  final String text;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: SlideColors.accent,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$index',
                style: const TextStyle(
                  fontFamily: 'packages/quiz_core/NotoSansJP',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text, style: SlideText.body)),
          ],
        ),
      ),
    );
  }
}

class _Punchline extends StatelessWidget {
  const _Punchline();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('どれも、文字ではない。', style: SlideText.punch),
        SizedBox(height: 18),
        Text(
          '私たちは普段から、UIの文字をほとんど読んでいない。\n'
          '形と色と位置で判断している。それが アフォーダンス。',
          style: SlideText.caption,
        ),
      ],
    );
  }
}
