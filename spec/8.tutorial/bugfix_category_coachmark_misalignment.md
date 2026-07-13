# バグ修正計画: カテゴリ選択画面のコーチマーク表示ズレ

## 症状

アプリ初回起動時のチュートリアル Step 4（クイズカテゴリ選択画面）で、
端末によってコーチマーク（フォーカスホール＋吹き出し）が Shopping カードから
ズレた位置に表示されることがある。

## 調査結果（原因）

### 前提: 座標指定ではない

`category_list_screen.dart` は `tutorial_coach_mark` パッケージを使用しており、
ターゲットは `GlobalKey`（`keyTarget: _shoppingCardKey`）で指定されている。
生の座標指定にはなっていない。問題は **位置を取得するタイミング** にある。

### 根本原因: ページ遷移アニメーション中に位置を取得している

1. `tutorial_coach_mark`（v1.3.3）はフォーカス開始時に **一度だけ**
   `RenderBox.localToGlobal()` でターゲット矩形を取得し、以後その固定座標に
   フォーカスホールを描画する（再計算されるのは `didChangeMetrics`＝画面サイズ・
   回転変更時のみ。ソース: `src/util.dart` の `getTargetCurrent()`、
   `src/widgets/animated_focus_light.dart` の `_runFocus()`）。

2. `CategoryListScreen` はホーム画面から `context.push('/play')` で遷移してくる。
   現在のフロー:
   - `initState` の `addPostFrameCallback` → 遷移アニメーションの **1フレーム目** に発火
   - `ref.read(tutorialNotifierProvider.future)` はホーム画面で読み込み済みのため即時解決
   - さらに 1 回 `addPostFrameCallback` を挟んで `_showTutorial()` 実行
   - つまり遷移開始から **約2フレーム（16〜33ms）後** にコーチマークが表示される

3. ページ遷移アニメーション（Android デフォルト: Zoom＝scale 0.85→1.0＋フェード、
   iOS: 右からのスライド。所要 300〜500ms）の最中は、ページの RenderObject に
   scale / translate 変換がかかっている。`localToGlobal()` はこの変換を含んだ
   「遷移途中の見た目上の位置」を返すため、取得された矩形は最終位置からズレている
   （Zoom なら縮小されて中央寄り、スライドなら右寄り）。

4. 遷移完了後、ページは最終位置に収まるが、フォーカスホールは取得済みの古い座標の
   まま描画され続ける → ズレて見える。

### 「端末によって」ズレ方が変わる理由

- プラットフォームで遷移の種類が異なる（Android: Zoom / iOS: Cupertino slide）
- 設定の `AppUiStyle`（`app.dart` で `ThemeData.platform` を上書き）でも遷移が変わる
- 端末の描画速度により、位置取得時点でアニメーションがどこまで進んでいるかが変わる

### 補足: 他画面への影響

- **ホーム画面（Step 1〜3）**: 初期ルートのため遷移アニメーションがなく影響なし
- **TutorialWaterQuizScreen（Step 5〜7）**: MissionCutIn 完了後（遷移完了から
  数秒後）に表示するため影響なし
- 対応は `category_list_screen.dart` のみでよい

## 修正方針

`apps/app_main/lib/presentation/play/category_list_screen.dart` の
`_maybeShowTutorial()` で、コーチマーク表示前に **ページ遷移アニメーションの完了を
待つ** 処理を追加する。

```dart
Future<void> _maybeShowTutorial() async {
  final tutState = await ref.read(tutorialNotifierProvider.future);
  if (!mounted) return;
  if (tutState.isCompleted ||
      tutState.screen != TutorialScreen.categoryList) {
    return;
  }

  // ページ遷移アニメーション中に localToGlobal で位置を取得すると
  // 遷移途中の座標が固定されてしまうため、遷移完了を待ってから表示する
  await _waitForRouteTransition();
  if (!mounted) return;

  // 遷移完了後の最終レイアウトが確定したフレームで表示する
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (mounted) _showTutorial();
  });
}

/// 現在のルートの遷移アニメーション完了を待つ。
/// アニメーションがない（初期ルート・遷移済み）場合は即座に完了する。
Future<void> _waitForRouteTransition() {
  final animation = ModalRoute.of(context)?.animation;
  if (animation == null ||
      animation.status == AnimationStatus.completed ||
      animation.status == AnimationStatus.dismissed) {
    return Future.value();
  }
  final completer = Completer<void>();
  late final AnimationStatusListener listener;
  listener = (status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      animation.removeStatusListener(listener);
      completer.complete();
    }
  };
  animation.addStatusListener(listener);
  return completer.future;
}
```

### 実装上の注意

- `dart:async`（`Completer`）と `AnimationStatusListener` を使うため import 追加が必要
- 既存のガード（`mounted` / `ModalRoute.isCurrent` / `_shoppingCardKey.currentContext`
  の null チェック）は `_showTutorial()` 内にそのまま残す
- ヘルパーは現状 `_CategoryListScreenState` の private メソッドでよい
  （他画面で必要になったら `presentation/tutorial/` へ切り出す）
- アニメーション無効設定（アクセシビリティ等）の端末では status が即 completed に
  なるため、上記コードで自然に即時表示となる

## テスト方針

- `_waitForRouteTransition` を含むチュートリアル表示フローの Widget テスト:
  1. チュートリアル未完了状態で CategoryListScreen を **push 遷移** で表示し、
     遷移アニメーション中（`pump` 途中）はコーチマークが出ないこと
  2. `pumpAndSettle` で遷移完了後にコーチマーク（TutorialCoachMark のオーバーレイ）
     が表示されること
  3. チュートリアル完了済み状態では表示されないこと（既存動作の回帰確認）
- 既存のチュートリアル関連テストがあれば流用・追記する
- テストパターンは `.agents/skills/testing-patterns.md` に従う
