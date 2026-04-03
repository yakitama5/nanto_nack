# 🗂️ 実装タスク進捗レポート

> 最終更新: 2026-04-03（日本語i18n移行完了）  
> ブランチ: `feature/quizzes`

---

## 📊 全体進捗

| Phase | 内容 | 状態 |
| :--- | :--- | :---: |
| Phase 1 | quiz_core 共通基盤拡張 | ✅ 完了 |
| Phase 2 | app_main ルーティング・メニュー統合 | ✅ 完了 |
| Phase 3-A | chat カテゴリ実装 | ✅ 完了 |
| Phase 3-B | streaming カテゴリ実装 | ✅ 完了 |
| Phase 3-C | map カテゴリ実装 | ✅ 完了 |
| Phase 3-D | alarm カテゴリ実装 | ✅ 完了 |
| Phase 3-E | payment カテゴリ実装 | ✅ 完了 |
| Phase 4 | 全カテゴリ結合・ポリッシュ | ⬜ 未着手 |
| 追加作業 | app_main 日本語ベタ書き → slang i18n 移行 | ✅ 完了 |

---

## ✅ Phase 3-C: map カテゴリ（完了）

- [x] Domain層: `map_place.dart`, `map_catalog.dart`
- [x] Application層: 4ユースケース
- [x] Infrastructure層: `map_quiz_repository.dart`, `map_quiz_repository_provider.dart`
- [x] i18n: ja / en / xx 生成済み
- [x] Presentation層: `map_app_screen.dart`（Googleマップ風ベースUI）
- [x] Presentation層: `quiz1_show_location/` `quiz2_search_place/` `quiz3_start_navigation/` `quiz4_save_place/`
- [x] エントリファイル: `map.dart`
- [x] Router接続: `app_main/router.dart` 接続済み

---

## ✅ Phase 3-D: alarm カテゴリ（完了）

- [x] パッケージ作成 (`packages/quizzes/alarm/`)
- [x] `pubspec.yaml`, `analysis_options.yaml`, `slang.yaml`
- [x] i18n ファイル (ja / en / xx) + 生成済み
- [x] Domain層: `AlarmItem` エンティティ、`AlarmCatalog`
- [x] Application層: 4ユースケース（追加・平日設定・スヌーズ無効化・削除）
- [x] Infrastructure層: `AlarmQuizRepository`
- [x] Presentation層: `AlarmListScreen` / `AlarmEditScreen` ベースUI
- [x] Presentation層: Quiz1〜4 (add/weekdays/snooze/delete)
- [x] エントリファイル: `alarm.dart`
- [x] Router接続: `app_main/router.dart` 接続済み
- [x] lint クリア（全10パッケージ No issues）

---

## ✅ Phase 3-E: payment カテゴリ（完了）

- [x] パッケージ作成 (`packages/quizzes/payment/`)
- [x] `pubspec.yaml`, `analysis_options.yaml`, `slang.yaml`
- [x] i18n ファイル (ja / en / xx) + 生成済み
- [x] Domain層: `PaymentContact` / `PaymentTransaction` エンティティ、`PaymentCatalog`
- [x] Application層: 4ユースケース（QR表示・残高確認・送金・取引履歴）
- [x] Infrastructure層: `PaymentQuizRepository`
- [x] Presentation層: `PaymentHomeScreen` / `QrCodeScreen` / `SendMoneyScreen` ベースUI
- [x] Presentation層: Quiz1〜4 (show_qr/reveal_balance/send_money/view_history)
- [x] エントリファイル: `payment.dart`
- [x] Router接続: `app_main/router.dart` 接続済み
- [x] lint クリア（全10パッケージ No issues）

---

## ✅ 追加作業: app_main 日本語ベタ書き → slang i18n 移行（完了）

- [x] `quiz_core/assets/i18n/ja.i18n.json` に新規キー追加（play.stageTitle.*, scene.greeting.*, home.* 等）
- [x] `quiz_core/assets/i18n/en.i18n.json` 英語訳追加
- [x] `fvm dart run slang` で再生成（310文字列、lib/i18n/ 配下）
- [x] `domain/category.dart`: label / description フィールド削除
- [x] `domain/stage.dart`: title / description フィールド削除
- [x] `domain/daily_scene.dart`: greeting フィールド削除（i18n lookup に変更）
- [x] `category_list_screen.dart`: _categoryLabel() ヘルパー関数追加
- [x] `stage_list_screen.dart`: _categoryLabel() / _stageTitle() ヘルパー関数追加
- [x] `home_screen.dart`: _sceneGreeting() / _categoryLabel() 追加、全UI文字列i18n化
- [x] `home_screen.dart`: _CategoryCarousel を kAllCategories ベースに変更（サンプルデータ削除）
- [x] `get_dashboard_data_use_case.dart`: デフォルトTipsのhardcoded日本語を除去
- [x] lint: 全10パッケージ No issues

---

## ⬜ Phase 4: 全カテゴリ結合・ポリッシュ（未着手）

- [ ] ダッシュボードのロック解除（Driftクリア状況と連携）
- [ ] 全体E2Eテスト (patrol)
- [ ] パフォーマンス確認・チューニング

---

## 📝 カテゴリ別クイズ概要

### map カテゴリ
| Quiz | ミッション | クリア条件 |
| :--- | :--- | :--- |
| Quiz 1 | 現在地を表示する | 現在地ボタンをタップ |
| Quiz 2 | 目的地を検索する | 検索バーで場所を選択 |
| Quiz 3 | ルート案内を開始する | ナビゲーション開始ボタンをタップ |
| Quiz 4 | 場所をお気に入りに追加する | 星ボタンをタップして色変化 |

### alarm カテゴリ
| Quiz | ミッション | クリア条件 |
| :--- | :--- | :--- |
| Quiz 1 | アラームを追加する（30秒） | 保存ボタンをタップ |
| Quiz 2 | 平日（月〜金）だけ鳴るように設定（45秒） | 月〜金をすべて選択 |
| Quiz 3 | スヌーズをオフにして保存（60秒） | スヌーズOFF + 保存 |
| Quiz 4 | 一番上のアラームを削除（45秒） | スワイプ → 削除ボタンタップ |

### payment カテゴリ
| Quiz | ミッション | クリア条件 |
| :--- | :--- | :--- |
| Quiz 1 | QRコードを表示する（30秒） | QRコードボタンをタップ |
| Quiz 2 | 残高を確認する（30秒） | 残高ブラーをタップして解除 |
| Quiz 3 | 誰かに送金する（60秒） | コンタクト選択 → 金額入力 → 送金ボタン |
| Quiz 4 | 取引履歴を確認する（30秒） | 履歴タブをタップ |
