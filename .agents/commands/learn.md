このセッションでの失敗・躓き・繰り返した修正を記録し、再発しないよう設定ファイルを直接更新してください。

## 学習内容

$ARGUMENTS

## 手順

### Step 1: 根本原因を特定する

何が問題だったかを分析してください:
- コマンドの実行方法の誤り（例: Windowsでのパス形式, fvmの使い方）
- プロジェクト規約の見落とし（例: @riverpod使用, DateTime.now()使用）
- Agentの動作不足（例: lintを実行し忘れた, Whyを書き忘れた）
- スキル/コマンドの説明不足（例: 手順が曖昧で誤操作した）

### Step 2: 更新対象ファイルを決定する

| 問題の種類 | 更新対象 |
|---|---|
| Melosコマンドの実行方法・手順 | `.claude/commands/<command>.md` |
| Flutter/Dartコーディング規約 | `.claude/rules/architecture-and-style.md` 等 |
| 状態管理・コード生成の禁止事項 | `.claude/rules/state-management-and-codegen.md` |
| テストの書き方 | `.claude/rules/testing.md` |
| Agentの動作・チェックリスト | `.claude/agents/<agent>.md` |
| プロジェクト全体の方針 | `CLAUDE.md` |
| 将来の会話で参照すべき知見 | メモリファイル（`~/.claude/projects/.../memory/`） |

### Step 3: ファイルを更新する

- **既存ファイルへの追記**: 「## ⚠️ よくある失敗」「## 注意」セクションを追加または更新
- **手順の修正**: 間違いやすいステップを具体的に修正
- **禁止事項の強調**: CRITICALラベルを付けてより目立たせる

### Step 4: 更新内容を報告する

どのファイルのどの箇所を何のために更新したかを報告してください。
