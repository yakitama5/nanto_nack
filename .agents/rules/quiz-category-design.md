# Quiz Category Design Rules

新規クイズカテゴリパッケージ（`packages/quizzes/<category>/`）を作成する際に必ず守るべき規約。

## 🎨 カラー定義：ThemeExtension を必ず使用する

- **禁止（プレゼンテーション層）:** `Color(0xFF...)` のベタ書き、`Colors.white` / `Colors.grey` 等のMaterialカラー定数のハードコード
  - ウィジェット（`*.dart` in `presentation/`）では直接カラー値を書かないこと
- **許可（ThemeExtension 定義ファイル）:** `<category>_app_theme.dart` 内の `static const light = ...` / `static const dark = ...` インスタンス定義時には `Color(0xFF...)` や `Colors.white` を直接使用してよい
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

## 🧱 AppBar 内の繰り返しスタイルはウィジェットに抽出する

同一ファイル内で同じ Container/Row スタイルが複数の AppBar で重複する場合は、
プライベートウィジェット（`_Xxx` クラス）に抽出して共通化すること。
複数ファイルから参照する場合はパブリッククラスとしてコンポーネントファイルに定義する。

```dart
// ❌ 禁止（MailAppBar と MailSearchAppBar の両方に同じ Container を書く）
Container(
  height: 42,
  padding: EdgeInsets.symmetric(horizontal: 12),
  decoration: BoxDecoration(color: ..., borderRadius: BorderRadius.circular(24)),
  child: Row([Icon(...), SizedBox(...), Text(...)]),
)

// ✅ 正しい（_SearchBarContainer に抽出して両方から参照する）
class _SearchBarContainer extends StatelessWidget {
  const _SearchBarContainer({required this.searchHint});
  final String searchHint;
  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return Container(
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: mailTheme.searchBarBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(children: [
        Icon(Icons.search, color: mailTheme.textSecondary, size: 20),
        const SizedBox(width: 8),
        Text(searchHint, style: TextStyle(color: mailTheme.textSecondary, fontSize: 16)),
      ]),
    );
  }
}
```

- 同じファイル内でのみ使う場合 → `_` prefix のプライベートウィジェット
- 複数ファイルから使う場合 → `Mail` prefix 等を付けてコンポーネントファイルに定義し、同じファイルに置く
  - 例: `_SearchAppBar` を `MailSearchAppBar` に昇格させ `mail_app_bar.dart` に移動

## 🏗️ クイズ画面のレイヤー構造（MissionCutIn / AppBar の z-index）

Scaffold の AppBar は body より上レイヤーに描画される。
`MissionCutIn`（暗転エフェクト）や `QuizResultOverlay` を AppBar の上に重ねるには、
**Scaffold 全体を外側の Stack でラップ**し、それらを外側 Stack の子として配置すること。

```dart
// ❌ 禁止（MissionCutIn が body 内 Stack に入っているため AppBar を覆えない）
Scaffold(
  appBar: ...,
  body: Stack(
    children: [
      _buildBody(),
      FloatingMissionBubble(...),
      if (_showCutIn) MissionCutIn(...),   // AppBar の下にしか表示されない
      if (done) QuizResultOverlay(...),
    ],
  ),
)

// ✅ 正しい（shopping の cart_quiz_screen.dart と同じパターン）
Stack(
  children: [
    Scaffold(
      appBar: ...,
      body: _buildBody(),
    ),
    if (state.status == QuizStatus.playing)
      FloatingMissionBubble(...),
    if (_showCutIn) MissionCutIn(...),     // AppBar も含めて全画面を覆う
    if (done) Positioned.fill(child: QuizResultOverlay(...)),
  ],
)
```

- `FloatingMissionBubble` も外側 Stack に移動する（`Positioned` を使うため Stack 直下が必須）
- 外側 Stack での `FloatingMissionBubble` の初期位置は `MediaQuery.paddingOf(context).top + kToolbarHeight` で AppBar 下を自動計算する

## 💬 FloatingMissionBubble には必ず onGiveUp と onHintTap を接続する

すべてのクイズ画面で `FloatingMissionBubble` に以下を接続すること:

| パラメータ | 接続内容 | 条件 |
|-----------|---------|------|
| `onGiveUp` | `() => notifier.giveUp()` | **必須**（全クイズ） |
| `onHintTap` | `() => notifier.useHint()` | ヒント機能がある場合のみ |
| `hintUsed` | `state.hintUsed` | ヒント機能がある場合のみ（`false` のハードコード禁止） |

