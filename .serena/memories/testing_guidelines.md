# テストガイドライン

## テストスタック

| 種別 | パッケージ |
|------|-----------|
| Unit Test | `test` |
| Widget Test | `flutter_test` |
| Golden Test | `alchemist` |
| E2E Test | `patrol` |
| Mock | `mocktail` |

## 日時を使うテストの書き方

```dart
import 'package:clock/clock.dart';
final _fixedNow = DateTime(2026, 3, 20, 12, 0);

test('説明', () async {
  await withClock(Clock.fixed(_fixedNow), () async {
    // clock.now() が _fixedNow を返す
  });
});
```

- `_fixedNow` はトップレベル定数として定義しファイル内共有
- `withClock` は async コールバックに対応

## テーブル駆動テスト

同じ関数に3件以上のパターンをテストする場合は Dart レコードリテラルで記述:

```dart
const cases = <(int, bool)>[
  (0, false), (1, false), (3, true), (4, false),
];
for (final (count, expected) in cases) {
  test('$count件は${expected}を返す', () {
    expect(useCase.isClear(count: count), expected);
  });
}
```

## Golden Test の CI 判定

`flutter_test_config.dart` の CI 判定は以下のように正規化すること:

```dart
final ci = Platform.environment['CI']?.toLowerCase().trim() ?? '';
final isCI = ci == 'true' || ci == '1' || ci == 'yes';
```

`== 'true'` のみの比較は CI 環境によって動作しない場合あり。

## テスト実行

ルートから Melos スクリプト経由で実行すること:
```bash
fvm dart run melos run test:all
fvm dart run melos run test:unit
```
