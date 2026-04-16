# データ管理・ゲームロジック

## ローカルDB (Drift)

- `drift` を使用
- プレイデータ: `isCleared`, `clearTimeMs`, `score`, `failureCount` を保存・永続化
- テーブル定義詳細: `docs/table-design.md` を参照

## バックエンド (Firebase)

`packages/system` パッケージ内で初期化・管理:
- RemoteConfig
- Crashlytics
- Analytics

## ゲームロジック

- **ステージ解放**: 前のステージが `isCleared == true` になった場合のみ次を解放（順次解放方式）
- **課金 (IAP)**: `in_app_purchase` を使用。広告は原則排除
- **制限管理**: 1日のプレイ回数制限・解除フラグは `system` パッケージで一括管理

## UI・ナビゲーション

### ルーティング
- `go_router` を使用（宣言的ナビゲーション）
- `go_router_builder` は使用禁止（ルート定義は手動）

### レスポンシブ
- `responsive_framework` を使用
- Desktop (Web/Mac/Windows): タブレットサイズ（最大800px）で固定、コンテンツ中央寄せ

### optional callback とウィジェットラッパー

```dart
// ✅ 正しい（onDismissed が null なら Dismissible でラップしない）
if (isSelectionMode || onDismissed == null) return tile;
return Dismissible(..., onDismissed: onDismissed!);
```
