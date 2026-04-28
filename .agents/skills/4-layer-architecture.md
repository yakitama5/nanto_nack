# 4-Layer Architecture (オンデマンド参照)

> **いつ読む:** 新機能実装・アーキテクチャ設計・レイヤー横断の影響範囲調査時に読み込むこと。

<architecture_and_design>

## 4層レイヤードアーキテクチャ

```
Presentation  ←→  Application  ←→  Domain  ←  Infrastructure
    (UI)         (UseCase)       (Entity)      (Firebase/Drift)
```

### 各層の責務

| 層 | 責務 | 外部依存 |
|---|---|---|
| **Presentation** | UI描画・ユーザー操作・状態監視（Riverpod watch） | Flutter Widget, Riverpod |
| **Application** | ユースケース定義・Presentation↔Domain/Infra の仲介 | Domain, Infrastructure |
| **Domain** | ビジネスルール・エンティティ定義 | なし（純粋Dartコード） |
| **Infrastructure** | データソースアクセス・Repository実装 | Firebase, Drift, IAP |

### 依存性逆転の原則

- `Domain` 層はインターフェース（抽象クラス）のみを定義する。
- `Infrastructure` 層がそのインターフェースを実装する。
- `Presentation` 層は **Application 層を経由** してデータにアクセスする。UI内で直接 Firebase/Drift を呼び出すことを禁止する。

```
❌ Presentation → Firebase (直接呼び出し禁止)
✅ Presentation → Application → Infrastructure → Firebase
```

## パッケージ別ディレクトリ構成

```
packages/quizzes/xxx/
├── lib/
│   ├── presentation/
│   │   ├── page/          # ページウィジェット
│   │   ├── widget/        # 再利用ウィジェット
│   │   └── notifier/      # Riverpod Notifier
│   ├── application/
│   │   └── use_case/      # ユースケース
│   ├── domain/
│   │   ├── entity/        # エンティティ
│   │   └── repository/    # Repositoryインターフェース
│   └── infrastructure/
│       └── repository/    # Repository実装
```

## Coding Best Practices

- SOLID原則を適用し、「継承よりコンポジション」を優先する。
- 状態やモデルには必ず `copyWith` メソッドを手動実装すること。
- `altive_lints` による静的解析を維持すること。
- `DateTime.now()` は禁止。必ず `clock.now()`（`package:clock`）を使用すること。
- 空の catch ブロック `catch (_) {}` は禁止。`catch (error, stackTrace)` で `appLogger.e(...)` に記録すること。
- `List`/`Set` フィールドは `UnmodifiableListView` / `UnmodifiableSetView` でラップすること。
- 宣言したパラメータは必ず実装内で使用すること（未使用は削除）。
- `if (callback != null)` ガード後は `?.call()` でなく `!.call()` でアクセスすること。
- 複数パラメータに整合性制約がある場合はコンストラクタの `assert` で保証すること。

</architecture_and_design>
