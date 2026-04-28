# Testing Patterns (オンデマンド参照)

> **いつ読む:** テストコード作成・`/write-test` スキル実行時に読み込むこと。

## テスト種別と実行コマンド

| 種別 | 説明 | コマンド |
|---|---|---|
| Unit Test | ロジック・Repository・Notifierの単体テスト | `fvm dart run melos run test:unit` |
| Widget Test | ウィジェットの描画・インタラクションテスト | `fvm dart run melos run test:all` |
| Golden Test | スクリーンショット比較による視覚的回帰テスト | `/test-golden-update` で期待値更新 |

## モック方針

### Riverpod のモック

`ProviderContainer` または `ProviderScope` のオーバーライドを使用する。
`mockito` や `mocktail` による Notifier のモックは原則不使用。

```dart
final container = ProviderContainer(
  overrides: [
    quizRepositoryProvider.overrideWith((_) => FakeQuizRepository()),
  ],
);
```

### Drift（ローカルDB）のモック

インメモリDBを使用する。実DBを使ったテストを推奨（モックは禁止）。

```dart
final db = AppDatabase(NativeDatabase.memory());
```

### Firebase のモック

`firebase_auth_mocks` / `fake_cloud_firestore` 等を使用。
`packages/system` パッケージが Firebase の初期化を担うため、テスト時は `system` を初期化せずにスタブを渡すこと。

## 時間依存テスト

`DateTime.now()` の代わりに `clock.now()` を使用しているため、テストでは `withClock()` で時刻を固定できる。

```dart
test('期限切れチェック', () {
  final fixedTime = DateTime(2024, 1, 1, 12, 0);
  withClock(Clock.fixed(fixedTime), () {
    final result = checkExpiry();
    expect(result, isFalse);
  });
});
```

## Notifier のテスト

状態ガードとリビルド抑制のテストを必ず含めること。

```dart
test('playing状態以外では操作が無視される', () {
  // Arrange: status を completed に設定
  container.read(quizNotifierProvider.notifier).complete();

  // Act: 完了後に操作
  container.read(quizNotifierProvider.notifier).clearSelection();

  // Assert: 状態が変化していないこと
  final state = container.read(quizNotifierProvider);
  expect(state.status, QuizStatus.completed);
});
```

## ゴールデンテスト

期待画像は `.golden/` ディレクトリに保存される。CI環境で失敗した場合は `/test-golden-update` で更新すること。

```dart
testWidgets('クイズ画面のゴールデンテスト', (tester) async {
  await tester.pumpWidget(buildTestWidget());
  await expectLater(
    find.byType(QuizPage),
    matchesGoldenFile('.golden/quiz_page.png'),
  );
});
```

## テストファイルの配置

各パッケージの `test/` ディレクトリに配置し、ソースファイルと同じディレクトリ階層を維持すること。

```
packages/quizzes/xxx/
├── lib/
│   └── presentation/notifier/quiz_notifier.dart
└── test/
    └── presentation/notifier/quiz_notifier_test.dart
```
