# Claude Code 固有設定

このディレクトリは Claude Code（CLI/IDE拡張）固有の設定を管理します。

## Claude Code はすべて `.agents/` を共有参照する

このプロジェクトでは `.claude/` が `.agents/` へのシンボリックリンクとして設定されています。

```
.claude/  → .agents/   (シンボリックリンク)
.gemini/  → .agents/   (シンボリックリンク)
CLAUDE.md → AGENTS.md  (シンボリックリンク)
GEMINI.md → AGENTS.md  (シンボリックリンク)
```

その結果、Claude Code が読み込む `.claude/agents/` `.claude/commands/` は
**実体として `.agents/agents/` `.agents/commands/`** であり、Gemini など他のAIツールと
完全に同一の定義を共有します。

## 共通定義の配置（実体）

| Claude Codeの参照パス | 実体 | 内容 |
|---|---|---|
| `.claude/agents/*.md` | `.agents/agents/*.md` | サブエージェント定義（Agent toolで起動） |
| `.claude/commands/*.md` | `.agents/commands/*.md` | スラッシュコマンド定義（/implement 等） |
| `.claude/skills/*/` | `.agents/skills/*/` | Claude Code スキル（SKILL.md を持つもの） |
| `.claude/settings.json` | `.agents/settings.json` | Claude Code 設定（環境変数・hooks） |
| `CLAUDE.md` (root) | `AGENTS.md` (root) | エントリーポイント（自動生成） |

## settings.json の設定内容

| 設定 | 値 | 説明 |
|---|---|---|
| `env.CLAUDE_CODE_NO_FLICKER` | `"1"` | ターミナルのチラつきを防止 |
| `hooks.SessionStart` | ペンディング改善提案の通知 | `.claude/review/pending.md` 存在時に通知 |

## skills/ ディレクトリの2種類のファイル

`.agents/skills/` には2つの異なる種別が共存します:

- **Claude Code スキル**（`SKILL.md` を持つサブディレクトリ）
  - 例: `.agents/skills/app-store-screenshots/SKILL.md`
  - `/skill-name` コマンドとして起動できる再利用可能なワークフロー
- **アーキテクチャスキル**（`.md` 単体ファイル）
  - 例: `.agents/skills/4-layer-architecture.md`
  - 段階的開示用のルールドキュメント

## コンテキスト読み込みの流れ

1. `CLAUDE.md`（= `AGENTS.md`）が常時ロードされる
2. `AGENTS.md` 内の Blackboard パターン表に従い、タスクに応じたスキル/参照ファイルを読み込む
3. スラッシュコマンド実行時は `.agents/commands/<command>.md` がロードされる
4. サブエージェント起動時は `.agents/agents/<agent>.md` がロードされる
