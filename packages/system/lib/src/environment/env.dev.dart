import 'package:envied/envied.dart';

part 'env.dev.g.dart';

// ignore: avoid_classes_with_only_static_members
/// 開発環境用の機密情報を定義
/// `scripts/env/.env.dev` ファイルはGit管理対象外のため、個別に設定を行う必要あり
@Envied(path: 'scripts/env/.env.dev')
final class DevEnv {
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', obfuscate: true)
  static final String firebaseAndroidApiKey = _DevEnv.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', obfuscate: true)
  static final String firebaseIosApiKey = _DevEnv.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_API_KEY', obfuscate: true)
  static final String firebaseWebApiKey = _DevEnv.firebaseWebApiKey;
}
