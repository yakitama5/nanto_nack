# 📊 NantoNack ダッシュボード画面 実装計画 (Detailed)

この計画は `apps/app_main` パッケージ内での実装を主軸とし、`system` や `quiz_core` との連携を含みます。

## 1. Domain層：データモデルとルールの定義

UIに依存しない、ダッシュボードの「核」となるデータ構造を定義します。

- **`DailyTip` (Entity)**: `id`, `title`, `content` を持つイミュータブルなクラス。`copyWith` を実装。
- **`UserActivity` (Value Object)**: 日付ごとのクリア数やスコアを保持。ヒートマップ描画の最小単位。
- **`DashboardState` (Entity)**:
  - `remainingPlayCount`: 本日の残りプレイ可能数（int）。
  - `dailyTip`: 今日表示するTips（UiTip）。
  - `activityHistory`: 過去60日間のプレイ履歴リスト（List<UserActivity>）。
  - `currentStreak`: 現在の連続プレイ日数（int）。

## 2. Infrastructure層：データソースの操作

外部（Firebase/Drift）からデータを取得する具体的な処理です。

- **`DashboardRepository` (Interface & Implementation)**:
  - **Remote Config経由**: `fetchRawTips()` で全TipsのJSON文字列を取得し、`UiTip.fromJson` でリスト化して返す。
  - **Drift経由**: `getQuizHistory(DateTime since)` で、特定期間内の `isCleared == true` なデータを集計して返す。
  - **Drift経由**: `getTodayPlayCount()` で、今日の日付のレコード数をカウント。

## 3. Application層：ビジネスロジックの調整

Presentation層（画面）がそのまま使える形にデータを加工・選択します。

- **`GetDashboardDataUseCase`**:
  1. **Tipsの抽選**: 取得したTipsリストから `Random(DateTime.now().day)` をシード値にして「今日の一枚」を選出。
  2. **プレイ制限判定**: `UserStatus`（課金フラグ）を確認し、未課金なら `5 - 今日のプレイ数` を計算。課金済みなら「∞」として処理。
  3. **ストリーク計算**: 履歴データから、今日まで何日連続でデータが存在するかをカウント。
  4. **ヒートマップ成形**: 60日分のバケットを用意し、実績データをマッピング。

## 4. Presentation層：レスポンシブなUI構築

`responsive_framework` を使い、洗練された「お手本UI」を構築します。

- **`DashboardNotifier` (Riverpod / Notifier)**:
  - 初期化時に `GetDashboardDataUseCase` を実行。
  - `AsyncValue<DashboardState>` でロード中・エラー・データありの状態を管理。
- **Layout 構成**:
  - **`DashboardPage`**: `MaxWidthBox` (800px) で囲み、デスクトップ時は中央寄せ。
  - **`ResponsiveRowColumn`**: モバイルでは縦（Column）、タブレット以上では横（Row）にTipsと進捗を並べる。
- **カスタムWidget (quiz_core共通部品)**:
  - **`NantoHeatmap`**: `CustomPaint` または `GridView` を使用し、実績に応じた色の濃淡で「草」を描画。
  - **`SkeletonDashboard`**: データ読み込み中に表示する、グレーのグラデーションが動く骨組み表示。

## 5. Testing：品質保証と自動テスト

ダッシュボードのロジックとレスポンシブレイアウトの崩れを防ぐためのテスト設計です。

- **Unit Test (`test`)**: `GetDashboardDataUseCase` に対し、モックデータを与えて「Tipsが日替わりで正しく抽選されるか」「ストリーク日数が正確に計算されるか」を検証。
- **Golden Test (`alchemist`)**: モバイル幅・タブレット幅それぞれのスクリーンサイズで、`DashboardPage` のレイアウトが崩れていないか（特に `ResponsiveRowColumn` の折り返し）をスナップショット検証。
- **E2E Test (`patrol`)**: アプリ起動 → ロード中スケルトン表示 → ダッシュボードデータ表示 までのスムーズな連携を実機（またはエミュレータ）で通しテスト。

------

## 🛠 実装の具体的なステップ

1. **[Infrastructure]** `system` パッケージの Drift DAO に、日付指定の集計クエリを追加。
2. **[Infrastructure]** Remote Config に Tips JSON を登録し、取得サービスを作成。
3. **[Domain/Application/Testing]** Tipsの抽選ロジックと、ヒートマップ用のデータ整形ロジックを実装し、**モックを用いたユニットテストを記述・通過させる**。
4. **[Presentation]** `quiz_core` でヒートマップ Widget とダッシュボード用カード Widget を作成。
5. **[Presentation]** `app_main` で `DashboardNotifier` を作成し、各セクションを結合。
6. **[Layout]** `responsive_framework` を適用して、シミュレーターを切り替えながら左右余白やカラム崩れがないか手動で調整。
7. **[Testing]** `alchemist` を用いて、実装したダッシュボード画面のマルチデバイス向け Golden Test を実装し、差分がないことを確認。
8. **[Testing]** `patrol` を用いて、アプリ起動からダッシュボード描画完了までの E2E Test を記述し、テストスクリプトを完成させる。
