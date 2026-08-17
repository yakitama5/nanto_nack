import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/visuals.dart';

/// 4枚目 (1:35-2:10)
///
/// このアプリが本当に届けたいものを言い切る、本編の山場。
///
/// **背景は他のスライドと同じ**にしてある。以前はここだけ全面を紫で塗って
/// いたが、投影環境によって紫の出方が変わり、通しで見たときにここだけ
/// 浮いてしまう。トーンの変化は**文字の大きさと余白**で作る方が壊れにくい。
class WonderSlide extends FlutterDeckSlideWidget {
  const WonderSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wonder',
            title: 'コンセプト',
            speakerNotes: '''
［1:35-2:10／本編の山場。ここだけゆっくり話す］

形・色・位置。いま皆さんが使った手がかりは、
普段はまったく意識していないものです。

読めない画面に放り込まれて、はじめて気づく。

［間を置いて］あ、わかった！

この瞬間そのものが、このアプリが届けたいものです。
機能ではなく、感覚の再発見。''',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const WonderLayout());
  }
}

/// [WonderSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class WonderLayout extends StatelessWidget {
  const WonderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 56),
      // このスライドは中身が他より低い。Center を挟まないと上に張り付いて、
      // 下に大きな余白が残る（親から来る高さの制約がゆるいため）。
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: _Message()),
            const SizedBox(width: 48),
            Image.asset(
              'assets/images/surprised.png',
              width: 520,
              filterQuality: FilterQuality.medium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 手がかり3つ → 「わかった」。スライド2で会場が自分で挙げたものが
        // そのまま並ぶので、答え合わせとして効く。
        const _Cues(),
        const SizedBox(height: 36),
        // 山場の一語。背景を変えない代わりに、**ここだけ極端に大きく**して
        // トーンが変わったことを伝える。
        Text(
          'あ、わかった！',
          style: SlideText.title.copyWith(
            fontSize: 132,
            color: SlideColors.primary,
          ),
        ),
        const SizedBox(height: 36),
        const _Underline(),
        const SizedBox(height: 36),
        Text('届けたいのは、感覚の再発見。', style: SlideText.punch),
      ],
    );
  }
}

/// 「形・色・位置 → わかる」を札と矢印で示す。
class _Cues extends StatelessWidget {
  const _Cues();

  static const _cues = <({IconData icon, String label})>[
    (icon: Icons.category, label: '形'),
    (icon: Icons.palette, label: '色'),
    (icon: Icons.place, label: '位置'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final cue in _cues) ...[
          LabelChip(icon: cue.icon, label: cue.label),
          const SizedBox(width: 14),
        ],
        const FlowArrow(size: 48),
        Text('わかる', style: SlideText.lead),
      ],
    );
  }
}

/// 山場の一語の下に敷く線。背景で区切れない分、ここで間を作る。
class _Underline extends StatelessWidget {
  const _Underline();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 6,
      decoration: BoxDecoration(
        color: SlideColors.accent,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
