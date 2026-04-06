import 'package:firebase_core/firebase_core.dart';
import 'package:system/src/environment/flavor.dart';
import 'package:system/src/firebase/firebase_options.dart' as prod;
import 'package:system/src/firebase/firebase_options_dev.dart' as dev;

/// Firebase サービスのラッパー
class FirebaseService {
  const FirebaseService._();

  static Future<void> initialize(Flavor flavor) async {
    final options = switch (flavor) {
      Flavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
      Flavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
    };
    await Firebase.initializeApp(options: options);
  }
}
