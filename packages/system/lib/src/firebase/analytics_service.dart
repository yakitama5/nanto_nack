import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Firebase Analytics のラッパーサービス
class AnalyticsService {
  const AnalyticsService();

  // ─────────────────────────────────────────
  // クイズ
  // ─────────────────────────────────────────

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

  /// クイズをギブアップしたイベントを記録する
  Future<void> logQuizGivenUp({required String quizId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'quiz_given_up',
      parameters: {'quiz_id': quizId},
    );
  }

  /// クイズをリトライしたイベントを記録する
  Future<void> logQuizRetried({required String quizId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'quiz_retried',
      parameters: {'quiz_id': quizId},
    );
  }

  /// クイズ時間切れイベントを記録する
  Future<void> logQuizTimeUp({required String quizId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'quiz_time_up',
      parameters: {'quiz_id': quizId},
    );
  }

  // ─────────────────────────────────────────
  // ナビゲーション
  // ─────────────────────────────────────────

  /// カテゴリー選択イベントを記録する
  Future<void> logCategorySelected({required String categoryId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'category_selected',
      parameters: {'category_id': categoryId},
    );
  }

  /// ステージ選択イベントを記録する
  Future<void> logStageSelected({
    required String stageId,
    required String categoryId,
  }) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'stage_selected',
      parameters: {
        'stage_id': stageId,
        'category_id': categoryId,
      },
    );
  }

  // ─────────────────────────────────────────
  // ホーム画面
  // ─────────────────────────────────────────

  /// プレイボタンタップイベントを記録する
  Future<void> logPlayButtonTapped() async {
    await FirebaseAnalytics.instance.logEvent(name: 'play_button_tapped');
  }

  /// プレミアムボタンタップイベントを記録する
  Future<void> logPremiumButtonTapped() async {
    await FirebaseAnalytics.instance.logEvent(name: 'premium_button_tapped');
  }

  // ─────────────────────────────────────────
  // 設定
  // ─────────────────────────────────────────

  /// テーマ変更イベントを記録する
  Future<void> logThemeChanged({required String themeMode}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'theme_changed',
      parameters: {'theme_mode': themeMode},
    );
  }

  /// UIスタイル変更イベントを記録する
  Future<void> logUiStyleChanged({required String uiStyle}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'ui_style_changed',
      parameters: {'ui_style': uiStyle},
    );
  }

  /// データリセットイベントを記録する
  Future<void> logDataReset() async {
    await FirebaseAnalytics.instance.logEvent(name: 'data_reset');
  }

  /// 外部リンクタップイベントを記録する
  Future<void> logExternalLinkTapped({required String linkName}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'external_link_tapped',
      parameters: {'link_name': linkName},
    );
  }

  // ─────────────────────────────────────────
  // プレイ制限
  // ─────────────────────────────────────────

  /// プレイ上限到達イベントを記録する
  Future<void> logPlayLimitReached({required String stageId}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'play_limit_reached',
      parameters: {'stage_id': stageId},
    );
  }

  // ─────────────────────────────────────────
  // ユーザー
  // ─────────────────────────────────────────

  /// ユーザー ID を設定する
  Future<void> setUserId(String? userId) async {
    await FirebaseAnalytics.instance.setUserId(id: userId);
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  return const AnalyticsService();
});
