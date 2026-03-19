import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

/// Firebase サービスのラッパー
/// Firebase を使用するには firebase_options.dart を設定してください
class FirebaseService {
  const FirebaseService._();

  static Future<void> initialize() async {
    // TODO: Firebase プロジェクトを設定後、以下のコメントを外してください
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    if (kDebugMode) {
      _logger.i('Firebase: 設定ファイル未作成のためスキップ');
    }
  }
}
