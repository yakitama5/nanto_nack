import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/animations.dart';
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
    (target: AnnotationTarget.cart, text: 'カートの形'),
    // 「桁が読める」「数字が対応している」に触れてはいけない。カスタム言語の
    // 解読の入口になるため。手がかりは通貨記号の形だけに絞る。
    (target: AnnotationTarget.price, text: '¥ の記号'),
    (target: AnnotationTarget.addButton, text: '押せそうな黄色い丸'),
    (target: AnnotationTarget.bottomNav, text: 'タブの位置'),
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
        Text('読めないのに、\nなぜ分かった？', style: SlideText.title),
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
              width: 52,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: SlideColors.accent,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$index',
                style: SlideText.badge(28, SlideColors.scheme.onSecondary),
              ),
            ),
            const SizedBox(width: 24),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PulseLoop(child: Text('どれも、文字じゃない。', style: SlideText.punch)),
        const SizedBox(height: 20),
        Text('形・色・位置＝アフォーダンス', style: SlideText.caption),
      ],
    );
  }
}
