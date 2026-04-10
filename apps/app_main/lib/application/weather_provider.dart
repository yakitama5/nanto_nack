import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../domain/weather/weather_info.dart';
import '../infrastructure/weather_repository_provider.dart';

/// 現在の天気情報を管理するProvider。
///
/// 位置情報の取得を試みた上で OpenWeather API をリクエストする。
/// 位置情報の取得に失敗した場合やAPI取得に失敗した場合は null を返し、
/// 呼び出し元は「晴れ」を表示するか DailyScene フォールバック（時間帯ベースのグラデーション）を使う。
class WeatherNotifier extends AsyncNotifier<WeatherInfo?> {
  @override
  Future<WeatherInfo?> build() => _fetch();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }

  Future<WeatherInfo?> _fetch() async {
    final repository = ref.read(weatherRepositoryProvider);
    try {
      final position = await _resolvePosition();
      if (position == null) return null;

      return await repository.getCurrentWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (_) {
      // API取得失敗時は null を返してフォールバック表示
      return null;
    }
  }

  /// 端末の現在位置を解決する。
  ///
  /// パーミッションの状態に応じて以下のように動作する：
  /// - 未確認 → ユーザーにリクエスト → 許可されれば位置情報を返す
  /// - 拒否（`denied`） → リクエスト後も拒否なら null
  /// - 永久拒否（`deniedForever`） → ダイアログを出せないため即 null
  /// - 許可済み → 現在位置を返す
  Future<Position?> _resolvePosition() async {
    // サービス自体が無効（機内モード等）の場合は即フォールバック
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return null;
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        // 天気取得には粗い精度で十分（バッテリー消費を抑える）
        accuracy: LocationAccuracy.low,
      ),
    );
  }
}

final weatherProvider =
    AsyncNotifierProvider<WeatherNotifier, WeatherInfo?>(WeatherNotifier.new);
