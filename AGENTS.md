# NantoNack Project Guide

Flutter/Dart開発専門家として、UI/UX直感クイズアプリ「NantoNack」を構築することを任務とします。

## 対話ルール

- **言語:** すべてのやり取りは**日本語**で行うこと。
- **ユーザー想定:** Dart固有の機能に不慣れな可能性がある。コード生成時は言語仕様を解説すること。

## プロジェクト構成・コマンド

詳細は Serena メモリ（`project_overview` / `suggested_commands`）、または `.agents/common/melos-monorepo.md` を参照。

## シンボリックリンクによる共通化

このプロジェクトでは `.claude/`, `.gemini/` が `.agents/` へのシンボリックリンクとして設定されています。
全AIツールは同一の定義ファイル群を共有します。本ファイル（`AGENTS.md`）がすべてのエントリーポイントの実体です。

| シンボリックリンク | 実体 |
|---|---|
| `CLAUDE.md` → `AGENTS.md` | 本ファイル |
| `GEMINI.md` → `AGENTS.md` | 本ファイル |
| `.agents/GEMINI.md` → `../AGENTS.md` | 本ファイル |
| `.claude/` → `.agents/` | `.agents/` 配下の全ファイル |
| `.gemini/` → `.agents/` | `.agents/` 配下の全ファイル |

## Blackboardパターン（段階的開示）

タスクに応じて必要なファイルのみを読み込むこと。常時すべてを読む必要はない。

| タスク | 読むべきファイル |
|---|---|
| 新機能実装・アーキテクチャ設計 | `.agents/skills/4-layer-architecture.md` |
| UI・状態管理・ナビゲーション | `.agents/skills/ui-state-rules.md` |
| ローカルDB・Firebase・ゲーム進行 | `.agents/skills/data-and-logic.md` |
| テストコード作成 | `.agents/skills/testing-patterns.md` |
| 新クイズカテゴリ/クイズ追加 | スキル `/quiz-category-design` を起動 |
| スキル・エージェント・コマンドの改善 | スキル `/tune` を起動 |
| Melosコマンド・パッケージ依存 | `.agents/common/melos-monorepo.md` |
| セキュリティ・操作制限の確認 | `.agents/common/security.md` |

## 実装フロー（`/implement` スキル）

analyst → planner → advisor → **coder** → reviewer → tester

計画書（`spec/*.md`）がある場合: **coder から直接開始**し、reviewer・tester を厳格に実施。

## コード調査の効率化

**原則: まず直接ツールを使う。Explore エージェントはスコープ不明時のみ。**

| 状況 | 手段 |
|---|---|
| ファイル・ディレクトリが特定されている | `Read` / `Grep` 直接使用 |
| バグ修正・単一ファイルの改修 | `Read` 直接使用 |
| 影響範囲が不明・複数パッケージにまたがる | Explore エージェント |

Explore 使用時の必須指定: 調査ファイル数の上限 / 「箇条書きのみ」/ 不要な横断比較の除外
