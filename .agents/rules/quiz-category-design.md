# Quiz Category Design Rules

新規クイズカテゴリパッケージ（`packages/quizzes/<category>/`）を作成する際に必ず守るべき規約。

## 🎨 カラー定義：ThemeExtension を必ず使用する

- **禁止:** `Color(0xFF...)` のベタ書き、`Colors.white` / `Colors.grey` 等のMaterialカラー定数のハードコード
- **必須:** ダークモード対応のため、すべての色は `ThemeExtension` で定義・管理する

### 実装手順

1. `packages/quiz_core/lib/src/theme/<category>_app_theme.dart` を作成
2. `@immutable class <Category>AppTheme extends ThemeExtension<<Category>AppTheme>` を実装
3. `static const light = ...` と `static const dark = ...` を定義
4. `copyWith` と `lerp` を手動実装
5. `packages/quiz_core/lib/src/theme/app_theme.dart` の `lightTheme.extensions` と `darkTheme.extensions` にそれぞれ追加
6. `packages/quiz_core/lib/quiz_core.dart` にエクスポートを追加
7. プレゼンテーション層では `Theme.of(context).extension<<Category>AppTheme>()!.fieldName` でアクセス

```dart
// ❌ 禁止
color: const Color(0xFF1A73E8),
color: Colors.white,

// ✅ 正しい
final appTheme = Theme.of(context).extension<MyAppTheme>()!;
color: appTheme.brandBlue,
color: appTheme.onBrandColor,
```

## 🌍 テキスト定義：Slang のみ使用する

- **禁止:** 日本語・英語のベタ書き文字列
- **必須:** すべてのテキストを `assets/i18n/<locale>.i18n.json` に定義し、Slang で型安全にアクセスする

### ロケール別用途

| ロケール | ファイル | 用途 |
|--------|---------|------|
| `ja` | `ja.i18n.json` | ミッションテキスト・解説（読める日本語） |
| `en` | `en.i18n.json` | 英語版 |
| `xx` | `xx.i18n.json` | クイズUI内の表示テキスト（カスタム言語） |

### クイズ内テキストの使い分け

- **ミッションテキスト・解説（Insight）:** `context.s`（ja ロケール固定）で読める言語で表示
- **クイズUI内のすべての表示テキスト（AppBar・Drawer・リスト・ボタン等）:** `context.sq`（xx ロケール）でカスタム言語を使用

```dart
// ❌ 禁止
Text('Archive'),
Text('アーカイブ'),

// ✅ 正しい
Text(context.sq.common.archiveAction),  // クイズUI内 → カスタム言語
Text(context.s.quiz1.missionText),      // ミッション・解説 → 読める言語
```

### i18n翻訳アクセサの実装

各カテゴリパッケージに `lib/src/i18n/<category>_translations_extension.dart` を作成する:

```dart
extension <Category>TranslationsExtension on BuildContext {
  Translations get s => AppLocale.ja.buildSync();   // ミッション用（読める言語）
  Translations get sq => AppLocale.xx.buildSync();  // クイズUI用（カスタム言語）
}
```

## ⏱️ 制限時間：Config で一括管理する

- **必須:** 制限時間は `domain/` 内の Config クラスで `static const int` として定義する
- **禁止:** 数値のベタ書き（`timeLimitSeconds: 60`）

```dart
// domain/<category>_quiz_config.dart
abstract final class <Category>QuizConfig {
  /// 全クイズ共通の制限時間（秒）
  static const int timeLimitSeconds = 60;
  // ... その他設定値
}
```

- `MailQuizConfig.timeLimitSeconds` を `MissionCutIn`・`FloatingMissionBubble`・Notifier に渡す
- Notifier の `state` に `remainingSeconds` フィールドを持たせ、毎秒カウントダウンする

## ⏳ タイマー実装パターン

カテゴリ内で複数クイズを共通 Notifier で管理する場合、タイマーは以下のパターンで実装する:

```dart
class <Category>QuizNotifier extends AutoDisposeFamilyNotifier<...> {
  Timer? _timer;

  @override
  State build(QuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return State.initial(...);
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      remainingSeconds: <Category>QuizConfig.timeLimitSeconds,
      ...
    );
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) {
        _timer?.cancel();
        return;
      }
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.timeUp, elapsedMs: elapsed);
    // ... 結果保存
  }
}
```

- クリア時・giveUp時にも `_timer?.cancel()` を呼ぶこと
- `QuizResultOverlay` の表示条件に `QuizStatus.timeUp` を含めること

## 🔄 複数クイズの共通化パターン（.family を使う）

1つのカテゴリで複数クイズを扱う場合は `NotifierProvider.autoDispose.family` で統一する:

```dart
// クイズ種別 enum
enum <Category>QuizType { quiz1, quiz2, quiz3, quiz4 }

// 統合 Provider
final <category>QuizProvider = NotifierProvider.autoDispose
    .family<<Category>QuizNotifier, <Category>QuizState, <Category>QuizType>(
  <Category>QuizNotifier.new,
);

// 統合 Notifier
class <Category>QuizNotifier
    extends AutoDisposeFamilyNotifier<<Category>QuizState, <Category>QuizType> {
  // arg プロパティでクイズ種別を参照できる
  @override
  <Category>QuizState build(<Category>QuizType arg) { ... }
}
```

- 画面は `required <Category>QuizType type` パラメータを持つ1つの `ConsumerStatefulWidget` として実装
- クイズ固有の操作・表示は `switch (_type) { ... }` で分岐

## 📦 MailAppTheme フィールド一覧（参考）

`MailAppTheme` は Gmail 風 UI 用途で定義済み。同様のシミュレーション UI を作る際はこれを参考にすること:

| フィールド | 用途 |
|-----------|------|
| `brandBlue` | ブランドブルー（選択バー・アバター・未読時刻） |
| `onBrandColor` | ブランドカラー背景上のテキスト/アイコン（白） |
| `scaffoldBackground` | AppBar・画面背景 |
| `searchBarBackground` | 検索バー背景 |
| `textPrimary` | 主テキスト |
| `textSecondary` | サブテキスト・アイコン |
| `subTextColor` | さらに薄いテキスト（解説等） |
| `archiveSwipeColor` | スワイプアクション背景 |
| `selectedBackground` | 選択状態の背景 |
| `unreadBackground` | 未読アイテム背景 |
| `unselectedAvatarBackground` | 未選択モードのアバター背景 |
| `unselectedCheckColor` | 未選択チェックアイコン色 |
| `borderColor` | 区切り線・ボーダー |
| `drawerHeaderBackground` | ドロワーヘッダー背景 |
| `insightIconColor` | 解説の電球アイコン色 |
