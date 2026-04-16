# クイズカテゴリ設計規約

## カラー定義

- **禁止**: プレゼンテーション層での `Color(0xFF...)` / `Colors.white` 等のハードコード
- **必須**: `ThemeExtension` で定義・管理（ダークモード対応）

### 実装手順
1. `packages/quiz_core/lib/src/theme/<category>_app_theme.dart` を作成
2. `@immutable class <Category>AppTheme extends ThemeExtension<<Category>AppTheme>` を実装
3. `static const light` / `static const dark` を定義、`copyWith` と `lerp` を手動実装
4. `app_theme.dart` の `lightTheme.extensions` と `darkTheme.extensions` に追加
5. `quiz_core.dart` にエクスポート追加
6. プレゼンテーション層: `Theme.of(context).extension<<Category>AppTheme>()!.fieldName`

## テキスト定義

- **禁止**: 日本語・英語ベタ書き
- **必須**: `assets/i18n/<locale>.i18n.json` に定義し Slang でアクセス

| ロケール | 用途 |
|--------|------|
| `ja` | ミッションテキスト・解説（読める日本語） |
| `en` | 英語版 |
| `xx` | クイズUI内テキスト（カスタム言語） |

```dart
extension <Category>TranslationsExtension on BuildContext {
  Translations get s => AppLocale.ja.buildSync();   // ミッション用
  Translations get sq => AppLocale.xx.buildSync();  // クイズUI用
}
```

## 制限時間

- **必須**: `domain/<category>_quiz_config.dart` に `static const int timeLimitSeconds` として定義
- **禁止**: 数値のベタ書き

## タイマー実装パターン

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

## 複数クイズの共通化（.family）

```dart
enum <Category>QuizType { quiz1, quiz2, quiz3 }

final <category>QuizProvider = NotifierProvider.autoDispose
    .family<<Category>QuizNotifier, <Category>QuizState, <Category>QuizType>(
  <Category>QuizNotifier.new,
);
```

## クイズ画面レイヤー構造（MissionCutIn / AppBar のz-index）

Scaffold全体を外側 Stack でラップし、MissionCutIn / QuizResultOverlay を外側 Stack の子として配置すること。

```dart
// ✅ 正しい
Stack(
  children: [
    Scaffold(appBar: ..., body: _buildBody()),
    if (state.status == QuizStatus.playing) FloatingMissionBubble(...),
    if (_showCutIn) MissionCutIn(...),
    if (done) Positioned.fill(child: QuizResultOverlay(...)),
  ],
)
```

## FloatingMissionBubble の必須接続

| パラメータ | 接続 | 条件 |
|-----------|------|------|
| `onGiveUp` | `() => notifier.giveUp()` | **必須** |
| `onHintTap` | `() => notifier.useHint()` | ヒントがある場合のみ |
| `hintUsed` | `state.hintUsed` | ヒントがある場合のみ（`false` ハードコード禁止） |

`FloatingMissionBubble` は `state.status == QuizStatus.playing` のときのみ表示。
外側 Stack での初期位置: `MediaQuery.paddingOf(context).top + kToolbarHeight`

## ヒント機能パターン

1. State に `hintUsed` フィールド（デフォルト `false`）
2. Notifier に `useHint()` メソッド（冪等ガード必須）
3. `retry()` 時は `State.initial()` で `hintUsed` が `false` にリセット

## 新カテゴリ追加時の必須登録先

- `packages/quiz_core/assets/i18n/ja.i18n.json` と `en.i18n.json`（categoryLabel / stageTitle / stageDescription / categoryDescription）
- `apps/app_main/lib/presentation/play/stage_list_screen.dart`（`_categoryLabel` / `_stageTitle` / `categoryColor` の switch）
- `apps/app_main/lib/presentation/play/category_list_screen.dart`（`_categoryLabel` / `_categoryColor` / `_categoryContainerColor` の switch）

## AppBar 内の繰り返しスタイル

同一ファイル内で同じ Container/Row スタイルが複数の AppBar で重複する場合は、プライベートウィジェット（`_Xxx`）に抽出する。複数ファイルから参照する場合はパブリッククラスとしてコンポーネントファイルに定義する。
