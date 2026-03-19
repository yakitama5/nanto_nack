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
