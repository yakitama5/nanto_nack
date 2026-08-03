import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/animations.dart';
import 'package:slides/widgets/app_screen.dart';
import 'package:slides/widgets/slide_scaffold.dart';

/// 1枚目 (0:00-0:30)
///
/// 説明をせずに画面だけを見せる。「"水を2つカートに入れて" と言われたら
/// どこを押しますか？」と問いかけ、5〜8秒黙る。
class HookSlide extends FlutterDeckSlideWidget {
  const HookSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/hook'),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const HookLayout());
  }
}

/// [HookSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class HookLayout extends StatelessWidget {
  const HookLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // 端末は動かさない。ここは会場に画面を読ませる時間なので、
    // 動くものがあると視線がそちらへ逃げる。
    return const SplitSlide(
      device: DeviceFrame(child: AppScreen()),
      text: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('この画面、\n操作できますか？', style: SlideText.title),
          SizedBox(height: 56),
          Text('水を2つ、カートへ。', style: SlideText.lead),
          SizedBox(height: 24),
          // 問いかけだけを脈打たせて、会場の視線をここに置く
          PulseLoop(
            child: Text('どこを押す？', style: SlideText.punch),
          ),
        ],
      ),
    );
  }
}
