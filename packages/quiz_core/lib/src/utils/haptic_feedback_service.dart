import 'package:flutter/services.dart';

/// クイズ操作に対するハプティクスフィードバックを制御するサービス
///
/// BGMは実装せず、操作フィードバックに特化する。
class HapticFeedbackService {
  const HapticFeedbackService();

  /// 正解・成功操作のフィードバック（軽い振動）
  Future<void> playSuccessFeedback() => HapticFeedback.lightImpact();

  /// ミスタップ・失敗操作のフィードバック（重い振動）
  Future<void> playErrorFeedback() => HapticFeedback.heavyImpact();
}

/// アプリ全体で使い回せるシングルトンインスタンス
const hapticFeedback = HapticFeedbackService();
