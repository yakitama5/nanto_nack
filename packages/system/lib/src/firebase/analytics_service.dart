import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firebase Analytics のラッパーサービス
class AnalyticsService {
  const AnalyticsService();

  /// クイズ開始イベントを記録する
  Future<void> logQuizStarted({required String quizId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'quiz_started',
      parameters: {'quiz_id': quizId},
    );
  }

  /// クイズ完了イベントを記録する
  Future<void> logQuizCompleted({
    required String quizId,
    required int score,
    required int failureCount,
    required int clearTimeMs,
  }) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'quiz_completed',
      parameters: {
        'quiz_id': quizId,
        'score': score,
        'failure_count': failureCount,
        'clear_time_ms': clearTimeMs,
      },
    );
  }

  /// ユーザー ID を設定する
  Future<void> setUserId(String? userId) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return const AnalyticsService();
});
