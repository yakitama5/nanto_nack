# GitHub Copilot 固有設定（将来用）

このディレクトリは GitHub Copilot 向けの固有設定を管理します。

## 現在のステータス

現時点では Copilot 向けのルールファイルは未生成です。
`build-agent-context.sh` を拡張することで自動生成できます。

## 将来の配置ファイル

```
.agents/specific/copilot/
└── copilot-instructions.md    # Copilot Instructions（GitHub に配置）
```

## 生成方法

`build-agent-context.sh` に Copilot 向け出力を追加する:

```bash
# Copilot向け instructions 生成（将来実装）
generate_copilot_instructions() {
  # common/ + skills/ を合成して .github/copilot-instructions.md に出力
}
```

## 参考

- [Copilot Instructions 公式ドキュメント](https://docs.github.com/en/copilot/customizing-copilot/adding-repository-custom-instructions-for-github-copilot)
- 配置先: `.github/copilot-instructions.md`
