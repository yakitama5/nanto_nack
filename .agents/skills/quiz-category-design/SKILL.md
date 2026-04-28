---
name: quiz-category-design
description: Use when creating a new quiz category package (packages/quizzes/<category>/) or adding a new quiz within an existing category. Covers theme setup, i18n, timer, state management, screen structure, and app_main registration.
---

# 新規クイズカテゴリ／クイズ追加スキル

## 適用タイミング

- `packages/quizzes/<category>/` を新規作成するとき
- 既存カテゴリに新しいクイズ（quiz2, quiz3 等）を追加するとき

---

## Step 1: カラー定義（ThemeExtension）

### 禁止事項
- `Color(0xFF...)` / `Colors.white` 等のハードコードをプレゼンテーション層で使用すること

### 実装手順

1. `packages/quiz_core/lib/src/theme/<category>_app_theme.dart` を作成
2. 以下の構造で実装する:

```dart
@immutable
class <Category>AppTheme extends ThemeExtension<<Category>AppTheme> {
  const <Category>AppTheme({ required this.primary, ... });

  final Color primary;
  // ... 必要なフィールド

  static const light = <Category>AppTheme(primary: Color(0xFF...), ...);
  static const dark  = <Category>AppTheme(primary: Color(0xFF...), ...);

  @override
  <Category>AppTheme copyWith({ Color? primary, ... }) =>
      <Category>AppTheme(primary: primary ?? this.primary, ...);

  @override
  <Category>AppTheme lerp(<Category>AppTheme? other, double t) => ...;
}
```

3. `app_theme.dart` の `lightTheme.extensions` と `darkTheme.extensions` に追加
4. `quiz_core.dart` にエクスポート追加
5. プレゼンテーション層でのアクセス: `Theme.of(context).extension<<Category>AppTheme>()!.primary`

---

## Step 2: テキスト定義（Slang i18n）

### 禁止事項
- 日本語・英語のベタ書き文字列（`Text('クリア')` 等）

### ロケール構成

| ロケール | 用途 |
|--------|------|
| `ja` | ミッションテキスト・解説（読める日本語） |
| `en` | 英語版 |
| `xx` | クイズUI内テキスト（カスタム言語・難読化） |

### 実装手順

1. `packages/quizzes/<category>/assets/i18n/ja.i18n.json` 等を作成してテキストを定義
2. `lib/src/i18n/<category>_translations_extension.dart` を作成:

```dart
extension <Category>TranslationsExtension on BuildContext {
  Translations get s => AppLocale.ja.buildSync();   // ミッション・解説
  Translations get sq => AppLocale.xx.buildSync();  // UIテキスト
}
```

3. `melos run gen:slang` でコード生成

### quiz_core の i18n にも追加（必須）

`packages/quiz_core/assets/i18n/ja.i18n.json` と `en.i18n.json` に以下を追記:
- `play.categoryLabel.<category>`
- `play.stageTitle.<category>_quizN`
- `play.stageDescription.<category>_quizN`
- `play.categoryDescription.<category>`

漏れると英語IDがそのまま表示されるため、必ずセットで実施すること。

---

## Step 3: ドメイン設計

### タイムリミット設定

```dart
// domain/<category>_quiz_config.dart
class <Category>QuizConfig {
  static const int timeLimitSeconds = 30; // 必ずここで一括管理
}
```

### 複数クイズの Provider 設計（.family を使う）

```dart
enum <Category>QuizType { quiz1, quiz2, quiz3 }

final <category>QuizProvider = NotifierProvider.autoDispose
    .family<<Category>QuizNotifier, <Category>QuizState, <Category>QuizType>(
  <Category>QuizNotifier.new,
);
```

---

## Step 4: タイマー実装

```dart
class <Category>QuizNotifier
    extends AutoDisposeFamilyNotifier<<Category>QuizState, <Category>QuizType> {
  Timer? _timer;

  @override
  <Category>QuizState build(<Category>QuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return <Category>QuizState.initial(arg);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) { _timer?.cancel(); return; }
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) { _timer?.cancel(); _onTimeUp(); return; }
      state = state.copyWith(remainingSeconds: remaining);
    });
  }

  void giveUp() {
    if (state.status != QuizStatus.playing) return; // ステータスガード
    _timer?.cancel();
    state = state.copyWith(status: QuizStatus.gaveUp);
  }
}
```

---

## Step 5: 画面構造

### Scaffold の z-index レイヤー構造

```dart
// ✅ 正しい（cart_quiz_screen.dart と同じパターン）
Stack(
  children: [
    Scaffold(appBar: ..., body: _buildBody()),
    if (state.status == QuizStatus.playing)
      FloatingMissionBubble(
        onGiveUp: () => notifier.giveUp(),           // 必須
        onHintTap: () => notifier.useHint(),         // ヒントがある場合
        hintUsed: state.hintUsed,                    // ハードコード禁止
        // 初期位置: MediaQuery.paddingOf(context).top + kToolbarHeight
      ),
    if (_showCutIn) MissionCutIn(...),
    if (done) Positioned.fill(child: QuizResultOverlay(...)),
  ],
)
```

### FloatingMissionBubble の必須パラメータ

| パラメータ | 接続内容 | 条件 |
|-----------|---------|------|
| `onGiveUp` | `() => notifier.giveUp()` | **必須**（全クイズ） |
| `onHintTap` | `() => notifier.useHint()` | ヒント機能がある場合のみ |
| `hintUsed` | `state.hintUsed` | ヒントがある場合のみ |

### ヒント機能の実装パターン

1. State に `hintUsed` フィールド（デフォルト `false`）
2. Notifier に冪等ガード付き `useHint()`:

```dart
void useHint() {
  if (state.status != QuizStatus.playing) return;
  if (state.hintUsed) return; // 冪等ガード
  state = state.copyWith(hintUsed: true);
}
```

3. `retry()` 時は `State.initial()` で `hintUsed` が `false` にリセット

### リザルト Insight

```dart
insight: Builder(
  builder: (context) {
    final insight = context.s.quizN.insight;
    return QuizInsightContent(
      title: insight.title,
      subtitle: insight.subtitle,
      items: [
        QuizInsightItem(emoji: '📱', title: insight.step1Title, desc: insight.step1Desc),
      ],
    );
  },
),
```

`QuizResultOverlay` の `insight` パラメータには必ず `quiz_core` の `QuizInsightContent` を使用すること。独自定義は禁止。

---

## Step 6: app_main への登録（必須）

新カテゴリを追加する場合、以下の switch 文にすべて追加すること。漏れると表示が崩れる。

### stage_list_screen.dart
- `_categoryLabel` の switch
- `_stageTitle` の switch
- `categoryColor` の switch（漏れると `colorScheme.primary` になる）

### category_list_screen.dart
- `_categoryLabel` の switch
- `_categoryColor` の switch
- `_categoryContainerColor` の switch

---

## Step 7: 実装後チェックリスト

```bash
fvm dart run melos run lint
```

- [ ] ThemeExtension に light/dark 両方定義されているか
- [ ] すべてのテキストが Slang 経由か（ハードコードなし）
- [ ] `quiz_core` の i18n に新カテゴリのエントリを追加したか
- [ ] `app_main` の全 switch 文に新カテゴリを追加したか
- [ ] `FloatingMissionBubble` の `onGiveUp` が接続されているか
- [ ] タイマーが giveUp/クリア時にキャンセルされているか
- [ ] `QuizStatus.timeUp` が `QuizResultOverlay` の表示条件に含まれているか
- [ ] lint エラーが 0 件か
