# Git Commit Rules

Claude CodeがGitコミットを実行する際は、以下のルールを厳守してください。

## 📌 基本ルール

1. **コミットの粒度**: 変更はできるだけ小さく、意味のある単位で細かく分割してコミットすること。複数の異なる機能変更や修正を1つのコミットに混ぜないでください。
2. **実行方法**: コミット操作は必ずCLI（コマンドライン）から `git commit` コマンドを使用して実施してください。
3. **メッセージ形式**: コミットメッセージの1行目は必ず以下のフォーマットで記述してください。
   `{label}: {message}`
4. **理由（Why）の明記**: 変更の内容（What）だけでなく、**「なぜその変更を行ったのか（Why）」** を必ず記載してください。1行の `{message}` 内に簡潔に含めるか、必要に応じて改行して本文（Body）に詳細な背景を記載してください。

## 🏷️ コミットラベル一覧

コミットメッセージの `{label}` には以下のいずれかを使用し、`{message}` にはその変更内容を簡潔に日本語で記載してください。

| Label | Description |
| :--- | :--- |
| ✨feat | 新機能（New Feature） |
| 🐛fix | バグ修正（Bugfix） |
| ♻️refactor | リファクタリング(Refactoring) |
| 📚doc | ドキュメント（Documentation） |
| 🎨design | デザインUI/UX(Accessibility) |
| 🐎perf | パフォーマンス（Performance） |
| 🔧chore | ビルド、補助ツール、ライブラリ関連(Settings) |
| 🚨test | テスト（Tests） |
| 🗨️comment | コメント整理、TODOコメント(Comment) |
| ♻️generete | コード(再)生成、Bootstrap(Generate) |
| 🎉new | 初めてのコミット（Initial Commit） |
| 🔖tag | バージョンタグ（Version Tag） |
| 🚧wip | WIP(Work In Progress) |
| 💩depre | 非推奨追加（Deprecation） |

## 💡 コミットメッセージの例

**例1（1行でWhyを含める場合）:**
`✨feat: カート画面に合計金額を表示（ユーザーが購入前に総額を確認できるようにするため）`

**例2（本文に詳細なWhyを書く場合）:**
`🐛fix: カート画面で合計金額が正しく計算されない問題を修正`

`特定の割引アイテムが含まれている場合に、割引率が二重に適用されてしまうバグがあったため、計算ロジックを修正。`
