# 🗄️ NantoNack ローカルDB (Drift) テーブル設計

SQLite（Drift）を利用し、クイズの進捗、毎日のプレイ履歴、およびユーザーの課金・ストリーク状態を管理します。

## 1. StageRecords (ステージごとの最高記録)

各ステージのクリア状況を保存し、次のステージのアンロック判定に使用します。

| カラム名 | データ型 (Drift) | 制約・デフォルト値 | 論理名・説明 |
| :--- | :--- | :--- | :--- |
| `id` | IntColumn | PK, AutoIncrement | レコードID |
| `category_id` | TextColumn | NOT NULL | カテゴリID (例: `'shopping'`) |
| `stage_id` | TextColumn | NOT NULL | ステージID (例: `'stage_1'`) |
| `is_cleared` | BoolColumn | DEFAULT false | クリア状況（trueなら次ステージ解放） |
| `high_score` | IntColumn | DEFAULT 0 | 過去の最高スコア |
| `updated_at` | DateTimeColumn | DEFAULT CURRENT_TIMESTAMP | 最終更新日時 |

---

## 2. PlayLogs (毎回のプレイ履歴)

「今日のプレイ回数」の制限判定や、ダッシュボードの「ヒートマップ描画」に使用するログです。

| カラム名 | データ型 (Drift) | 制約・デフォルト値 | 論理名・説明 |
| :--- | :--- | :--- | :--- |
| `id` | IntColumn | PK, AutoIncrement | ログID |
| `category_id` | TextColumn | NOT NULL | プレイしたカテゴリID |
| `stage_id` | TextColumn | NOT NULL | プレイしたステージID |
| `is_cleared` | BoolColumn | NOT NULL | クリアできたかどうか |
| `score` | IntColumn | NOT NULL | 獲得スコア |
| `failure_count` | IntColumn | DEFAULT 0 | ミスタップ回数 |
| `played_at` | DateTimeColumn | DEFAULT CURRENT_TIMESTAMP | プレイ完了（または失敗）日時 |

*(※ ヒートマップはこのテーブルの `played_at` を日単位で集計して描画します)*

---

## 3. UserProfiles (ユーザーの全体状態)

課金状態や連続プレイ日数（ストリーク）を管理する、常に1行だけ存在するテーブルです。

| カラム名 | データ型 (Drift) | 制約・デフォルト値 | 論理名・説明 |
| :--- | :--- | :--- | :--- |
| `id` | IntColumn | PK, DEFAULT 1 | プロフィールID（常に1） |
| `is_premium` | BoolColumn | DEFAULT false | 課金済みフラグ（プレイ制限なし） |
| `current_streak` | IntColumn | DEFAULT 0 | 現在の連続プレイ日数 (🔥表示用) |
| `last_active_date` | DateTimeColumn | NULLABLE | 最後にプレイした日付（ストリーク計算用） |
