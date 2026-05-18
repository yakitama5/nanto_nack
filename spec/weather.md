# ☀️ 天気予報アプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件（※厳守事項）
スマホの直感操作をテーマにした謎解きゲームの「天気予報アプリ（Yahoo天気系）編」を実装する。

**【Presentation層の共通化に関する厳守事項】**
全4問（Quiz1〜4）は独立したクイズとして出題されるが、Presentation層（モックの天気UIと状態管理）は**全クイズで完全に共通の基盤（1つの大きなアプリ）**を使用することを厳守する。
クイズごとに機能を制限せず、常にすべての機能（PageViewによる都市切り替え、引っ張って更新、ExpansionTileでのアコーディオン展開、レーダーマップのタップ拡大）が動作する状態を維持すること。
クイズによって変化するのは、**「ユーザーのどの操作・状態変化を監視してクリア判定（正解）とするか」という条件のみ**である。

## 2. データモデル
以下のクラスを定義して、天気データを表現する。

### WeatherCity
- `id`: String (都市ID)
- `name`: String (都市名。例：東京都、大阪府)
- `currentTemp`: int (現在の気温)
- `dailyForecasts`: List<DailyForecast> (週間天気データのリスト)

### DailyForecast
- `date`: DateTime (日付)
- `weatherIcon`: String (晴れ、雨などのアイコン/画像パス)
- `highTemp`: int (最高気温)
- `lowTemp`: int (最低気温)
- `hourlyForecasts`: List<HourlyForecast> (時間別天気データ。アコーディオン展開時に表示)

### HourlyForecast
- `hour`: int (時刻。0〜23。モックでは6時始まり3時間刻みで8コマ生成、24超時は%24で正規化)
- `weatherIcon`: String (天気アイコン)
- `temp`: int (気温)
- `precipitationChance`: int (降水確率。0〜100にclamp)

## 3. 状態管理 (Riverpod)
天気アプリの共通状態を管理する `WeatherAppNotifier` を実装する。クイズごとに初期化されるよう `autoDispose` を使用すること。

### 保持する状態 (State)
- `cities`: List<WeatherCity> (登録されている都市のリスト。モックデータを2〜3都市分注入)
- `currentCityIndex`: int (現在表示中の都市インデックス。初期値は0)

### 状態更新メソッド (Actions)
- `changeCity(int index)`: 表示中の都市インデックスを更新する。
- `refreshWeather()`: 天気データの更新処理（ダミーの数秒待機処理など）を実行する。
- `expandDailyForecast(DateTime date)`: 特定の日付のアコーディオンが開かれたことを記録・判定用。
- `openRadarMap()`: 雨雲レーダーが全画面で開かれたことを記録・判定用。

## 4. 共通UIコンポーネント構成
情報量が多く、縦にも横にもスクロールできる天気アプリ特有のUIを構築する。

- **WeatherAppScaffold**: 全体のベース。
- **CityPageView**: メイン領域全体を `PageView` でラップし、**左右のスワイプ**で都市（`currentCityIndex`）を滑らかに切り替えられるようにする。ページ切り替え時に `changeCity` を発火させる。
- **WeatherScrollView**: 各ページ（都市）の中身。
  - 全体を **`RefreshIndicator`** （またはそれに準ずるプルリフレッシュ機能）でラップし、**下に引っ張る操作**で `refreshWeather` を発火させる。
  - 内部は縦スクロールの `ListView` などを配置。
- **DailyForecastTile**: 週間天気の1日分の行。
  - **`ExpansionTile`** を使用し、タップで下部に `hourlyForecasts` （時間ごとの天気グラフやリスト）が展開されるようにする。
  - `onExpansionChanged` コールバックで、開かれた時に `expandDailyForecast` を発火させる。
- **RadarMapCard**: スクロールの途中に配置される、雨雲レーダーの静止画サムネイル。
  - `GestureDetector` でラップし、**タップ操作**で別画面（全画面マップ）への遷移と同時に `openRadarMap` を発火させる。可能なら `Hero` アニメーションでリッチに拡大表示する。

## 5. クイズごとのクリア判定条件
ベースとなるアプリは常にフル機能で動作する。

### Quiz1: 別の地域の天気に切り替える
- **お題**: 「明日は大阪に出張だ。スワイプして大阪の天気を調べよう」
- **想定操作**: 画面全体を右から左へスワイプし、次のページ（都市）へ切り替える。
- **クリア条件**: `PageView` の操作によって `changeCity()` が呼ばれ、`currentCityIndex` が変更された瞬間にクリア。

### Quiz2: 最新の天気データに更新する
- **お題**: 「ちょっとデータが古いかも？引っ張って最新の天気に更新しよう」
- **想定操作**: 画面の最上部で、さらに下に向かってリストを引っ張る（Pull to Refresh）。
- **クリア条件**: `RefreshIndicator` によって `refreshWeather()` が呼び出された瞬間にクリア。

### Quiz3: 時間ごとの天気を詳しく見る
- **お題**: 「水曜日は雨の予報だ……何時頃から降るか、詳しく見てみよう」
- **想定操作**: 週間天気リストの「水曜日」の行をタップし、アコーディオンを展開する。
- **クリア条件**: `ExpansionTile` が開かれ、対象日付で `expandDailyForecast()` が発火した瞬間にクリア。

### Quiz4: 雨雲レーダーを開く
- **お題**: 「空が暗くなってきた！雨雲レーダーのマップを開いて確認しよう」
- **想定操作**: 画面を下へスクロールし、途中にあるレーダーマップの画像をタップする。
- **クリア条件**: `openRadarMap()` が呼び出され、全画面マップが開かれた瞬間にクリア。
