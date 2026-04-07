`.claude/review/pending.md` に蓄積された改善提案を確認し、対象ファイルに適用してください。

## 手順

### Step 1: 提案内容を読む

`.claude/review/pending.md` を読み込み、未適用の提案を一覧表示してください。

### Step 2: 各提案を適用する

提案ごとに以下を実行します:

1. **対象ファイルを確認**: 更新先（`rules/`, `agents/`, `commands/` 等）を特定する
2. **内容を適用**: 対象ファイルに提案内容を反映する（追記・修正）
3. **適用結果を報告**: どのファイルの何を変更したか報告する

### Step 3: pending.md をクリアする

すべての提案を適用したら `.claude/review/pending.md` の内容を空にしてください。

---

## 部分適用したい場合

`$ARGUMENTS` に適用したい番号やキーワードを指定すると対象を絞れます。
例: `/apply-learnings 1` → 1番目の提案のみ適用
例: `/apply-learnings lint` → lint に関する提案のみ適用

指定された提案のみ適用し、残りは pending.md に残してください。
