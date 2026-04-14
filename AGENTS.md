# 🤖 NantoNack Project Guide

Flutter/Dart開発専門家として、UI/UX直感クイズアプリ「NantoNack」を構築することを任務とします。

## 🤝 対話ルール

- **言語:** すべてのやり取りは**日本語**で行うこと（計画・回答・コメント含む）。
- **ユーザー想定:** Dart固有の機能に不慣れな可能性がある。コード生成時は言語仕様を解説すること。

## 🏗️ プロジェクト構成

**Pub Workspace + Melos** モノレポ。バージョン管理は **fvm** を使用（`fvm` コマンド必須）。

- `apps/app_main/`: メインアプリ（状態管理・ルーティング）
- `packages/system/`: 基盤（Firebase / Drift / IAP）
- `packages/quiz_core/`: 共通コンポーネント
- `packages/quizzes/<category>/`: カテゴリ別ドメイン

## 🛠️ 主要コマンド

| 用途 | コマンド |
|------|---------|
| 依存解決 | `melos bootstrap` |
| コード生成 | `melos run generate` |
| 静的解析 | `melos run lint` |
| テスト実行 | `melos run test:all` |

## 🔄 サブエージェント改善ループ

実装タスクは以下のフローで進める。♻️ のステップは指摘事項がなくなるまで反復する。

1. **[main]** 要求を理解し各エージェントに指示
2. **[analyst]** コードベースを解析し影響範囲・規約違反を特定
3. **[planner]** 解析結果を元に実装計画を策定
4. **[advisor]** 計画をレビュー。UI/UX関連は `design-reviewer` と連携。指摘があれば `planner` に差し戻し ♻️
5. **[coder]** 承認済み計画を実装
6. **[reviewer]** 実装をレビュー。指摘があれば `coder` に差し戻し ♻️
7. **[tester]** テストを設計・実行。問題があれば `coder` に差し戻し ♻️
8. **[main]** 成果物全体を確認し完了を判断

## 📚 設計ドキュメント

実装・レビュー時は `docs/` 配下の設計資料を必ず参照すること。

- `docs/table-design.md`: ローカルDB（Drift）のテーブル定義（StageRecords / PlayLogs / UserProfiles）
- `docs/custom-language-design.md`: カスタム言語（異世界文字）の変換仕様とマッピング表
- `docs/quizzes/<category>.md`: カテゴリ別クイズ一覧・ミッション・クリア条件の仕様

## 📋 詳細ルール

詳細な技術規約は `.agents/rules/` 配下の各ファイルに従ってください。

- アーキテクチャ・スタイル: `architecture-and-style.md`
- 状態管理・禁止事項: `state-management-and-codegen.md`
- UI・レイアウト・国際化: `ui-and-navigation.md`
- データ管理・ゲームロジック: `data-and-logic.md`
- テスティング: `testing.md`
- Gitコミットルール: `commit_rule.md`
