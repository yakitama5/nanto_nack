import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:system/src/firebase/firebase_service.dart';

final _logger = Logger();

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    await _initializeFirebase();
  }

  static Future<void> _initializeFirebase() async {
    try {
      await FirebaseService.initialize();
    } catch (e) {
      if (kDebugMode) {
        _logger.w('Firebase の初期化をスキップしました: $e');
      }
    }
  }
}
