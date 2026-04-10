import '../../i18n/strings.g.dart';

/// 「目的地と交通手段を選んでルートを案内する」クイズのクリア判定ユースケース
class QuizStartNavigationUseCase {
  /// コンストラクタ
  const QuizStartNavigationUseCase();

  /// 正解の目的地ID（Grand Park）
  static const correctDestinationId = 'p2';

  /// 正解の交通手段インデックス（電車 = transit）
  static const correctTransportIndex = 2;

  /// 目的地が正解かどうか
  bool isCorrectDestination(String placeId) =>
      placeId == correctDestinationId;

  /// 交通手段が正解かどうか
  bool isCorrectTransport(int transportIndex) =>
      transportIndex == correctTransportIndex;

  /// クリア条件を満たしているか
  bool isClear({required bool navigationStarted}) => navigationStarted;

  /// 失敗した理由を返す
  String? failureReason({required bool navigationStarted}) {
    if (isClear(navigationStarted: navigationStarted)) return null;
    return t.quiz3.failureReason;
  }
}
