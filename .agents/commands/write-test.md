tester エージェントを使ってテストを作成・実行してください。

## 対象

$ARGUMENTS

（指定がない場合は直近の実装変更に対応するテストを作成します）

## tester エージェントへの指示

以下のルールに従ってテストを設計・実装してください:

### テストの種類を適切に選択

| 種類 | ツール | 用途 |
|---|---|---|
| Unit Test | `test` | ロジック単体の検証 |
| Widget Test | `flutter_test` | UIコンポーネントの振る舞い |
| Golden Test | `alchemist` | デザインの視覚的整合性 |
| E2E Test | `patrol` | ユーザー操作のシミュレーション |

### CRITICAL: 日時テストのルール

- **`withClock()` を必ず使用**: `DateTime.now()` を直接参照するテストは禁止
- `_fixedNow` 定数はテストファイルのトップレベルに定義する

```dart
final _fixedNow = DateTime(2026, 3, 20, 12, 0);

test('example', () async {
  await withClock(Clock.fixed(_fixedNow), () async {
    // ...
  });
});
```

### テーブル駆動テスト

同じ関数に3件以上の異なる入力パターンをテストする場合は Dart レコードリテラルを使うこと。

```dart
const cases = <(int, bool)>[(0, false), (3, true), (4, false)];
for (final (count, expected) in cases) {
  test('$count件は$expectedを返す', () => expect(useCase.isClear(count: count), expected));
}
```

### Golden Test CI 判定

`flutter_test_config.dart` の CI 判定は `Platform.environment['CI']` を `toLowerCase().trim()` で正規化し、`"true"` / `"1"` / `"yes"` のいずれかで isCI = true とすること（`== 'true'` のみでは CI 環境によって動作しない）。

### テスト実行

作成後は `fvm dart run melos run test:all` で全テストが通ることを確認してください。
