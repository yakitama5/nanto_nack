import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/animations.dart';

/// 3枚目 (1:05-1:35)
///
/// 「何を作ったか」ではなく「**なぜ作ったか**」を話す一枚。
///
/// 1・2枚目で同じ EC 画面を見せ続けているので、ここは端末を出さずに
/// マスコットと文字に切り替える。同じ絵が3枚続くと「1画面だけのアプリ」
/// に見えてしまうため。
///
/// 機能や規模の紹介はここでは**しない**。数字を並べると、この直後の
/// コンセプト（スライド4）が機能紹介の続きに見えて山場が痩せる。
class BackgroundSlide extends FlutterDeckSlideWidget {
  const BackgroundSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/background',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const BackgroundLayout(),
    );
  }
}

/// [BackgroundSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 72, vertical: 52),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded は子に縦いっぱいの制約を渡すので、Align を挟まないと
          // 中身が上に張り付いて下に大きな余白ができる。
          Expanded(
            child: Align(alignment: Alignment.centerLeft, child: _Reasons()),
          ),
          SizedBox(width: 72),
          _Mascot(),
        ],
      ),
    );
  }
}

class _Reasons extends StatelessWidget {
  const _Reasons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('なぜ、作ったのか', style: SlideText.title),
        const SizedBox(height: 44),
        _Reason(
          number: 1,
          child: Text('新しいジャンルのゲームを\n作ってみたかった', style: SlideText.body),
        ),
        const SizedBox(height: 32),
        _Reason(
          number: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('目指したのは、', style: SlideText.body),
              const SizedBox(height: 14),
              // ✕→○ の対比で「何を捨てて何を取ったか」を一目で見せる。
              // 文字だけで書くより、読まずに構造が分かる。
              const _Choice(taken: false, text: 'ゲーム性・うまさを競うこと'),
              const SizedBox(height: 10),
              const _Choice(taken: true, text: '「あるある」と「アハ体験」'),
            ],
          ),
        ),
        const SizedBox(height: 40),
        PulseLoop(
          child: Text('「うまい」より、「わかる」。', style: SlideText.punch),
        ),
      ],
    );
  }
}

/// 理由1つ分。番号バッジは他のスライドと同じ見た目にして、
/// 「番号が付いているものは順番に読む」という約束を通しで揃えている。
class _Reason extends StatelessWidget {
  const _Reason({required this.number, required this.child});

  final int number;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: SlideColors.primary,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$number',
            style: SlideText.badge(30, SlideColors.scheme.onPrimary),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(child: child),
      ],
    );
  }
}

/// 捨てたもの（✕）と取ったもの（○）の1行。
///
/// 取った方だけを強調色にして、視線が自然に下の行へ落ちるようにする。
class _Choice extends StatelessWidget {
  const _Choice({required this.taken, required this.text});

  /// true なら「取った方」
  final bool taken;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = taken ? SlideColors.accent : SlideColors.subText;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          taken ? Icons.check_circle : Icons.cancel_outlined,
          size: 44,
          color: color,
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Text(
            text,
            style: SlideText.body.copyWith(
              color: color,
              fontWeight: taken ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class _Mascot extends StatelessWidget {
  const _Mascot();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/normal.png',
      width: 420,
      filterQuality: FilterQuality.medium,
    );
  }
}
