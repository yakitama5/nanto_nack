import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/shopping.dart';

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
      configuration: const FlutterDeckConfiguration(
        background: FlutterDeckBackgroundConfiguration(
          light: FlutterDeckBackground.solid(Color(0xFFF5F3FA)),
        ),
      ),
      slides: const [HookSlide()],
    );
  }
}

/// スパイク用スライド。
///
/// 実物の [ShoppingApp] を端末サイズのコンテナで描画し、
/// 文字がカスタム言語（xx ロケール）で表示されることを確認する。
class HookSlide extends FlutterDeckSlideWidget {
  const HookSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/hook'),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Center(child: _DeviceFrame()),
    );
  }
}

/// 端末サイズに固定した領域にアプリ UI を描画する。
///
/// [ShoppingApp] は電話の縦画面前提のレイアウトなので、
/// 16:9 のスライドに載せるには固定サイズ + スケーリングが要る。
class _DeviceFrame extends StatelessWidget {
  const _DeviceFrame();

  static const _width = 390.0;
  static const _height = 844.0;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: _width,
        height: _height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.black87, width: 8),
        ),
        child: MediaQuery(
          data: const MediaQueryData(size: Size(_width, _height)),
          // ShoppingApp は ShoppingAppTheme などの ThemeExtension を
          // Theme.of(context) から取得するため、アプリ本体と同じ
          // AppTheme を被せる必要がある。NotoSansJP もここで供給される。
          child: Theme(
            data: AppTheme.light(),
            child: ShoppingApp(
              cart: const ShoppingCart(),
              onAddToCart: (_) {},
              onUpdateQuantity: (_, __) {},
              onRemoveFromCart: (_) {},
              onPurchase: () {},
              quizStatus: QuizStatus.playing,
              remainingSeconds: 56,
              missionText: '水を2つ買おう',
              hintUsed: false,
              timeLimitSeconds: 60,
              cartBottomSheetBuilder: (context) => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
