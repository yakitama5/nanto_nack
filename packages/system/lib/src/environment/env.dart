import 'package:envied/envied.dart';

part 'env.g.dart';

// ignore: avoid_classes_with_only_static_members
/// 本番環境用の機密情報を定義
/// `scripts/env/.env` ファイルはGit管理対象外のため、個別に設定を行う必要あり
@Envied(path: 'scripts/env/.env')
final class ProductionEnv {
  @EnviedField(varName: 'FIREBASE_ANDROID_API_KEY', obfuscate: true)
  static final String firebaseAndroidApiKey =
      _ProductionEnv.firebaseAndroidApiKey;

  @EnviedField(varName: 'FIREBASE_IOS_API_KEY', obfuscate: true)
  static final String firebaseIosApiKey = _ProductionEnv.firebaseIosApiKey;

  @EnviedField(varName: 'FIREBASE_WEB_API_KEY', obfuscate: true)
  static final String firebaseWebApiKey = _ProductionEnv.firebaseWebApiKey;
}
