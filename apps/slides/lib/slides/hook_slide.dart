import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
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
    return SplitSlide(
      device: const DeviceFrame(child: AppScreen()),
      text: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('この画面、\n操作できますか？', style: SlideText.title),
          const SizedBox(height: 56),
          Text('水を2つ、カートへ。', style: SlideText.lead),
          const SizedBox(height: 24),
          // 問いかけは色と大きさだけで立たせる。ここは会場が画面を読む時間なので、
          // 動かすと視線が端末から逃げる。
          Text('どこを押す？', style: SlideText.punch),
        ],
      ),
    );
  }
}
