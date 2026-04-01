# Data Handling & Game Logic

## 🔒 Local Data (Drift)

- ローカルDBには `drift` を使用。
- **プレイデータの管理:** `isCleared`, `clearTimeMs`, `score`, `failureCount` を保存し、正確に永続化すること。

## 🔥 Backend (Firebase)

- `packages/system` パッケージ内で以下の機能を初期化・管理する。
  - RemoteConfig
  - Crashlytics
  - Analytics

## 🎮 Game Progression & Monetization

- **ステージ解放:** 前のステージが `isCleared == true` になった場合のみ次の問題を解放する「順次解放方式」をロジックに組み込むこと。
- **課金 (IAP):** `in_app_purchase` を想定。広告は原則排除。
- **制限:** 1日のプレイ回数制限やその解除フラグは `system` パッケージで一括管理すること。
