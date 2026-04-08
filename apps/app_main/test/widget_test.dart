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
    // アプリは /splash から起動するため、スプラッシュのフォールバックタイムアウト
    // （5秒）を経過させてホーム画面（/）への遷移を完了させる。
    // テスト環境では Lottie アニメーションが完了するかタイムアウトするかに関わらず
    // 仮想クロックを6秒進めることでホーム画面への遷移を保証する。
    await tester.pump(const Duration(seconds: 6));
    // GoRouter のナビゲーション処理を完了させる
    await tester.pump();
    await tester.pump();

    expect(find.text('NantoNack'), findsWidgets);
  });
}
