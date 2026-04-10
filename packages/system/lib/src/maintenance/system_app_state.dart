/// アプリのシステム状態を表す sealed クラス。
///
/// 優先順位: [SystemMaintenance] > [SystemForceUpdate] > [SystemOptionalUpdate] > [SystemNormal]
sealed class SystemAppState {
  const SystemAppState();
}

/// 通常状態（メンテナンスなし・アップデート不要）
final class SystemNormal extends SystemAppState {
  const SystemNormal();
}

/// メンテナンスモード
final class SystemMaintenance extends SystemAppState {
  const SystemMaintenance({required this.message});

  /// メンテナンス画面に表示するメッセージ
  final String message;
}

/// 強制アップデート（現在のバージョンが古すぎてプレイ不可）
final class SystemForceUpdate extends SystemAppState {
  const SystemForceUpdate();
}

/// 任意アップデート（新しいバージョンが利用可能だが任意）
final class SystemOptionalUpdate extends SystemAppState {
  const SystemOptionalUpdate();
}
