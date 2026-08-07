import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:slides/slides/background_slide.dart';
import 'package:slides/slides/closing_slide.dart';
import 'package:slides/slides/hook_slide.dart';
import 'package:slides/slides/insight_slide.dart';
import 'package:slides/slides/why_slide.dart';
import 'package:slides/slides/wonder_slide.dart';
import 'package:slides/theme.dart';

void main() {
  runApp(
    TranslationProvider(
      child: const ProviderScope(child: SlidesApp()),
    ),
  );
}

class SlidesApp extends StatelessWidget {
  const SlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      // フッターやスライド番号など、flutter_deck が自前で描く部分にも
      // 同じ ColorScheme を渡す。ここを省くと flutter_deck の既定色が
      // 混ざって、スライド本体との色がずれる。
      lightTheme: FlutterDeckThemeData.fromTheme(
        ThemeData(
          colorScheme: SlideColors.scheme,
          textTheme: SlideText.deckTextTheme(),
        ),
      ),
      // **明示的に light に固定する。** 既定の `ThemeMode.system` だと
      // 発表するPCがダークモードのときに flutter_deck 側だけ暗い配色になり、
      // スライド本体（常に明るい配色）と食い違う。
      themeMode: ThemeMode.light,
      configuration: FlutterDeckConfiguration(
        // スライドを 1920x1080 の固定キャンバスとして描き、
        // 実際のウィンドウサイズには FittedBox で拡大縮小して合わせる。
        //
        // 既定の FlutterDeckSlideSize.responsive() はウィンドウサイズを
        // そのまま使うため、投影先のモニター解像度によって文字の大きさや
        // 余白の比率が変わり、小さい画面ではレイアウトが溢れる。
        // 固定にすることで、どのモニターでも見え方が一致する。
        slideSize: FlutterDeckSlideSize.fromAspectRatio(
          aspectRatio: const FlutterDeckAspectRatio.ratio16x9(),
        ),
        background: FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(SlideColors.background),
        ),
        footer: const FlutterDeckFooterConfiguration(showSlideNumbers: true),
        // 進捗バーは Primary（紫）→ Secondary（赤）。配色の2色をそのまま使う。
        progressIndicator: FlutterDeckProgressIndicator.gradient(
          gradient: LinearGradient(
            colors: [SlideColors.primary, SlideColors.accent],
          ),
        ),
      ),
      slides: const [
        HookSlide(),
        WhySlide(),
        BackgroundSlide(),
        WonderSlide(),
        InsightSlide(),
        ClosingSlide(),
      ],
    );
  }
}
