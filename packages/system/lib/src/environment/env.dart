import 'package:envied/envied.dart';

part 'env.g.dart';

/// 機密情報を管理する Env クラス
/// .env ファイルから envied により難読化されたコードを生成
@Envied(path: '.env', obfuscate: true)
abstract final class Env {
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', defaultValue: '')
  static final String firebaseAndroidApiKey = _Env.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', defaultValue: '')
  static final String firebaseIosApiKey = _Env.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_API_KEY', defaultValue: '')
  static final String firebaseWebApiKey = _Env.firebaseWebApiKey;
}
