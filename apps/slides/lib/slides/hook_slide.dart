import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/app_screen.dart';
import 'package:slides/widgets/slide_scaffold.dart';
import 'package:slides/widgets/visuals.dart';

/// 1枚目 (0:00-0:30)
///
/// 説明をせずに画面だけを見せる。「"水を2つカートに入れて" と言われたら
/// どこを押しますか？」と問いかけ、5〜8秒黙る。
class HookSlide extends FlutterDeckSlideWidget {
  const HookSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/hook',
            title: 'つかみ',
            speakerNotes: '''
［0:00-0:30］

［まず何も言わずに5秒待つ。会場に画面を読ませる時間］

この画面、操作できますか？

お題はひとつだけです。水を2つ、カートに入れる。
ただし、文字はひとつも読めません。全部、架空の言語です。

……どこを押しますか？

［ここでもう3秒待ってから次のスライドへ］''',
          ),
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
          const SizedBox(height: 48),
          // お題は文章で言わず、図で出す。「水 ×2 をカートへ」を
          // 3つの札と矢印で表せば、読まずに見ただけで伝わる。
          const _Mission(),
          const SizedBox(height: 40),
          // 問いかけは色と大きさだけで立たせる。ここは会場が画面を読む時間なので、
          // 動かすと視線が端末から逃げる。
          Text('どこを押す？', style: SlideText.punch),
        ],
      ),
    );
  }
}

/// お題「水を2つ、カートへ」を図で出す。
///
/// 文章で書くと読ませることになる。**品物・個数・行き先**の3つだけを
/// 札にして矢印でつなげば、目で追うだけで伝わる。
class _Mission extends StatelessWidget {
  const _Mission();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const LabelChip(icon: Icons.water_drop, label: '水'),
        const SizedBox(width: 16),
        Text('×2', style: SlideText.lead),
        const FlowArrow(),
        const LabelChip(icon: Icons.shopping_cart, label: 'カート'),
      ],
    );
  }
}
