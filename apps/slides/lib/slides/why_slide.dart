import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/speaker_notes.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/annotation_marker.dart';
import 'package:slides/widgets/app_screen.dart';
import 'package:slides/widgets/slide_scaffold.dart';
import 'package:slides/widgets/visuals.dart';

/// 2枚目 (0:30-1:05)
///
/// 手がかりを1つずつ明かし、最後に種明かしをする。
///
/// **遷移直後（ステップ1）は手がかりを1つも出さない。** 問いだけを置いて
/// 会場に考えさせる時間を作るため。ここで①が既に出ていると、答えを
/// 見せてから問う形になって間が死ぬ。
///
/// ステップ 2-5 が手がかりの提示、6 が種明かし。
class WhySlide extends FlutterDeckSlideWidget {
  const WhySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/why',
            steps: WhyLayout.totalSteps,
            title: '手がかり',
            speakerNotes: SpeakerNotes.whySlide,
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

  /// 1 は問いだけ、2-5 が手がかりの提示、6 で種明かしを出す
  final int step;

  /// 手がかり4つ ＋ 問いだけの最初 ＋ 種明かし
  static const totalSteps = 6;

  /// [index]（**1始まり**）の手がかりが見えるステップか。
  ///
  /// ステップ1では何も出さないので、手がかり① は step 2 から。
  static bool cueVisible(int step, int index) => step > index;

  /// 種明かしを出すステップか
  static bool punchlineVisible(int step) => step >= totalSteps;

  /// 手がかり4つ。
  ///
  /// **ラベルは一語**にして、何を見たかは図の方で伝える。端末側で丸を
  /// 付けている対象そのものをタイルに描くので、文章で言い直す必要がない。
  static const cues = <({AnnotationTarget target, String label})>[
    (target: AnnotationTarget.cart, label: '形'),
    // 「桁が読める」「数字が対応している」に触れてはいけない。カスタム言語の
    // 解読の入口になるため。手がかりは通貨記号の形だけに絞る。
    (target: AnnotationTarget.price, label: '記号'),
    (target: AnnotationTarget.addButton, label: '色'),
    (target: AnnotationTarget.bottomNav, label: '位置'),
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
                visible: cueVisible(step, i + 1),
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

  /// 手がかりを 2x2 に並べる。縦1列だと4段で背が高くなり、
  /// 種明かしの一文を置く余地が無くなる。
  static const _columns = 2;

  @override
  Widget build(BuildContext context) {
    const cues = WhyLayout.cues;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('読めないのに、\nなぜ分かった？', style: SlideText.title),
        const SizedBox(height: 40),
        for (var row = 0; row < cues.length / _columns; row++)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              children: [
                for (var col = 0; col < _columns; col++)
                  Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: _Cue(index: row * _columns + col + 1, step: step),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 16),
        AnimatedOpacity(
          opacity: WhyLayout.punchlineVisible(step) ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Text('どれも、文字じゃない。', style: SlideText.punch),
        ),
      ],
    );
  }
}

/// 手がかり1つ分のタイル。
///
/// 端末側で丸を付けている対象を、**そのまま図にして**左に並べる。
/// 番号は端末側の丸と対応していて、どれの話かが線を引かなくても分かる。
class _Cue extends StatelessWidget {
  const _Cue({required this.index, required this.step});

  /// 1始まり
  final int index;
  final int step;

  /// 手がかりの見た目。アイコンで表せないもの（黄色い丸、タブの帯）は
  /// 実物に寄せた図形を描く。
  Widget get _glyph => switch (index) {
        1 => const Icon(Icons.shopping_cart, size: 76),
        2 => Text('¥', style: SlideText.title.copyWith(fontSize: 76)),
        3 => const _AddButtonGlyph(),
        _ => const _BottomNavGlyph(),
      };

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: WhyLayout.cueVisible(step, index) ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      child: IconTile(
        label: WhyLayout.cues[index - 1].label,
        color: SlideColors.accent,
        number: index,
        glyph: IconTheme(
          data: IconThemeData(color: SlideColors.accent),
          child: _glyph,
        ),
      ),
    );
  }
}

/// 手がかり③「押せそうな黄色い丸」。
///
/// アイコンでは表せないので、アプリ本体の追加ボタンに寄せて描く。
/// **色そのものが手がかり**なので、この黄色は配色に混ぜず実物に合わせる。
class _AddButtonGlyph extends StatelessWidget {
  const _AddButtonGlyph();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 76,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xFFFFD54F),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.add_shopping_cart, size: 40, color: Colors.black),
    );
  }
}

/// 手がかり④「タブの位置」。画面の下辺にタブがある、という形だけを描く。
class _BottomNavGlyph extends StatelessWidget {
  const _BottomNavGlyph();

  @override
  Widget build(BuildContext context) {
    final c = SlideColors.accent;

    return SizedBox(
      width: 84,
      height: 84,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: c.withValues(alpha: 0.35), width: 3),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              child: const SizedBox.expand(),
            ),
          ),
          Container(
            height: 26,
            decoration: BoxDecoration(
              color: c,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.filled(
                4,
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: c.onColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
