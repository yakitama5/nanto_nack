import 'package:geolocator_platform_interface/geolocator_platform_interface.dart';

/// Windows 向け geolocator スタブ実装。
///
/// NuGet（WinLocation）への依存を排除するため、位置情報サービスを
/// 常に「無効」として扱い、呼び出し元のフォールバック処理に委ねる。
/// 天気機能など位置情報が不要な場合でも安全にビルドできる。
class GeolocatorWindows extends GeolocatorPlatform {
  /// Flutter のプラグイン登録機構により自動で呼ばれる。
  static void registerWith() {
    GeolocatorPlatform.instance = GeolocatorWindows();
  }

  /// Windows では位置情報サービスを無効として返す。
  @override
  Future<bool> isLocationServiceEnabled() async => false;

  @override
  Future<LocationPermission> checkPermission() async =>
      LocationPermission.deniedForever;

  @override
  Future<LocationPermission> requestPermission() async =>
      LocationPermission.deniedForever;

  @override
  Future<Position?> getLastKnownPosition({
    bool forceLocationManager = false,
  }) async =>
      null;

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) =>
      throw UnimplementedError(
        'getCurrentPosition() is not supported on Windows.',
      );

  @override
  Stream<Position> getPositionStream({
    LocationSettings? locationSettings,
  }) =>
      throw UnimplementedError(
        'getPositionStream() is not supported on Windows.',
      );

  @override
  Future<bool> openAppSettings() async => false;

  @override
  Future<bool> openLocationSettings() async => false;

  @override
  Future<LocationAccuracyStatus> getLocationAccuracy() async =>
      LocationAccuracyStatus.reduced;
}
