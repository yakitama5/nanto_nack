# Melos Monorepo Rules

## パッケージ構造

```
<root>/
├── apps/
│   └── app_main/           # メインアプリ（Flutter）
└── packages/
    ├── system/             # Firebase初期化・RemoteConfig・Analytics・Crashlytics
    ├── quiz_core/          # クイズ共通コア（共有ドメイン・コンポーネント）
    ├── geolocator_windows_stub/  # Windows向けスタブ
    └── quizzes/            # クイズカテゴリパッケージ群
        ├── alarm/
        ├── calendar/
        ├── chat/
        ├── comic/
        ├── mail/
        ├── map/
        ├── news/
        ├── payment/
        ├── shopping/
        ├── sns/
        ├── streaming/
        └── todo/
```

## パッケージ境界ルール

- 他パッケージの**内部実装を直接参照することを禁止**する。必ず公開インターフェース（`lib/` 直下の公開API）を通じて連携すること。
- `quizzes/*` パッケージは `quiz_core` に依存してよいが、互いに依存してはならない。
- `app_main` はすべてのパッケージを利用できる（依存グラフの最上位）。
- `domain` 層のコードが `infrastructure` 層を直接参照することを禁止する。

## コマンド実行方法

**Windows環境では `melos` を単体で実行できないことが多い。必ず以下の形式を使用すること:**

```bash
fvm dart run melos <command>
# 例:
fvm dart run melos run lint
fvm dart run melos run gen:all
fvm dart run melos run test:unit
```

## 利用可能なMelosスクリプト

| スクリプト | 説明 |
|---|---|
| `gen:all` | すべてのコード生成を実行（build_runner + slang） |
| `gen:build` | build_runner によるコード生成 |
| `gen:slang` | slang による i18n コード生成 |
| `gen:diff:main` | mainブランチとの差分パッケージのみ生成 |
| `lint` | 静的解析（altive_lints）を全パッケージに対して実行 |
| `test:unit` | ユニットテストのみ実行 |
| `test:all` | 全テスト実行 |
| `build:web` | Web向けビルド |
| `build:android:prod` | Android本番ビルド |
| `build:ios:prod` | iOS本番ビルド |

## 新規パッケージ追加時の注意

- `melos.yaml` の `packages:` に新パッケージのパスを追加すること。
- 追加後は `fvm dart run melos bootstrap` で依存関係を解決すること。
