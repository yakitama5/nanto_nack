# 🍔 フードデリバリーアプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件（※厳守事項）
スマホの直感操作をテーマにした謎解きゲームの「フードデリバリーアプリ（UberEats系）編」を実装する。

**【Presentation層の共通化に関する厳守事項】**
全4問（Quiz1〜4）は独立したクイズとして出題されるが、Presentation層（モックのデリバリーUIと状態管理）は**全クイズで完全に共通の基盤（1つの大きなアプリ）**を使用することを厳守する。
クイズごとに機能を制限せず、常にすべての機能（カテゴリの横スクロール、個数の増減、カートのタップ、配達ボトムシートの引き上げ）が動作する状態を維持すること。
クイズによって変化するのは、**「ユーザーのどの操作・状態変化を監視してクリア判定（正解）とするか」という条件のみ**である。

## 2. データモデル
以下のクラスを定義して、商品や配達状態を表現する。

### FoodCategory
- `id`: String
- `name`: String (例: ハンバーガー、寿司、ピザ)
- `iconUrl`: String (カテゴリアイコン画像)

### DeliveryState (Enum)
- `browsing` (商品を選んでいる状態)
- `tracking` (注文完了し、配達状況を見ている状態)

## 3. 状態管理 (Riverpod)
デリバリーアプリの共通状態を管理する `DeliveryAppNotifier` を実装する。クイズごとに初期化されるよう `autoDispose` を使用すること。

### 保持する状態 (State)
- `currentViewState`: DeliveryState (現在の画面状態。Quiz4のみ初期値を `tracking` にする等で対応)
- `orderQuantity`: int (選択中の商品の注文個数。初期値は1)
- `trackingSheetExtent`: double (配達トラッキング画面のボトムシートの引き上げ具合)

### 状態更新メソッド (Actions)
- `tapCategory(String id)`: 特定のカテゴリがタップされたことを記録・判定用。
- `incrementQuantity()`: `orderQuantity` を +1 する。
- `decrementQuantity()`: `orderQuantity` を -1 する（最小1）。
- `tapCartButton()`: カート確認ボタンがタップされたことを記録・判定用。
- `updateTrackingSheetExtent(double extent)`: ボトムシートの大きさを更新する。

## 4. 共通UIコンポーネント構成
「商品選択画面」と「配達トラッキング画面」の2つの主要ビューを構築する（`currentViewState` で出し分け）。

### BrowsingView（商品選択画面）
- **CategoryHorizontalList**: 画面上部のカテゴリ一覧。
  - `ListView.builder` の `scrollDirection: Axis.horizontal` で実装する。
  - **重要**: 「ピザ」などの特定カテゴリは、初期表示では画面右外にはみ出しており、**横スクロールしないと見えない**ようにアイテム幅を調整すること。タップ時に `tapCategory` を発火。
- **ItemDetailArea**: 商品写真と詳細。
  - 「−」「1」「＋」のように並んだ**数量変更ステッパー**を配置。「＋」タップで `incrementQuantity` を発火。
- **FloatingCartButton**: 画面下部に浮かぶカートボタン。
  - 選択中の数量×単価の合計金額を表示する目立つボタン。タップで `tapCartButton` を発火。

### TrackingView（配達トラッキング画面）
- **MapBackground**: 背面にダミーの地図画像（またはシンプルなコンテナ）を配置。
- **CourierBottomSheet**: 配達員情報シート。
  - **`DraggableScrollableSheet`** を使用し、初期状態では画面下部1/3程度（`initialChildSize: 0.3`）のみ表示させる。
  - 上に向かってドラッグすることで全画面（`maxChildSize: 1.0`）まで引き上げられるようにし、`NotificationListener<DraggableScrollableNotification>` で `updateTrackingSheetExtent` を発火させる。

## 5. クイズごとのクリア判定条件
ベースとなるアプリは常にフル機能で動作する。

### Quiz1: 「ピザ」のジャンルを探す
- **お題**: 「今日はピザの気分！カテゴリ一覧からピザを探そう」
- **想定操作**: 画面上部の丸いアイコン列を横にスワイプし、隠れているピザのアイコンをタップする。
- **クリア条件**: `tapCategory()` が呼ばれ、渡されたIDが「ピザ」のものだった瞬間にクリア。

### Quiz2: 注文する個数を「2つ」に増やす
- **お題**: 「友達の分も頼もう。注文数を2つに増やして」
- **想定操作**: 商品詳細画面で、数字の「1」の横にある「＋（プラス）」ボタンをタップする。
- **クリア条件**: `incrementQuantity()` が実行され、`orderQuantity` が `2` になった瞬間にクリア。

### Quiz3: カート（買い物かご）を確認する
- **お題**: 「注文内容が決まったら、カートの中身を確認しよう」
- **想定操作**: 画面下部に浮いている「カートを確認（合計金額）」のボタンをタップする。
- **クリア条件**: `tapCartButton()` が呼び出された瞬間にクリア。

### Quiz4: 配達員の現在地を全画面で確認する
- **前提**: このQuiz開始時のみ、`currentViewState` を `tracking` にして開始する。
- **お題**: 「配達員さんは今どこかな？地図を全画面に広げて確認しよう」
- **想定操作**: 画面下部にある配達員情報（ボトムシート）を上に向かってスワイプし、引き上げる。
- **クリア条件**: `trackingSheetExtent` が一定以上（例: 0.7以上）になった瞬間にクリア。
