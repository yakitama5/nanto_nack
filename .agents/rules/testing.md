# Testing Guidelines

## 🧪 Testing Stack

品質維持のため、以下のツールを適切に組み合わせてテストを記述すること。

- **Unit Test:** `test` パッケージ。
- **Widget Test:** `flutter_test` パッケージ。
- **Golden Test:** `alchemist` を利用。
- **E2E Test:** `patrol` を利用。

## 🕐 日時を使うテストの書き方

日時に依存するロジックのテストでは、`withClock()` で現在時刻を固定すること。
`DateTime.now()` を直接参照するテストは実行タイミングに依存して不安定になるため禁止する。

```dart
import 'package:clock/clock.dart';

// テストファイル内で固定日時を定義
final _fixedNow = DateTime(2026, 3, 20, 12, 0);

test('今日だけプレイしていればストリーク 1', () async {
  await withClock(Clock.fixed(_fixedNow), () async {
    // このブロック内では clock.now() が _fixedNow を返す
    final result = await useCase.execute();
    expect(result.currentStreak, 1);
  });
});
```

- `_fixedNow` はテストファイルのトップレベルに定数として定義し、ファイル内で共有すること。
- `withClock` は非同期コールバックにも対応している（`async` ブロックで使用可）。
- `clock` パッケージの詳細は `architecture-and-style.md` の「現在日時の取得ルール」を参照すること。

## 📋 テーブル駆動テスト

同じ関数に対して3件以上の異なる入力パターンをテストする場合は、
Dart レコードリテラルを使ったテーブル駆動スタイルで記述すること。

```dart
// ❌ 非推奨（繰り返しが多い）
test('0件はfalse', () => expect(useCase.isClear(count: 0), isFalse));
test('3件はtrue', () => expect(useCase.isClear(count: 3), isTrue));
test('4件はfalse', () => expect(useCase.isClear(count: 4), isFalse));

// ✅ 推奨（追加が1行で済む）
const cases = <(int, bool)>[
  (0, false), (1, false), (2, false),
  (3, true),  // 正解
  (4, false), (5, false),
];
for (final (count, expected) in cases) {
  test('$count件は${expected}を返す', () {
    expect(useCase.isClear(count: count), expected);
  });
}
```

## 🔧 Golden Test の CI 判定

`flutter_test_config.dart` の CI 判定は `Platform.environment['CI']` の値を
`toLowerCase().trim()` で正規化し、`"true"` / `"1"` / `"yes"` のいずれかで isCI = true とすること。
`== 'true'` のみの比較は CI 環境によって動作しない場合がある。

## 🚀 Execution

- テストの実行は、個別のディレクトリではなく、ルートから `melos run test:all` 等の Melos スクリプトを介して行うことを推奨する。
