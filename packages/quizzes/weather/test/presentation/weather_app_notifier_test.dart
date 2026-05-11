import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/presentation/weather_app_notifier.dart';

void main() {
  group('WeatherAppNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() => container.dispose());

    test('初期状態はcityIndex=0, isRefreshing=false', () {
      final state = container.read(weatherAppProvider);
      expect(state.currentCityIndex, 0);
      expect(state.isRefreshing, isFalse);
      expect(state.expandedDate, isNull);
      expect(state.isRadarMapOpened, isFalse);
      expect(state.cities, isNotEmpty);
    });

    test('changeCity()でcurrentCityIndexが更新される', () {
      container.read(weatherAppProvider.notifier).changeCity(1);
      expect(container.read(weatherAppProvider).currentCityIndex, 1);
    });

    test('同じインデックスへのchangeCity()は状態を変更しない', () {
      final before = container.read(weatherAppProvider);
      container.read(weatherAppProvider.notifier).changeCity(0);
      final after = container.read(weatherAppProvider);
      // 同一オブジェクトのまま（stateの再代入なし）
      expect(identical(before, after), isTrue);
    });

    test('refreshWeather()でisRefreshingがtrueになり、完了後falseに戻る', () async {
      final refreshFuture =
          container.read(weatherAppProvider.notifier).refreshWeather();

      // リフレッシュ開始直後はisRefreshing=true
      expect(container.read(weatherAppProvider).isRefreshing, isTrue);

      await refreshFuture;

      // リフレッシュ完了後はisRefreshing=false
      expect(container.read(weatherAppProvider).isRefreshing, isFalse);
    });

    test('expandDailyForecast()でexpandedDateが設定される', () {
      final date = DateTime(2026, 3, 5);
      container.read(weatherAppProvider.notifier).expandDailyForecast(date);
      expect(container.read(weatherAppProvider).expandedDate, date);
    });

    test('openRadarMap()でisRadarMapOpenedがtrueになる', () {
      container.read(weatherAppProvider.notifier).openRadarMap();
      expect(container.read(weatherAppProvider).isRadarMapOpened, isTrue);
    });
  });
}
