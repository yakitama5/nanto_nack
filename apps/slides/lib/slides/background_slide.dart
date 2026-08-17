import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/speaker_notes.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/visuals.dart';

/// 3枚目 (1:05-1:35)
///
/// 「何を作ったか」ではなく「**なぜ作ったか**」を話す一枚。
///
/// 1・2枚目で同じ EC 画面を見せ続けているので、ここは端末を出さずに
/// マスコットと図に切り替える。同じ絵が3枚続くと「1画面だけのアプリ」
/// に見えてしまうため。
///
/// 機能や規模の紹介はここでは**しない**。数字を並べると、この直後の
/// コンセプト（スライド4）が機能紹介の続きに見えて山場が痩せる。
class BackgroundSlide extends FlutterDeckSlideWidget {
  const BackgroundSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/background',
            title: 'なぜ作ったか',
            speakerNotes: SpeakerNotes.backgroundSlide,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 56),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(child: _Reasons()),
          const SizedBox(width: 56),
          Image.asset(
            'assets/images/normal.png',
            width: 300,
            filterQuality: FilterQuality.medium,
          ),
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
      // Expanded の中なので縦いっぱいの制約が来る。既定の start のままだと
      // 中身が上に張り付いて、下に大きな余白ができる。
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('なぜ、作ったのか', style: SlideText.title),
        const SizedBox(height: 48),
        // 理由①: 既存ジャンルの隣に空席を1つ置いて「新しさ」を見せる。
        // 図だけでは意図が伝わらないので、一文だけ添える。
        _Reason(
          number: 1,
          caption: '新しいジャンルを、作りたかった。',
          visual: Row(
            children: [
              const IconTile(icon: Icons.extension, label: 'パズル', size: 124),
              const SizedBox(width: 20),
              const IconTile(icon: Icons.quiz, label: 'クイズ', size: 124),
              const SizedBox(width: 20),
              IconTile(
                icon: Icons.auto_awesome,
                label: '？',
                size: 124,
                color: SlideColors.accent,
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        // 理由②: 「A よりも B」を帯の長さの差で見せる。
        // どちらを重く見たかが、読まずに分かる。
        const _Reason(
          number: 2,
          visual: RatioBar(
            droppedLabel: 'ゲーム性',
            takenLabel: '「あるある」と「アハ体験」',
          ),
        ),
        const SizedBox(height: 44),
        Padding(
          padding: const EdgeInsets.only(left: 84),
          child: Text('「うまい」より、「わかる」。', style: SlideText.punch),
        ),
      ],
    );
  }
}

/// 理由1つ分。番号バッジ＋図（＋必要なら一文）。
class _Reason extends StatelessWidget {
  const _Reason({
    required this.number,
    required this.visual,
    this.caption,
  });

  final int number;
  final Widget visual;

  /// 図だけでは意図が伝わらないときにだけ添える一文。
  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NumberBadge(number, size: 56),
        const SizedBox(width: 28),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              visual,
              if (caption != null) ...[
                const SizedBox(height: 16),
                Text(caption!, style: SlideText.body),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
