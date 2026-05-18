import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/weather_mock_data.dart';
import 'weather_app_state.dart';

final weatherAppProvider =
    AutoDisposeNotifierProvider<WeatherAppNotifier, WeatherAppState>(
  WeatherAppNotifier.new,
);

/// 天気アプリの共通状態を管理する Notifier。
///
/// 全4クイズで共有される UI 状態（都市インデックス、リフレッシュ状態など）を一元管理する。
/// 各クイズの Notifier がこのプロバイダーを listen してクリア判定に使用する。
class WeatherAppNotifier extends AutoDisposeNotifier<WeatherAppState> {
  bool _disposed = false;

  @override
  WeatherAppState build() {
    ref.onDispose(() => _disposed = true);
    return WeatherAppState(
      cities: buildMockCities(),
      currentCityIndex: 0,
    );
  }

  void changeCity(int index) {
    if (index < 0 || index >= state.cities.length) {
      return;
    }
    if (index == state.currentCityIndex) {
      return;
    }
    state = state.copyWith(currentCityIndex: index);
  }

  Future<void> refreshWeather() async {
    state = state.copyWith(isRefreshing: true);
    // 実際のAPI呼び出しを模倣する1秒の遅延
    await Future<void>.delayed(const Duration(seconds: 1));
    if (_disposed) return;
    state = state.copyWith(
      isRefreshing: false,
      cities: buildMockCities(),
    );
  }

  void expandDailyForecast(DateTime date) {
    state = state.copyWith(expandedDate: date);
  }

  void openRadarMap() {
    state = state.copyWith(isRadarMapOpened: true);
  }
}
