# UI, State Management & Navigation Rules (オンデマンド参照)

> **いつ読む:** UI実装・状態管理・ルーティング・国際化作業時に読み込むこと。

<agent_workflow_and_boundaries>

## 状態管理 (Riverpod)

**使用ライブラリ:** `flutter_riverpod`

**実装方法:** 標準のProviderを直接定義すること。

| Provider種別 | 用途 |
|---|---|
| `Provider` | 単純な値・依存注入 |
| `NotifierProvider` | 同期的な状態管理 |
| `AsyncNotifierProvider` | 非同期状態管理 |
| `StateProvider` | シンプルな単一値の状態 |

**CRITICAL 禁止事項:**
- `riverpod_generator`（`@riverpod` アノテーション）は使用禁止
- `flutter_hooks`（HookWidget等）は使用禁止
- 常に `ConsumerWidget` または `ConsumerStatefulWidget` を使用すること

## コード生成の制限

### ✅ 許可されているツール
1. `flutter_gen`（アセット生成）
2. `drift_dev` & `build_runner`（ローカルDB）
3. `slang` & `build_runner`（多言語化）

### ❌ 禁止されているツール（手動で書くこと）
- `json_serializable`（JSON変換は手動実装）
- `riverpod_generator`
- `go_router_builder`
- その他、上記「許可リスト」にないすべての生成ツール

## autoDispose Provider での非同期処理

`autoDispose` を付けた Provider では、`await` 中に provider が dispose されると
`ref.read(...)` で「Cannot use the Ref after it has been disposed」が発生する。

**ルール:** `await` をまたいで `ref.read` が必要な処理（DB保存・Analytics等）は
`await` の前に完了させるか、必要な値を事前に変数へ取り出しておくこと。

```dart
// ❌ 禁止
await hapticFeedback.playSuccessFeedback();
await _saveResult(isCleared: true, elapsedMs: elapsed); // ← ref.read 含む

// ✅ 正しい
await _saveResult(isCleared: true, elapsedMs: elapsed);
await hapticFeedback.playSuccessFeedback();
```

## Notifier の状態ガード

クイズ完了・giveUp・timeUp 等の終了フロー後に操作が届いても State が壊れないよう、
各 public action の先頭で現在ステータスを確認してからロジックを実行すること。

```dart
void clearSelection() {
  if (state.status != QuizStatus.playing) return; // ← ステータスガード
  state = state.copyWith(...);
}
```

## State が変化しない場合の早期 return

`copyWith` を呼ぶ前に既に目的の状態かどうかをチェックし、変化がなければ早期 return すること。
不要な `copyWith` はリビルドを引き起こす。

```dart
// ❌ 禁止（hintUsed が既に true でも毎回 copyWith が走る）
void useHint() {
  if (state.status != QuizStatus.playing) return;
  state = state.copyWith(hintUsed: true);
}

// ✅ 正しい（冪等ガードを追加してリビルドを抑制）
void useHint() {
  if (state.status != QuizStatus.playing) return;
  if (state.hintUsed) return;            // ← 変更対象フィールドのチェック
  state = state.copyWith(hintUsed: true);
}
```

## ルーティング

- **GoRouter:** 宣言的ナビゲーションのために `go_router` を使用。
- `go_router_builder` は使用せず、ルート定義は手動で行うこと。

## レイアウト・レスポンシブ

- **Responsive Framework:** `responsive_framework` を使用してマルチデバイス対応。
- Desktop（Web/Mac/Windows）: タブレットサイズ（最大800px）で固定。左右にマージンを表示する中央配置レイアウト。

## 国際化（i18n）

- **Slang:** `slang` および `slang_flutter` を使用。
- JSON/YAMLベースで定義し、コード生成を行う。型安全なアクセスを優先すること。
- `tooltip`・`semanticsLabel` 等の補助テキストも含め、UIに表示されるすべての文字列をハードコードしないこと。

## optional callback とウィジェットラッパー

コールバック引数が `null` になり得る場合、そのコールバックを必要とするウィジェットラッパーは
コールバックが非 null のときのみ適用すること。

```dart
// ❌ 禁止
if (isSelectionMode) return tile;
return Dismissible(..., onDismissed: onDismissed); // null の可能性がある

// ✅ 正しい
if (isSelectionMode || onDismissed == null) return tile;
return Dismissible(..., onDismissed: onDismissed!);
```

</agent_workflow_and_boundaries>
