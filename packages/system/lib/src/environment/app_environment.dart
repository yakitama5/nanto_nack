import 'flavor.dart';

/// アプリの実行環境を管理するクラス
/// dart-define-from-file で注入された値を String.fromEnvironment で読み込む
abstract final class AppEnvironment {
  static const _flavorName =
      String.fromEnvironment('flavor', defaultValue: 'dev');
  static const appName =
      String.fromEnvironment('appName', defaultValue: '(dev)NantoNack');
  static const androidPackageName = String.fromEnvironment(
    'androidPackageName',
    defaultValue: 'com.yakuran.nanto_nack.dev',
  );
  static const iosBundleId = String.fromEnvironment(
    'iosBundleId',
    defaultValue: 'com.yakuran.nantoNack.dev',
  );
  static const iosAppStoreId = String.fromEnvironment(
    'iosAppStoreId',
    defaultValue: '',
  );

  /// iOS App Store ID が設定されているかどうか。
  static bool get hasIosAppStoreId => iosAppStoreId.isNotEmpty;

  static Flavor get flavor => Flavor.values.byName(_flavorName);

  static bool get isDev => flavor == Flavor.dev;
  static bool get isProd => flavor == Flavor.prod;
}
