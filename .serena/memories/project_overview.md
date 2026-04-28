# NantoNack プロジェクト概要

## プロジェクト概要

**NantoNack** は Flutter/Dart で開発された UI/UX 直感クイズアプリ。
ユーザーが実際のアプリ UI（Gmail 風メール、チャット、地図等）を操作しながら
直感力・操作知識を試すクイズ形式のゲームアプリ。

## リポジトリ構成

**Pub Workspace + Melos** モノレポ。バージョン管理は **fvm**。

```
nanto_nack/
├── apps/
│   └── app_main/          # メインアプリ（状態管理・ルーティング）
├── packages/
│   ├── system/            # 基盤（Firebase / Drift / IAP）
│   ├── quiz_core/         # 共通コンポーネント・テーマ
│   ├── geolocator_windows_stub/  # Windows向けスタブ
│   └── quizzes/           # カテゴリ別クイズ
│       ├── alarm/
│       ├── calendar/
│       ├── chat/
│       ├── comic/
│       ├── mail/
│       ├── map/
│       ├── news/
│       ├── payment/
│       ├── shopping/
│       ├── sns/
│       ├── streaming/
│       └── todo/
├── docs/                  # 設計ドキュメント
├── spec/                  # 実装計画書（*.md）
└── pubspec.yaml           # ワークスペースルート
```

## AI エージェント設定ディレクトリ

```
.agents/                   # 全 AI ツール共通の設定ディレクトリ
├── common/                # 全 AI 共通ルール（オンデマンドで読む）
│   ├── melos-monorepo.md  # パッケージ境界・Melos コマンド
│   └── security.md        # 破壊的変更禁止・ガードレール
├── skills/                # スキル定義（オンデマンドで読む）
│   ├── tune/SKILL.md      # Empirical Prompt Tuning スキル
│   ├── quiz-category-design/SKILL.md  # 新クイズカテゴリ設計スキル
│   ├── 4-layer-architecture.md        # 4層アーキテクチャ詳細
│   ├── ui-state-rules.md              # UI・状態管理ルール
│   ├── data-and-logic.md              # DB・Firebase・ゲームロジック
│   └── testing-patterns.md            # テストパターン
├── agents/                # Claude Code エージェント定義
├── commands/              # Claude Code スラッシュコマンド定義
├── policies/              # my-rules.toml
└── settings.json          # Claude Code 設定
```

シンボリックリンク: `.claude/` → `.agents/`、`CLAUDE.md` → `AGENTS.md`

## ドキュメント

- `docs/table-design.md`: ローカルDB（Drift）テーブル定義
- `docs/custom-language-design.md`: カスタム言語（異世界文字）変換仕様
- `docs/quizzes/<category>.md`: カテゴリ別クイズ仕様
- `spec/*.md`: 実装計画書（実装前に確認すること）
