# 📅 カレンダーアプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件（※厳守事項）
スマホの直感操作をテーマにした謎解きゲームの「カレンダーアプリ編」を実装する。
UIの実装には **`cr_calendar`** パッケージを使用する。

**【Presentation層の共通化に関する厳守事項】**
全4問（Quiz1〜4）は独立したクイズとして出題されるが、Presentation層（モックのカレンダーアプリUIと状態管理）は**全クイズで完全に共通の基盤（1つの大きなアプリ）**を使用することを厳守する。
クイズごとに機能を制限せず、常にすべての機能（スワイプでの月切り替え、長押しでの予定追加、ドラッグ＆ドロップによる予定移動、今日へのジャンプ）が動作する状態を維持すること。
クイズによって変化するのは、**「どの操作・状態変化を監視してクリア判定とするか」という条件のみ**である。

## 2. データモデル
`cr_calendar` の仕様に合わせ、表示用データは `CalendarEventModel` に変換して扱う。

### CalendarEvent（内部管理用アプリモデル）
- `id`: String (一意のID)
- `title`: String (予定のタイトル)
- `begin`: DateTime (開始日時)
- `end`: DateTime (終了日時)
- `color`: Color (表示色)

## 3. 状態管理 (Riverpod)
`CalendarAppNotifier` で `CrCalendarController` とイベントリストを管理する。

### 保持する状態 (State)
- `crCalendarController`: CrCalendarController (パッケージ制御用)
- `events`: List<CalendarEvent> (予定のマスターデータ)
- `focusedMonth`: DateTime (現在表示中の月監視用)

### 状態更新メソッド (Actions)
- `swipeToMonth(DateTime month)`: `controller.swipeToMonth(month)` を呼び出し表示月を切り替える。
- `addEvent(DateTime date, String title)`: 新しい `CalendarEvent` をリストに追加し、controller のイベントを更新する。
- `moveEvent(String eventId, DateTime newDate)`: 予定の `begin/end` を更新し、カレンダーを再描画する。
- `jumpToToday()`: `controller.swipeToMonth(DateTime.now())` を実行する。

## 4. 共通UIコンポーネント構成
`cr_calendar` をベースに構築する。

- **CalendarAppScaffold**: 全体のベース。
  - AppBarの「今日」ボタンで `jumpToToday` を実行。
  - 右下の「＋」ボタンで `addEvent` ダイアログを表示。
- **CrCalendarWidget**: メインのカレンダー。
  - `initialDate` に `focusedMonth` を指定。
  - `onSwipe`: 表示月が変わった際に `focusedMonth` の状態を更新する。
  - `dayItemBuilder`: 各日付マスのカスタムビルド。
    - **重要**: `GestureDetector` でラップし、`onLongPress` でその日の `addEvent` を発動させる。
    - `DragTarget` を実装し、予定のドロップを受け付け `moveEvent` を発火させる。
- **EventWidget**: カレンダー上に表示される予定の見た目。
  - `Draggable` でラップし、長押しで他の日に移動（`moveEvent`）できるように実装する。

## 5. クイズごとのクリア判定条件
ベースとなるアプリは常にフル機能で動作する。

### Quiz1: 来月の予定を見る
- **お題**: 「来月、どんな予定が入っていたか確認しよう」
- **想定操作**: カレンダーを右から左へスワイプする。
- **クリア条件**: `focusedMonth` が初期状態の翌月になった瞬間にクリア。

### Quiz2: 予定を素早く追加する
- **お題**: 「15日に新しい予定を追加しよう」
- **想定操作**: 15日のマスを長押しする（または＋ボタンを使用）。
- **クリア条件**: `addEvent()` が呼ばれ、15日のイベントが増えた瞬間にクリア。
- **解説**: 「実は日付を長押しするだけでも追加できるよ！」

### Quiz3: 予定の日付を変更する
- **お題**: 「今日予定されていた『会議』が明日に延期になった！予定を移動させよう」
- **想定操作**: 予定ブロックを長押しして掴み、翌日のマスへドラッグ＆ドロップする。
- **クリア条件**: `moveEvent()` が実行され、対象の `CalendarEvent` の日付が翌日に更新された瞬間にクリア。

### Quiz4: 一瞬で「今日」に戻る
- **お題**: 「未来までスクロールしすぎて迷子になっちゃった！一瞬で『今日』に戻ろう」
- **初期状態**: 数年後の未来が表示された状態で開始。
- **想定操作**: AppBarの「今日（カレンダーアイコン）」をタップ。
- **クリア条件**: `jumpToToday()` が呼ばれ、`focusedMonth` が現在の年月に戻った瞬間にクリア。
