今セッションを振り返り、改善提案を `.claude/review/pending.md` に追記してください。

## 分析手順

1. `git diff HEAD 2>/dev/null || git status 2>/dev/null` を実行して今セッションの変更を確認する
2. 会話の流れを振り返り、以下のパターンを探す:
   - 禁止コード（`DateTime.now()`, `@riverpod`, `flutter_hooks`, `json_serializable`）が修正されていた
   - Melosコマンドの実行を誤った（特に Windows 環境での `fvm dart run melos` の使い方）
   - lint エラーや警告を繰り返し修正した
   - コミットメッセージを書き直した
   - 同じ種類の修正を複数箇所に行った
   - 手順が曖昧で誤操作が発生した

3. 発見したパターンごとに `.claude/review/pending.md` へ**追記**する:

```
## <日付> セッション

### 発見した問題
（何が起きたか・何を繰り返し修正したか）

### 提案する改善
- **対象ファイル**: `.claude/rules/<file>.md` 等
- **変更内容**: （具体的に何を追加・修正すべきか）

---
```

4. 追記後、提案内容を一覧で報告する
5. 問題が見つからなかった場合はその旨を報告し、`pending.md` は変更しない
6. **`pending.md` 以外のファイルは変更しない**（適用は `/apply-learnings` で行う）
