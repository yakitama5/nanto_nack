# Architecture & Style Guidelines

## 🏛️ 4層レイヤードアーキテクチャ

各パッケージ内では以下のレイヤーに分離し、関心の分離を徹底すること。

1. **Presentation:** UI描画、ユーザー操作、状態の監視。
2. **Application:** ユースケース定義。PresentationとDomain/Infrastructureの仲介。
3. **Domain:** ビジネスルール、エンティティ定義。外部依存のない純粋なDartコード。
4. **Infrastructure:** データソース（Firebase, Drift, IAP等）へのアクセスとRepository実装。
※カテゴリパッケージ内で複数クイズを扱う場合、この層の中でディレクトリを切り整理する。

## 🎨 Coding Best Practices

- **原則:** SOLID原則を適用し、「継承よりコンポジション」を優先する。
- **イミュータビリティ:** - 変更不可能なデータ構造をデフォルトとする。
  - 状態やモデルの定義には、必ず **`copyWith` メソッド** を手動で実装し、更新時に利用すること。
- **静的解析:** `altive_lints` を利用。警告やエラーはすべて解消し、厳格なコード規約を維持すること。
