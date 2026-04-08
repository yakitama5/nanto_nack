import 'package:app_main/app.dart';
import 'package:app_main/application/tutorial/tutorial_notifier.dart';
import 'package:app_main/application/weather_provider.dart';
import 'package:app_main/domain/weather/weather_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

class MockWeatherNotifier extends AsyncNotifier<WeatherInfo?>
    implements WeatherNotifier {
  @override
  Future<WeatherInfo?> build() async => null;

  @override
  Future<void> refresh() async {}
}

/// チュートリアルを完了済み状態で返すモック。
/// テスト中にチュートリアルオーバーレイが表示されるのを防ぐ。
class MockTutorialNotifier extends AsyncNotifier<TutorialState>
    implements TutorialNotifier {
  @override
  Future<TutorialState> build() async => const TutorialState(
        screen: TutorialScreen.done,
        isCompleted: true,
      );

  @override
  void advanceTo(TutorialScreen screen) {}

  @override
  Future<void> complete() async {}
}

void main() {
  testWidgets('NantoNack app smoke test', (WidgetTester tester) async {
    // main.dart と同様に TranslationProvider でラップする。
    // NantoNackApp 内で TranslationProvider.of(context) を呼ぶため、
    // ProviderScope の外側に TranslationProvider が必要。
    await tester.pumpWidget(
      TranslationProvider(
        child: ProviderScope(
          overrides: [
            weatherProvider.overrideWith(() => MockWeatherNotifier()),
            // チュートリアルを完了済みにしてオーバーレイを抑制する
            tutorialNotifierProvider
                .overrideWith(() => MockTutorialNotifier()),
            // 音声ロードをスキップしてCI環境での audioplayers 依存を排除する
            clearSoundProvider.overrideWith((ref) async => ''),
          ],
          child: const NantoNackApp(),
        ),
      ),
    );
    // GoRouter の初期ナビゲーション処理を完了させる。
    // CI/ローカル環境問わず安定して動作させるため複数フレームを進める。
    // 1フレーム目: setNewRoutePath の非同期処理完了 + notifyListeners
    // 2フレーム目: RouterDelegate.build() でホーム画面がレンダリング
    // 3フレーム目: post-frame callback など遅延処理の完了
    await tester.pump();
    await tester.pump();
    await tester.pump();

    expect(find.text('NantoNack'), findsWidgets);
  });
}
