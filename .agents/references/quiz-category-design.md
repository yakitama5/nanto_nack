# Quiz Category Design Rules

新規クイズカテゴリパッケージ（`packages/quizzes/<category>/`）を作成する際に必ず守るべき規約。

## 🎨 カラー定義：ThemeExtension を必ず使用する

- **禁止（プレゼンテーション層）:** `Color(0xFF...)` / `Colors.white` 等のハードコード
- **許可（ThemeExtension 定義ファイル）:** `<category>_app_theme.dart` の `static const light/dark` 内のみ直接値を使用してよい
- **必須:** ダークモード対応のため、すべての色は `ThemeExtension` で定義・管理する

### 実装手順
1. `packages/quiz_core/lib/src/theme/<category>_app_theme.dart` を作成
2. `@immutable class <Category>AppTheme extends ThemeExtension<<Category>AppTheme>` を実装
3. `static const light` / `static const dark` を定義、`copyWith` と `lerp` を手動実装
4. `app_theme.dart` の `lightTheme.extensions` と `darkTheme.extensions` に追加
5. `quiz_core.dart` にエクスポート追加
6. プレゼンテーション層: `Theme.of(context).extension<<Category>AppTheme>()!.fieldName` でアクセス

## 🌍 テキスト定義：Slang のみ使用する

- **禁止:** 日本語・英語のベタ書き文字列
- **必須:** すべてのテキストを `assets/i18n/<locale>.i18n.json` に定義し、Slang で型安全にアクセスする

| ロケール | 用途 |
|--------|------|
| `ja` | ミッションテキスト・解説（読める日本語） |
| `en` | 英語版 |
| `xx` | クイズUI内テキスト（カスタム言語） |

- **ミッション・解説:** `context.s`（ja）で表示
- **クイズUI内テキスト（AppBar・リスト・ボタン等）:** `context.sq`（xx）でカスタム言語を使用

各カテゴリパッケージに `lib/src/i18n/<category>_translations_extension.dart` を作成する:
```dart
extension <Category>TranslationsExtension on BuildContext {
  Translations get s => AppLocale.ja.buildSync();
  Translations get sq => AppLocale.xx.buildSync();
}
```

## ⏱️ 制限時間：Config で一括管理する

- **必須:** `domain/<category>_quiz_config.dart` に `static const int timeLimitSeconds` として定義
- **禁止:** 数値のベタ書き

## ⏳ タイマー実装パターン

```dart
class <Category>QuizNotifier extends AutoDisposeFamilyNotifier<...> {
  Timer? _timer;
  @override
  State build(QuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return State.initial(...);
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) { _timer?.cancel(); return; }
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) { _timer?.cancel(); _onTimeUp(); }
      else { state = state.copyWith(remainingSeconds: remaining); }
    });
  }
}
```

- クリア時・giveUp時にも `_timer?.cancel()` を呼ぶこと
- `QuizResultOverlay` の表示条件に `QuizStatus.timeUp` を含めること

## 🔄 複数クイズの共通化パターン（.family を使う）

```dart
enum <Category>QuizType { quiz1, quiz2, quiz3 }

final <category>QuizProvider = NotifierProvider.autoDispose
    .family<<Category>QuizNotifier, <Category>QuizState, <Category>QuizType>(
  <Category>QuizNotifier.new,
);
```

- 画面は `required <Category>QuizType type` パラメータを持つ1つの `ConsumerStatefulWidget`
- クイズ固有の操作・表示は `switch (_type) { ... }` で分岐

## 🧱 AppBar 内の繰り返しスタイルはウィジェットに抽出する

同一ファイル内: `_Xxx` プライベートウィジェットに抽出。複数ファイルから参照: パブリッククラスとしてコンポーネントファイルに定義。

## 🏗️ クイズ画面のレイヤー構造（MissionCutIn / AppBar の z-index）

Scaffold 全体を外側 Stack でラップし、MissionCutIn / QuizResultOverlay を外側 Stack の子として配置する。

```dart
// ✅ 正しい（shopping の cart_quiz_screen.dart と同じパターン）
Stack(
  children: [
    Scaffold(appBar: ..., body: _buildBody()),
    if (state.status == QuizStatus.playing) FloatingMissionBubble(...),
    if (_showCutIn) MissionCutIn(...),
    if (done) Positioned.fill(child: QuizResultOverlay(...)),
  ],
)
```

- 外側 Stack での `FloatingMissionBubble` の初期位置は `MediaQuery.paddingOf(context).top + kToolbarHeight`

## 💬 FloatingMissionBubble には必ず onGiveUp と onHintTap を接続する

| パラメータ | 接続内容 | 条件 |
|-----------|---------|------|
| `onGiveUp` | `() => notifier.giveUp()` | **必須**（全クイズ） |
| `onHintTap` | `() => notifier.useHint()` | ヒント機能がある場合のみ |
| `hintUsed` | `state.hintUsed` | ヒントがある場合のみ（`false` ハードコード禁止） |

- `FloatingMissionBubble` は `state.status == QuizStatus.playing` のときのみ表示すること

## 💡 ヒント機能の実装パターン

1. State に `hintUsed` フィールド（デフォルト `false`）
2. Notifier に `useHint()` メソッド（冪等ガード必須）
3. `FloatingMissionBubble.onHintTap` で `notifier.useHint()` を呼ぶ
4. `hintUsed == true` のとき body 上部にヒントカードをインライン表示
5. `retry()` 時は `State.initial()` で `hintUsed` が `false` にリセット

AppBar にヒントボタンを独立して置くのは非推奨（FloatingMissionBubble との二重管理になる）。

## 🗂️ 新カテゴリは quiz_core の i18n と画面の switch に必ず登録する

漏れると英語IDがそのまま表示される。以下をセットで実施すること。

### quiz_core の i18n に追加
`packages/quiz_core/assets/i18n/ja.i18n.json` と `en.i18n.json` に `play.categoryLabel.<category>` / `play.stageTitle.<category>_quizN` / `play.stageDescription.<category>_quizN` / `play.categoryDescription.<category>` を追記。

### 画面の switch 文に追加
- `apps/app_main/lib/presentation/play/stage_list_screen.dart`: `_categoryLabel` / `_stageTitle` / `categoryColor` の switch
- `apps/app_main/lib/presentation/play/category_list_screen.dart`: `_categoryLabel` / `_categoryColor` / `_categoryContainerColor` の switch

**必須:** `categoryColor` の switch にも追加すること。漏れると `colorScheme.primary`（デフォルト色）になる。

## 📋 リザルトInsightには QuizInsightContent を使う

`QuizResultOverlay` の `insight` パラメータには必ず `quiz_core` の `QuizInsightContent` を使用すること。プライベートな Insight ウィジェットの独自定義は禁止。

```dart
// ✅ 正しい
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

- テキストはすべて i18n（Slang）経由で取得。`Builder` を使うのは `context.s` が `BuildContext` を必要とするため。
