# Architecture & Style Guidelines

## 🏛️ 4層レイヤードアーキテクチャ

各パッケージ内では以下のレイヤーに分離し、関心の分離を徹底すること。

1. **Presentation:** UI描画、ユーザー操作、状態の監視。
2. **Application:** ユースケース定義。PresentationとDomain/Infrastructureの仲介。
3. **Domain:** ビジネスルール、エンティティ定義。外部依存のない純粋なDartコード。
4. **Infrastructure:** データソース（Firebase, Drift, IAP等）へのアクセスとRepository実装。
※カテゴリパッケージ内で複数クイズを扱う場合、この層の中でディレクトリを切り整理する。

## ✅ 作業完了前の必須チェック

コードの変更を完了したと判断する前に、必ず以下を実行し、すべてパスすることを確認すること。

```bash
melos run lint
```

- **警告・エラーが0件**であることを確認すること。
- `info` レベルの警告も含め、すべて解消してからコミットすること。
- CI で `melos run lint` が実行されるため、ローカルで通らない変更はマージできない。

## 🎨 Coding Best Practices

- **原則:** SOLID原則を適用し、「継承よりコンポジション」を優先する。
- **イミュータビリティ:** - 変更不可能なデータ構造をデフォルトとする。
  - 状態やモデルの定義には、必ず **`copyWith` メソッド** を手動で実装し、更新時に利用すること。
- **静的解析:** `altive_lints` を利用。警告やエラーはすべて解消し、厳格なコード規約を維持すること。

## 🕐 現在日時の取得ルール

現在日時が必要な箇所では、`DateTime.now()` を直接使用することを**禁止**する。
代わりに `clock` パッケージのグローバル変数 `clock.now()` を使用すること。

```dart
// ❌ 禁止
final now = DateTime.now();

// ✅ 正しい
import 'package:clock/clock.dart';
final now = clock.now();
```

**理由:** `clock.now()` はテスト時に `withClock()` で任意の日時に差し替えられるため、
日時に依存するロジックの単体テストが決定的（再現性のある）結果を返せるようになる。

- `clock` パッケージを使用するすべてのパッケージの `pubspec.yaml` に `clock: ^1.1.2` を追加すること。
- テストでの使い方は `testing.md` を参照すること。
