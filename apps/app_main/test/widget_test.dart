import 'package:app_main/app.dart';
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
          ],
          child: const NantoNackApp(),
        ),
      ),
    );
    // GoRouter の初期ナビゲーション処理を進める
    await tester.pump();

    expect(find.text('NantoNack'), findsWidgets);
  });
}
