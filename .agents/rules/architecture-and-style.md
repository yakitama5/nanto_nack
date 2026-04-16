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
fvm dart run melos run lint
```

- **警告・エラーが0件**であることを確認すること。
- `info` レベルの警告も含め、すべて解消してからコミットすること。
- CI で lint が実行されるため、ローカルで通らない変更はマージできない。

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

## 🚫 エラーハンドリングルール

- **禁止:** `catch (_) {}` や `catch (e) {}` のような例外を握り潰す空の catch ブロック。
- **必須:** `catch (error, stackTrace)` で受け取り、`appLogger.e(...)` 等で記録すること。

```dart
// ❌ 禁止
try {
  await _saveResult(...);
} catch (_) {}

// ✅ 正しい
try {
  await _saveResult(...);
} catch (error, stackTrace) {
  appLogger.e('Failed to save result', error: error, stackTrace: stackTrace);
}
```

### 成功フローで副作用が連続する場合は finally を使う

永続化（`_saveResult`）の後に触覚フィードバック等の副作用が続く場合、
保存が失敗しても後続の副作用（haptic 等）が必ず実行されるよう `finally` を使うこと。

```dart
// ❌ 禁止（保存失敗時に haptic が再生されない）
await _saveResult(isCleared: true, elapsedMs: elapsed);
await hapticFeedback.playSuccessFeedback();

// ✅ 正しい（保存失敗しても haptic は必ず再生される）
try {
  await _saveResult(isCleared: true, elapsedMs: elapsed);
} catch (error, stackTrace) {
  appLogger.e('_saveResult failed', error: error, stackTrace: stackTrace);
} finally {
  await hapticFeedback.playSuccessFeedback();
}
```

## 📦 コレクションのイミュータビリティ

State クラスや Entity クラスで `List`/`Set` フィールドを持つ場合は、外部からの直接変更を防ぐため
`UnmodifiableListView` / `UnmodifiableSetView` でラップすること。

```dart
// ❌ 禁止
final List<Mail> mails;
final Set<String> selectedMailIds;

// ✅ 正しい
final UnmodifiableListView<Mail> mails;
final UnmodifiableSetView<String> selectedMailIds;
// コンストラクタで変換: mails = UnmodifiableListView(mails)
```

## 🧩 関数シグネチャと実装の一致

宣言したパラメータは必ず実装内で使用すること。未使用パラメータは削除する。

## 🔒 null チェック済みコールバックは `!` でアクセスする

`if (callback != null)` などのガードで null でないことが保証されている場合は、
ブロック内で `?.call()` を使わず `!.call()` でアクセスすること。
また、複数の関連パラメータに整合性制約がある場合はコンストラクタの `assert` で保証すること。

```dart
// ❌ 禁止（if ガードで null チェック済みなのに ?. を使っている）
if (onEmptyTrash != null)
  PopupMenuButton(
    onSelected: (_) => onEmptyTrash?.call(),
    child: Text(emptyTrashLabel ?? ''),
  )

// ✅ 正しい（! でアクセス、assert で API 整合性を保証）
const MyWidget({
  this.onEmptyTrash,
  this.emptyTrashLabel,
}) : assert(
        onEmptyTrash == null || emptyTrashLabel != null,
        'emptyTrashLabel must be provided when onEmptyTrash is set',
      );

// build 内
if (onEmptyTrash != null)
  PopupMenuButton(
    onSelected: (_) => onEmptyTrash!.call(),
    child: Text(emptyTrashLabel!),
  )
```
