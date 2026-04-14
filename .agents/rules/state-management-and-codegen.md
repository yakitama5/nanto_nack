# State Management & Code Generation Rules

## ⚙️ State Management (Riverpod)

- **使用ライブラリ:** `flutter_riverpod`
- **実装方法:** **標準のProviderを直接定義すること。**
  - `Provider`, `NotifierProvider`, `AsyncNotifierProvider`, `StateProvider` 等を適切に使い分ける。
- **禁止事項 (CRITICAL):**
  - **`riverpod_generator` (@riverpodアノテーション) は使用禁止。**
  - **`flutter_hooks` (HookWidget等) は使用禁止。**
  - 常に `ConsumerWidget` または `ConsumerStatefulWidget` を使用すること。

## 🔗 Code Generation (コード生成の制限)

以下の許可されたツール以外での自動生成は行わず、手動で実装すること。

### ✅ 許可されているツール

1. `flutter_gen` (アセット生成)
2. `drift_dev` & `build_runner` (ローカルDB)
3. `slang` & `build_runner` (多言語化)

### ❌ 禁止されているツール (手動で書くこと)

- `json_serializable` (JSON変換は手動実装)
- `riverpod_generator`
- `go_router_builder`
- その他、上記「許可リスト」にないすべての生成ツール

## ⚠️ autoDispose Provider での非同期処理

`autoDispose` を付けた Provider では、`await` 中に provider が dispose されると
`ref.read(...)` で「Cannot use the Ref after it has been disposed」が発生する。

**ルール:** `await` をまたいで `ref.read` が必要な処理（DB保存・Analytics等）は
`await` の**前に**完了させるか、必要な値を事前に変数へ取り出しておくこと。

```dart
// ❌ 禁止（haptic を await している間に dispose → ref.read が例外）
await hapticFeedback.playSuccessFeedback();
await _saveResult(isCleared: true, elapsedMs: elapsed); // ← ref.read 含む

// ✅ 正しい（先に ref.read を含む処理を完了させる）
await _saveResult(isCleared: true, elapsedMs: elapsed);
await hapticFeedback.playSuccessFeedback();
```

## 🛡️ Notifier の public action に状態ガードを付ける

クイズ完了・giveUp・timeUp 等の終了フロー後に操作が届いても State が壊れないよう、
各 public action の先頭で現在ステータスを確認してからロジックを実行すること。

```dart
void clearSelection() {
  if (state.status != QuizStatus.playing) return; // ← ガード
  state = state.copyWith(...);
}
```
