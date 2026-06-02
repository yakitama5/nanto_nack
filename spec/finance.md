# 📈 株価・暗号資産アプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件（※厳守事項）
スマホの直感操作をテーマにした謎解きゲームの「株価・暗号資産アプリ（TradingView系）編」を実装する。
グラフの描画には **`fl_chart`** パッケージを使用し、直感的なズーム/パン操作には **`InteractiveViewer`** を使用する。

**【Presentation層の共通化に関する厳守事項】**
全4問（Quiz1〜4）は独立したクイズとして出題されるが、Presentation層（モックの株価UIと状態管理）は**全クイズで完全に共通の基盤（1つの大きなアプリ）**を使用することを厳守する。
クイズごとに機能を制限せず、常にすべての機能（過去へのパン、ピンチズーム、長押しでの十字線、期間チップの切り替え）が動作する状態を維持すること。
クイズによって変化するのは、**「ユーザーのどの操作・状態変化を監視してクリア判定（正解）とするか」という条件のみ**である。

## 2. データモデル
以下のクラスを定義して、チャートデータを表現する。

### ChartDataPoint
- `timestamp`: DateTime (日時)
- `price`: double (価格)

### ChartPeriod (Enum)
- `oneDay` (1D), `oneWeek` (1W), `oneMonth` (1M), `oneYear` (1Y)

## 3. 状態管理 (Riverpod)
株価アプリの共通状態を管理する `StockAppNotifier` を実装する。クイズごとに初期化されるよう `autoDispose` を使用すること。

### 保持する状態 (State)
- `chartData`: List<ChartDataPoint> (表示するダミーのグラフデータ)
- `selectedPeriod`: ChartPeriod (選択中の表示期間。初期値は `oneDay`)
- `currentScale`: double (InteractiveViewerの現在の拡大/縮小率。初期値は1.0)
- `panOffset`: Offset (InteractiveViewerの現在のパン位置)
- `isTouchingChart`: bool (グラフを長押しして十字カーソルを出している状態か)

### 状態更新メソッド (Actions)
- `changePeriod(ChartPeriod period)`: 期間を変更する。
- `updateInteraction(double scale, Offset pan)`: ピンチやスワイプ時にスケールと位置を更新する。
- `setTouchState(bool isTouching)`: グラフへのタッチ（長押し）状態を更新する。

## 4. 共通UIコンポーネント構成
プロ向けツールのような、ダークモードが似合うクールなUIで構築する。

- **StockAppScaffold**: 全体のベース。上部に現在の価格（大きく表示）を配置。
- **PeriodSelector**: グラフの上（または下）に配置する期間切り替えチップ。
  - 「1D」「1W」「1M」などのボタンを横並びに配置。タップで `changePeriod` を発火。
- **InteractiveChartArea**: 画面中央のメイングラフ領域。
  - **`InteractiveViewer`** で `LineChart` をラップする。
    - `panEnabled: true`, `scaleEnabled: true` に設定。
    - `onInteractionUpdate` コールバックで `updateInteraction` を発火させる。
  - **`LineChart`** (`fl_chart`):
    - 滑らかな折れ線（`isCurved: true`）でデータを描画し、線の下部をグラデーションで塗りつぶす。
    - `lineTouchData` を有効にし、**長押し（タッチ）したポイントに十字のインジケーター（線）と価格ツールチップが表示されるように設定**。
    - `touchCallback` 内で、指が触れた瞬間と離れた瞬間を検知し `setTouchState` を発火させる。

## 5. クイズごとのクリア判定条件
ベースとなるアプリは常にフル機能で動作する。

### Quiz1: 過去のチャート（左側）に遡って確認する
- **お題**: 「昨日はどんな値動きだったんだろう？グラフを過去（左側）に遡ってみよう」
- **想定操作**: グラフ部分を直接触って、右に向かってスワイプ（ドラッグ）し、隠れている左側のグラフを引き出す。
- **クリア条件**: `InteractiveViewer` のパン操作により `panOffset.dx` が一定の閾値（右方向への移動）を超えた瞬間にクリア。

### Quiz2: 長期的なトレンドを見るために縮小する
- **お題**: 「全体像が見えないな。グラフを縮小して全体を表示しよう」
- **想定操作**: グラフ上で2本指を使ってピンチイン（指を閉じる操作）をする。
- **クリア条件**: `InteractiveViewer` の操作により `currentScale` が `1.0` を一定数下回った（例: 0.8以下になった）瞬間にクリア。

### Quiz3: 特定の時間の正確な価格を調べる
- **お題**: 「この一番高い山の頂点、いくらだったんだろう？長押しして調べてみよう」
- **想定操作**: グラフの線の上を長押しして「十字カーソル（クロスヘア）」を出現させる。
- **クリア条件**: `setTouchState(true)` が呼び出され、チャートのタッチイベントが開始された瞬間にクリア。

### Quiz4: 1日のグラフから「1週間のグラフ」に切り替える
- **お題**: 「1日単位じゃ分かりにくい。1週間のグラフに切り替えよう」
- **想定操作**: グラフの上（または下）に並んでいるチップのうち、「1W」のチップをタップする。
- **クリア条件**: `changePeriod()` が呼び出され、`selectedPeriod` が `ChartPeriod.oneWeek` に変わった瞬間にクリア。
