# テックスタック

## フレームワーク・言語

- **Flutter** (fvm 管理) / **Dart** SDK ^3.11.3
- **Pub Workspace + Melos** モノレポ

## 主要パッケージ

| カテゴリ | パッケージ |
|---------|-----------|
| 状態管理 | `flutter_riverpod` ^2.6.1 |
| ルーティング | `go_router` ^14.8.1 |
| ローカルDB | `drift` + `drift_dev` + `build_runner` |
| バックエンド | Firebase (RemoteConfig / Crashlytics / Analytics) |
| 国際化 | `slang` + `slang_flutter` ^4.3.1 |
| レスポンシブ | `responsive_framework` ^1.5.1 |
| 日時 | `clock` ^1.1.2 |
| 静的解析 | `altive_lints` |
| テスト | `test`, `flutter_test`, `alchemist`(Golden), `patrol`(E2E), `mocktail` |
| アセット生成 | `flutter_gen` / `flutter_gen_runner` |
| 課金 | `in_app_purchase` |

## 禁止ツール（手動実装必須）

- `json_serializable`（JSON変換は手動）
- `riverpod_generator`（`@riverpod` アノテーション禁止）
- `go_router_builder`
- `flutter_hooks` / `HookWidget`
