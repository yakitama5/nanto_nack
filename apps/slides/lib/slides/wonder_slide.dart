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
        color: SlideColors.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 56),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(child: _Message()),
              const SizedBox(width: 64),
              Image.asset(
                'assets/images/surprised.png',
                width: 420,
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

  static const _onDark = Colors.white;
  static const _onDarkSub = Color(0xFFD8CEFF);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '一文字も読めないのに、当てられた。',
          style: SlideText.body.copyWith(color: _onDarkSub),
        ),
        const SizedBox(height: 20),
        Text(
          'あ、わかった！',
          style: SlideText.title.copyWith(color: _onDark, fontSize: 84),
        ),
        const SizedBox(height: 20),
        Text(
          '—— その瞬間の気持ちよさが、このアプリのすべて。',
          style: SlideText.body.copyWith(color: _onDark),
        ),
        const SizedBox(height: 48),
        _Divider(),
        const SizedBox(height: 40),
        Text(
          '意味が分からなくても、形と色と位置だけで「たぶんこう」を導ける。\n'
          '普段はUIが親切すぎて、その力を使っている自覚がない。',
          style: SlideText.caption.copyWith(color: _onDarkSub),
        ),
        const SizedBox(height: 32),
        Text.rich(
          TextSpan(
            style: SlideText.body.copyWith(color: _onDark),
            children: [
              const TextSpan(text: '届けたいのは知識ではなく、'),
              TextSpan(
                text: '自分の感覚への再発見',
                style: SlideText.punch.copyWith(color: Colors.amberAccent),
              ),
              const TextSpan(text: '。'),
            ],
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
