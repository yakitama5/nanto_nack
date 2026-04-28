# Data Handling & Game Logic (オンデマンド参照)

> **いつ読む:** ローカルDB（Drift）操作・Firebase連携・ゲーム進行ロジック・課金実装時に読み込むこと。

<data_and_business_logic>

## ローカルデータ (Drift)

- ローカルDBには `drift` を使用すること。
- **プレイデータの永続化:** 以下のフィールドを正確に保存・取得すること。

| フィールド | 型 | 説明 |
|---|---|---|
| `isCleared` | `bool` | クイズクリア済みフラグ |
| `clearTimeMs` | `int` | クリアまでの経過時間（ミリ秒） |
| `score` | `int` | 獲得スコア |
| `failureCount` | `int` | 失敗回数 |

- DBアクセスは Repository 経由とし、Notifier から直接 DB を呼び出すことを禁止する。

## バックエンド (Firebase)

`packages/system` パッケージ内で以下の機能を初期化・管理する:

| 機能 | 用途 |
|---|---|
| RemoteConfig | フィーチャーフラグ・動的な設定値の配信 |
| Crashlytics | クラッシュレポート収集 |
| Analytics | ユーザー行動の計測 |

- 各 quizzes/* パッケージから直接 Firebase を呼び出さず、`system` パッケージ経由で利用すること。

## ゲーム進行とマネタイズ

### ステージ解放ロジック

- **順次解放方式:** 前のステージが `isCleared == true` になった場合のみ次の問題を解放する。
- 任意のステージへのジャンプは禁止（ステージ1を未クリアでステージ3を解放しない）。

### 課金 (IAP)

- `in_app_purchase` パッケージを想定。
- **広告は原則排除。** 課金のみで収益化する設計方針。

### プレイ回数制限

- 1日のプレイ回数制限やその解除フラグは `system` パッケージで一括管理すること。
- 各 quizzes/* で個別に管理しない（重複実装を防ぐ）。

</data_and_business_logic>
