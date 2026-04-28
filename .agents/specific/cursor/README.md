# Cursor 固有設定（将来用）

このディレクトリは Cursor 向けの固有設定を管理します。

## 現在のステータス

現時点では Cursor 向けのルールファイルは未生成です。
`build-agent-context.sh` を拡張することで、以下の形式で自動生成できます。

## 将来の配置ファイル

```
.agents/specific/cursor/
└── rules/
    ├── architecture.mdc    # アーキテクチャルール（glob: packages/**/*.dart）
    ├── state.mdc           # 状態管理ルール（glob: **/notifier/*.dart）
    └── testing.mdc         # テストパターン（glob: test/**/*.dart）
```

## Cursor .mdc 形式の例

```markdown
---
description: 4層アーキテクチャルール
globs: packages/**/*.dart
alwaysApply: false
---

（`.agents/common/AGENTS.md` + `.agents/skills/4-layer-architecture.md` の内容を展開）
```

## 生成方法

`build-agent-context.sh` に Cursor 向け出力を追加する:

```bash
# Cursor向け .mdc 生成（将来実装）
generate_cursor_rules() {
  # common/ + skills/ を合成して .cursor/rules/ に出力
}
```