```dart
// ❌ 禁止（onGiveUp 未接続、hintUsed ハードコード）
FloatingMissionBubble(
  missionText: missionText,
  remainingSeconds: state.remainingSeconds,
  timeLimitSeconds: QuizConfig.timeLimitSeconds,
  hintUsed: false,
)

// ✅ 正しい
if (state.status == QuizStatus.playing)
  FloatingMissionBubble(
    missionText: missionText,
    remainingSeconds: state.remainingSeconds,
    timeLimitSeconds: QuizConfig.timeLimitSeconds,
    hintUsed: state.hintUsed,            // State から取得
    onHintTap: hasHint                   // ヒントがある場合のみ接続
        ? () => notifier.useHint()
        : null,
    onGiveUp: () => notifier.giveUp(),   // 必ず接続
  ),
```

- `FloatingMissionBubble` は `state.status == QuizStatus.playing` のときのみ表示すること

## 💡 ヒント機能の実装パターン

ヒントを持つクイズでは shopping の cart_quiz_screen.dart を参考に以下のパターンを採用する:

1. **State に `hintUsed` フィールド**を追加（デフォルト `false`）
2. **Notifier に `useHint()` メソッド**を追加（`hintUsed = true` にセット）
3. **FloatingMissionBubble の `onHintTap`** で `notifier.useHint()` を呼ぶ
4. **画面内にインライン表示**（`hintUsed == true` のとき body 上部にヒントカードを表示）
5. `retry()` 時は `State.initial()` を使って `hintUsed` が `false` にリセットされることを確認

AppBar にヒントボタンを独立して置くのは非推奨。FloatingMissionBubble との二重管理になる。

## 🗂️ 新カテゴリは quiz_core の i18n と stage_list_screen に必ず登録する

新カテゴリを追加した際は以下を**必ずセット**で実施すること。漏れると英語IDがそのまま表示される。

### quiz_core の i18n に追加
`packages/quiz_core/assets/i18n/ja.i18n.json` と `en.i18n.json` に追記:
```json
"play": {
  "categoryLabel": {
    "<category>": "<日本語カテゴリ名>"
  },
  "stageTitle": {
    "<category>_quiz1": "<日本語タイトル>",
    "<category>_quiz2": "...",
    ...
  },
  "stageDescription": {
    "<category>_quiz1": "<日本語説明>",
    ...
  },
  "categoryDescription": {
    "<category>": "<日本語説明>"
  }
}
```

### stage_list_screen.dart の switch 文に追加
`apps/app_main/lib/presentation/play/stage_list_screen.dart`:
```dart
String _categoryLabel(String categoryId, Translations t) {
  return switch (categoryId) {
    // ...
    '<category>' => t.play.categoryLabel.<category>,  // ← 追加
    _ => categoryId,
  };
}

String _stageTitle(String stageId, Translations t) {
  return switch (stageId) {
    // ...
    '<category>_quiz1' => t.play.stageTitle.<category>_quiz1,  // ← 追加
    '<category>_quiz2' => t.play.stageTitle.<category>_quiz2,
    _ => stageId,
  };
}
```

**必須:** `categoryColor` の switch にも同カテゴリを追加すること。漏れると `colorScheme.primary`（デフォルト）になりカテゴリ固有色が表示されない。
```dart
final categoryColor = switch (categoryId) {
  // ...
  '<category>' => ext.<category>CategoryColor,  // ← 追加（category_list_screen と同じ色値を使う）
  _ => colorScheme.primary,
};
```

### category_list_screen.dart の switch 文に追加
`apps/app_main/lib/presentation/play/category_list_screen.dart` の `_categoryLabel` / `_categoryColor` / `_categoryContainerColor` にも同様に追加。

---

## 📋 リザルトInsightには QuizInsightContent を使う

`QuizResultOverlay` の `insight` パラメータには、必ず `quiz_core` の
`QuizInsightContent` ウィジェットを使用すること。各クイズ画面にプライベートな
Insightウィジェット（`_*Insight`, `_InsightHeader`, `_InsightItem` 等）を
独自定義することは禁止する。

```dart
// ❌ 禁止（プライベートウィジェットを新規定義）
class _MyQuizInsight extends StatelessWidget { ... }

// ✅ 正しい（QuizInsightContent を使用）
QuizResultOverlay(
  ...
  insight: Builder(
    builder: (context) {
      final insight = context.s.quizN.insight;
      return QuizInsightContent(
        title: insight.title,
        subtitle: insight.subtitle,
        items: [
          QuizInsightItem(emoji: '📱', title: insight.step1Title, desc: insight.step1Desc),
          QuizInsightItem(emoji: '👆', title: insight.step2Title, desc: insight.step2Desc),
          QuizInsightItem(emoji: '✅', title: insight.step3Title, desc: insight.step3Desc),
        ],
      );
    },
  ),
),
```

- `title`, `subtitle`, アイテムのテキストはすべて i18n（Slang）経由で取得すること
- アイコンには emoji 文字列（`String`）を使用する
- `Builder` を使うのは `context.s` などの i18n アクセサが `BuildContext` を必要とするため

---

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
