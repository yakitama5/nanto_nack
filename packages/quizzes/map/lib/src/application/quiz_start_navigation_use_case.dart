import '../../i18n/strings.g.dart';

/// 「ルート案内を開始する」クイズのクリア判定ユースケース
class QuizStartNavigationUseCase {
  /// コンストラクタ
  const QuizStartNavigationUseCase();

  /// クリア条件を満たしているか
  bool isClear({required bool navigationStarted}) => navigationStarted;

  /// 失敗した理由を返す
  String? failureReason({required bool navigationStarted}) {
    if (isClear(navigationStarted: navigationStarted)) {
      return null;
    }
    // UIへのメッセージとして直接用いるため
    return t.quiz3.failureReason;
  }
}
