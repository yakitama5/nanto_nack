/// アプリの実行環境を管理するクラス
/// dart-define-from-file で注入された値を String.fromEnvironment で読み込む
abstract final class AppEnvironment {
  static const flavor = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  static const appName =
      String.fromEnvironment('APP_NAME', defaultValue: 'NantoNack Dev');
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://dev-api.example.com',
  );

  static bool get isDev => flavor == 'dev';
  static bool get isProd => flavor == 'prod';
}
