# 主要コマンド一覧

## 重要: Windows 環境での Melos 実行

Windows では `melos` 単体コマンドが動作しない場合がある。
その際は `fvm dart run melos <command>` を使用すること。

```bash
fvm dart run melos <command>
```

## 日常的なコマンド

| 用途 | コマンド |
|------|---------|
| 依存解決 | `fvm dart run melos bootstrap` |
| コード生成（全パッケージ） | `fvm dart run melos run gen:all` |
| 静的解析 | `fvm dart run melos run lint` |
| ユニットテスト | `fvm dart run melos run test:unit` |
| 全テスト | `fvm dart run melos run test:all` |

## ビルド

| 用途 | コマンド |
|------|---------|
| Web ビルド | `fvm dart run melos run build:web` |
| Android 本番 | `fvm dart run melos run build:android:prod` |
| iOS 本番 | `fvm dart run melos run build:ios:prod` |

## アプリ起動

```bash
cd apps/app_main
fvm flutter run --flavor dev --dart-define-from-file=dart_define/dev.json
```

## AI スキル（Claude Code スラッシュコマンド）

| スキル | 用途 |
|--------|------|
| `/implement <内容>` | coder エージェントで実装 |
| `/quiz-category-design` | 新クイズカテゴリ/クイズ追加の設計ガイド |
| `/tune <ファイルパス>` | Empirical Prompt Tuning でスキル・コマンドを自動改善 |
| `/commit` | コミットルールに従ってコミット |
| `/lint` | 静的解析を実行 |
| `/review` | コードレビュー |
| `/write-test` | テスト作成 |
| `/learn` | セッションでの失敗・知見を設定ファイルに記録 |

## Blackboard パターン（AI エージェントへのファイル参照指示）

| タスク | 読むべきファイル |
|--------|----------------|
| 新機能実装・設計 | `.agents/skills/4-layer-architecture.md` |
| UI・状態管理 | `.agents/skills/ui-state-rules.md` |
| DB・Firebase | `.agents/skills/data-and-logic.md` |
| テスト | `.agents/skills/testing-patterns.md` |
| Melos・パッケージ | `.agents/common/melos-monorepo.md` |
| セキュリティ | `.agents/common/security.md` |
