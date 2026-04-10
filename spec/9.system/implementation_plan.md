# 🛠️ システム制御実装計画（アップデート・メンテナンス）

Firebase Remote Config を活用し、アプリの状態（メンテナンス・バージョン整合性）をリアルタイムに監視・制御するための実装計画。

## 概要

| 項目 | 内容 |
|------|------|
| 優先順位 | **メンテナンス** ＞ **強制アップデート** ＞ **任意アップデート** |
| 検知タイミング | アプリ起動時（スプラッシュ）、およびフォアグラウンド復帰時 |
| パッケージ | `firebase_remote_config`, `package_info_plus`, `version`, `store_redirect` |
| 制御手法 | メンテナンス：GoRouterによる強制リダイレクト / アップデート：ダイアログ表示 |

---

## 📋 Remote Config パラメータ定義

| キー | 型 | 説明 |
|------|---|------|
| `maintenance_mode` | boolean | `true` の場合、メンテナンス画面へ強制遷移 |
| `maintenance_message` | string | メンテナンス画面に表示する説明文。未設定時はデフォルト文を表示 |
| `force_update_version` | string | この数値未満のバージョンは、ストアへ強制誘導（例: "1.2.0"） |
| `latest_update_version` | string | この数値未満のバージョンは、任意アップデートの案内を表示 |

---

## 🏗️ アーキテクチャ構成

### 1. SystemConfigProvider (Riverpod)
Remote Config の値を監視し、現在のアプリ状態を判定する `StreamProvider` または `NotifierProvider` を作成。
* `firebase_remote_config` の `onConfigUpdated` ストリームを購読し、値の変更をリアルタイムにアプリ状態へ反映する。
* アプリがバックグラウンドから復帰した際にも `fetchAndActivate()` を実行し、最新状態を確保する。

### 2. ルーティング制御 (GoRouter Redirect)
`GoRouter` の `redirect` 関数内で、`SystemConfigProvider` の状態を監視。
* **メンテナンスモード判定**: 状態が `true` なら、現在のパスに関わらず `/maintenance` へリダイレクト。
* **メンテナンス解除時**: `/maintenance` から元の画面（またはホーム）へ自動復帰。

---

## 🛠️ 実装詳細

### Phase 1: メンテナンス画面 (`/maintenance`)
* **UI**: ナントムの「悲しい(Sad)😢」画像とともに、`maintenance_message` を表示。
* **制限**: 戻るボタンやナビゲーションを一切排除したフルスクリーン画面。

### Phase 2: アップデート判定ロジック
`version` パッケージを使用して、セマンティックバージョニングの比較を行う。

```dart
final currentVersion = Version.parse(packageInfo.version);

try {
  final forceVersionStr = remoteConfig.getString('force_update_version');
  if (forceVersionStr.isNotEmpty) {
    final forceVersion = Version.parse(forceVersionStr);
    if (currentVersion < forceVersion) {
      // 強制アップデート表示（閉じる不可）
      return;
    }
  }

  final latestVersionStr = remoteConfig.getString('latest_update_version');
  if (latestVersionStr.isNotEmpty) {
    final latestVersion = Version.parse(latestVersionStr);
    if (currentVersion < latestVersion) {
      // 任意アップデート表示（閉じる可）
      return;
    }
  }
} on Exception {
  // バージョン文字列のパース失敗時は通常状態として扱う
}
```

### Phase 3: アップデートダイアログ
* **強制アップデート**:
  * ストア遷移ボタンのみ。
  * `PopScope` (または `WillPopScope`) を使い、システムバックボタンによるキャンセルを無効化。
* **任意アップデート**:
  * ストア遷移ボタン ＋ 「後で」ボタン。
* **ストア遷移**: `store_redirect` パッケージを使用し、OS（iOS/Android）に応じたストアページへ一発で飛ばす。

---

## ⚙️ スプラッシュ画面との統合

前項の `SplashScreen` での初期化フローに、このシステムチェックを組み込む。

1. `AppInitializer.initialize()` 内で Remote Config の初期フェッチを完了させる。
2. `Future.wait` の完了後、まずメンテナンス・強制アップデートの有無を確認。
3. 問題がなければ、通常のチュートリアル判定 or ホーム遷移へ進む。

## 💡 運用上の注意
* **キャッシュ時間**: `fetchTimeout` と `minimumFetchInterval` を適切に設定（デバッグ時は0、本番は数分〜1時間程度）し、サーバー負荷とリアルタイム性のバランスを取る。
* **OS別管理**: 将来的に iOS と Android で強制アップデートのタイミングを分けたい場合は、Remote Config の条件（Condition）機能を使って OS ごとに異なる値を配信する。
