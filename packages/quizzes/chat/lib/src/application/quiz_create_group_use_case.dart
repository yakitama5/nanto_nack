/// 「グループを作成する」クイズのクリア判定ユースケース
class QuizCreateGroupUseCase {
  const QuizCreateGroupUseCase();

  /// グループが作成されていればクリア
  bool isClear({required bool groupCreated}) {
    return groupCreated;
  }

  /// メンバーが最低2人以上選択されているか確認
  bool hasEnoughMembers({required int selectedCount}) {
    return selectedCount >= 2;
  }

  /// 失敗理由を返す（クリアなら null）
  String? failureReason({required bool groupCreated}) {
    if (isClear(groupCreated: groupCreated)) return null;
    return 'グループを作成してください';
  }
}
