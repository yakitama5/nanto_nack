# タスク完了時のチェックリスト

## 必須手順（コード変更後）

1. **静的解析を実行**
   ```bash
   fvm dart run melos run lint
   ```
   - 警告・エラーが **0件** であることを確認
   - `info` レベルも含めすべて解消すること
   - CI でも同じコマンドが走るためローカルでパスしないとマージ不可

2. **テストを実行**（テストがある場合）
   ```bash
   fvm dart run melos run test:all
   ```

3. **コード生成が必要な場合**（Drift / Slang / Flutter Gen 変更時）
   ```bash
   fvm dart run melos run generate
   ```

## コミットルール

- 形式: `{label}: {message}` （日本語メッセージ）
- **Why（なぜ変更したか）** を必ず記載
- 変更は小さく意味のある単位で細かく分割

### ラベル一覧

| Label | 用途 |
|-------|------|
| ✨feat | 新機能 |
| 🐛fix | バグ修正 |
| ♻️refactor | リファクタリング |
| 📚doc | ドキュメント |
| 🎨design | デザイン |
| 🐎perf | パフォーマンス |
| 🔧chore | ビルド・補助ツール |
| 🚨test | テスト |
| ♻️generate | コード生成 |

## サブエージェント改善ループ

実装タスクの標準フロー:
1. **analyst** → コードベース解析・影響範囲特定
2. **planner** → 実装計画策定
3. **advisor** → 計画レビュー（UI/UXは design-reviewer と連携）
4. **coder** → 実装
5. **reviewer** → コードレビュー
6. **tester** → テスト設計・実行
