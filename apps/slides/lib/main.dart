import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:slides/slides/app_slide.dart';
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
        background: const FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(SlideColors.background),
        ),
        footer: const FlutterDeckFooterConfiguration(showSlideNumbers: true),
        progressIndicator: const FlutterDeckProgressIndicator.gradient(
          gradient: LinearGradient(
            colors: [SlideColors.primary, SlideColors.accent],
          ),
        ),
      ),
      slides: const [
        HookSlide(),
        WhySlide(),
        AppSlide(),
        WonderSlide(),
        InsightSlide(),
        // TODO(slides): スライド6（クロージング）をここに追加する
      ],
    );
  }
}
