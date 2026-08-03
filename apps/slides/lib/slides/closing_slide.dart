import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:slides/theme.dart';

/// 6枚目 (2:45-3:00)
///
/// 言い切って終わる15秒。
///
/// 本編は全て左寄せの2カラムなので、ここだけ中央寄せにして「終わり」を
/// 形で伝える。紫の全面はコンセプトのスライド4に取ってあるので、
/// ここは背景を変えずに文字の大きさだけで締める。
class ClosingSlide extends FlutterDeckSlideWidget {
  const ClosingSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/closing'),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const ClosingLayout());
  }
}

/// [ClosingSlide] の中身。`FlutterDeckApp` の外でも組めるよう切り出している。
class ClosingLayout extends StatelessWidget {
  const ClosingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 96, vertical: 56),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Statement(),
            SizedBox(height: 52),
            _Rule(),
            SizedBox(height: 52),
            _AppInfo(),
            SizedBox(height: 44),
            Text('このあと、実機を触ってください。', style: SlideText.lead),
          ],
        ),
      ),
    );
  }
}

/// 言い切りの一文。ここだけ本文より一段大きくして最後の視線を集める。
class _Statement extends StatelessWidget {
  const _Statement();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: '文字が読めなくても伝わるUIが、\n'),
          TextSpan(text: 'いいUI。', style: TextStyle(color: SlideColors.primary)),
        ],
      ),
      textAlign: TextAlign.center,
      style: SlideText.title.copyWith(fontSize: 76, height: 1.4),
    );
  }
}

class _Rule extends StatelessWidget {
  const _Rule();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 4,
      decoration: BoxDecoration(
        color: SlideColors.primary.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

/// アプリ名と入手方法。QRは使わないので、検索で辿り着ける形にする。
class _AppInfo extends StatelessWidget {
  const _AppInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/smile.png',
          width: 180,
          filterQuality: FilterQuality.medium,
        ),
        const SizedBox(width: 40),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 出典: packages/quiz_core/assets/i18n/ja.i18n.json の app
            // このスライドの強調色は紫だけに揃えたいので、赤の punch は使わない。
            Text(
              'NantoNack',
              style: SlideText.punch.copyWith(color: SlideColors.text),
            ),
            const SizedBox(height: 2),
            const Text('UI/UX直感クイズ', style: SlideText.body),
            const SizedBox(height: 18),
            const Text(
              'App Store / Google Play で配信中',
              style: SlideText.caption,
            ),
          ],
        ),
      ],
    );
  }
}
