import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';

/// 4枚目 (1:35-2:10)
///
/// このアプリが本当に届けたいものを言い切る、本編の山場。
///
/// 前後がスクリーンショット尽くしなので、**この一枚だけ画面の質感を変える**。
/// 端末画像を出さず、濃い背景に大きな文字を置くことで
/// 「ここは機能紹介ではなくコンセプトの話だ」と伝わるようにしている。
class WonderSlide extends FlutterDeckSlideWidget {
  const WonderSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/wonder'),
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
    // ColoredBox は中身のサイズに縮むので、スライド全面を塗るために
    // SizedBox.expand で明示的に広げる。
    return SizedBox.expand(
      child: ColoredBox(
        color: SlidePanelColors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 56),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: _Message()),
              const SizedBox(width: 64),
              Image.asset(
                'assets/images/surprised.png',
                width: 460,
                filterQuality: FilterQuality.medium,
              ),
            ],
          ),
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
        Text(
          '読めないのに、当てられた。',
          style: SlideText.body.copyWith(
            color: SlidePanelColors.onBackgroundMuted,
          ),
        ),
        const SizedBox(height: 24),
        // 山場の一語。動きは付けず、**大きさと白さだけ**で立たせる。
        // ここは話し手が一拍おく場面なので、画面が動いていると間が持たない。
        Text(
          'あ、わかった！',
          style: SlideText.title.copyWith(
            color: SlidePanelColors.onBackground,
            fontSize: 120,
          ),
        ),
        const SizedBox(height: 32),
        const _Divider(),
        const SizedBox(height: 36),
        Text(
          '形と色と位置だけで。',
          style: SlideText.body.copyWith(
            color: SlidePanelColors.onBackgroundMuted,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          '届けたいのは、感覚の再発見。',
          style: SlideText.punch.copyWith(color: SlidePanelColors.highlight),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 4,
      decoration: BoxDecoration(
        color: SlidePanelColors.onBackground.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
