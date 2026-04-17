coder エージェントを使って実装を行ってください。

## 実装内容

$ARGUMENTS

## coder エージェントへの指示

以下の規約を必ず守って実装してください:

### CRITICAL ルール

- **Provider**: `riverpod_generator` (@riverpod) は使用禁止。手動で `Provider`, `NotifierProvider` 等を定義すること
- **Widget**: `flutter_hooks` は禁止。必ず `ConsumerWidget` または `ConsumerStatefulWidget` を使用すること
- **JSON変換**: `json_serializable` は禁止。手動実装すること
- **日時取得**: `DateTime.now()` は禁止。必ず `clock.now()` を使用すること
- **`copyWith`**: モデルクラスには必ず手動で `copyWith` メソッドを実装すること

### 新クイズカテゴリを追加する場合

`.agents/references/quiz-category-design.md` を必ず読み込んでから実装すること。

### 実装後の必須チェック

1. `fvm dart run melos run lint` を実行し、すべての警告をゼロにする
2. 対応するユニットテスト（または Widget テスト）を実装する
3. コミットルールに従い、適切なラベルと「Why」を含めてコミットする
