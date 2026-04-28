# Security & Guardrails

> このファイルの内容は `build-agent-context.sh` によって各ツール向けファイルの**末尾**に配置されます。
> AIモデルが最も強く記憶するプロンプト末尾への配置により、フェイルセーフとして機能します。

## 🚫 破壊的変更の禁止

- **実コード・テストコードのみが変更対象。** AIエージェント向けドキュメント（`.agents/`）の整理作業では実装コードを変更してはならない。
- **コード生成ファイル（`*.g.dart`, `strings.g.dart` 等）は直接編集禁止。** 必ずソースを変更してからコード生成コマンドを実行すること。
- **`git push` / `git remote` 操作は実行禁止。** ローカルコミットまでを担当範囲とする。

## ✅ 作業完了前の必須チェック

すべての実装作業を終えた後、必ず以下を実行すること:

```bash
fvm dart run melos run lint
```

- 警告・エラー（`info` レベル含む）が **0件** になるまで解消すること。
- `fvm flutter analyze` は `melos run lint` で代替されるため、個別実行は不要。

## 🔒 操作制限（policies/my-rules.toml より）

**許可されている操作:**
- ファイルの読み書き・削除（プロジェクト内）
- Git ローカル操作（status, branch, checkout, log, diff, add, commit, pull, fetch）
- GitHub CLI 参照系（`gh pr view`, `gh pr list` 等の読み取りのみ）
- 開発コマンド（`fvm flutter *`, `fvm dart *`, `melos *`, `npm/yarn test/run`）

**禁止されている操作:**
- `git push` / `git remote` 等のリモート操作
- `curl` / `wget` / `scp` 等の外部通信コマンド
- プロジェクト外へのディレクトリ移動（`cd ..`, `cd /`, `cd C:` 等）
- GitHub CLI 書き込み系（PR作成・クローズ・コメント等は明示的な指示がない限り禁止）

## ⚠️ 不確かな場合は確認を取ること

作業範囲が不明確な場合、または以下に該当する場合はユーザーに確認してから実行すること:
- 既存ファイルの**削除**（ドキュメント含む）
- パッケージ間の**依存関係変更**
- `pubspec.yaml` の**バージョン変更**
