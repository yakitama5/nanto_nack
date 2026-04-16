# Architecture & Style Guidelines

## 🏛️ 4層レイヤードアーキテクチャ

1. **Presentation:** UI描画、ユーザー操作、状態の監視。
2. **Application:** ユースケース定義。PresentationとDomain/Infrastructureの仲介。
3. **Domain:** ビジネスルール、エンティティ定義。外部依存のない純粋なDartコード。
4. **Infrastructure:** データソース（Firebase, Drift, IAP等）へのアクセスとRepository実装。

## ✅ 作業完了前の必須チェック

```bash
fvm dart run melos run lint
```

警告・エラー（info レベル含む）が **0件** になるまで解消すること。

## 🎨 Coding Best Practices

- SOLID原則を適用し、「継承よりコンポジション」を優先する。
- 状態やモデルには必ず `copyWith` メソッドを手動実装すること。
- `altive_lints` による静的解析を維持すること。

## 🕐 現在日時の取得

`DateTime.now()` は**禁止**。必ず `clock.now()`（`package:clock`）を使用すること。
テスト時に `withClock()` で差し替え可能になりテストが決定的になる。
使用するパッケージの `pubspec.yaml` に `clock: ^1.1.2` を追加すること。

## 🚫 エラーハンドリング

- **禁止:** 空の catch ブロック `catch (_) {}`
- **必須:** `catch (error, stackTrace)` で受け取り `appLogger.e(...)` で記録すること。
- 保存処理の後に副作用（haptic 等）が続く場合は `finally` で副作用を保証すること。

## 📦 コレクションのイミュータビリティ

State/Entity の `List`/`Set` フィールドは `UnmodifiableListView` / `UnmodifiableSetView` でラップすること。

## 🔒 その他

- 宣言したパラメータは必ず実装内で使用すること（未使用は削除）。
- `if (callback != null)` ガード後は `?.call()` でなく `!.call()` でアクセスすること。
- 複数パラメータに整合性制約がある場合はコンストラクタの `assert` で保証すること。
