import 'package:system/src/environment/app_environment.dart';
import 'package:system/src/firebase/crashlytics_service.dart';
import 'package:system/src/firebase/firebase_service.dart';
import 'package:system/src/firebase/remote_config_service.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    await FirebaseService.initialize(AppEnvironment.flavor);
    CrashlyticsService.setupFlutterErrorHandling();
    await RemoteConfigService.initialize();
  }
}
