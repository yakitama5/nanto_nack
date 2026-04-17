# NantoNack Project Guide

Flutter/Dart開発専門家として、UI/UX直感クイズアプリ「NantoNack」を構築することを任務とします。

## 対話ルール

- **言語:** すべてのやり取りは**日本語**で行うこと。
- **ユーザー想定:** Dart固有の機能に不慣れな可能性がある。コード生成時は言語仕様を解説すること。

## プロジェクト構成・コマンド

詳細は Serena メモリ（`project_overview` / `suggested_commands`）を参照。

## 実装フロー（`/implement` スキル）

analyst → planner → advisor → **coder** → reviewer → tester

計画書（`spec/*.md`）がある場合: **coder から直接開始**し、reviewer・tester を厳格に実施。

## 詳細ルール（`.agents/rules/` 配下、常時ロード）

- アーキテクチャ・スタイル: `architecture-and-style.md`
- 状態管理・禁止事項: `state-management-and-codegen.md`
- UI・レイアウト・国際化: `ui-and-navigation.md`
- データ管理・ゲームロジック: `data-and-logic.md`

以下はオンデマンドで参照（常時ロード不要）:
- コミットルール: `/commit` スキル実行時に自動適用
- テスティング: `/write-test` スキル実行時に自動適用
- クイズカテゴリ設計規約: `.agents/references/quiz-category-design.md`（新カテゴリ作成時のみ読み込む）

## コード調査の効率化

**原則: まず直接ツールを使う。Explore エージェントはスコープ不明時のみ。**

| 状況 | 手段 |
|---|---|
| ファイル・ディレクトリが特定されている | `Read` / `Grep` 直接使用 |
| バグ修正・単一ファイルの改修 | `Read` 直接使用 |
| 影響範囲が不明・複数パッケージにまたがる | Explore エージェント |

Explore 使用時の必須指定: 調査ファイル数の上限 / 「箇条書きのみ」/ 不要な横断比較の除外
