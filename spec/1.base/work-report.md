# NantoNack 基盤構築 作業レポート

## 概要

NantoNack (UI/UX 直感クイズアプリ) の基盤開発を実施した。
単一 Flutter アプリ（デフォルトカウンターアプリ）から、Pub Workspace + Melos によるモノレポ構成へ移行し、Phase 1〜6 の全フェーズを実装した。

- **対象ブランチ:** `chore/base`
- **動作確認:** `flutter run -d chrome` / `flutter build web` による Chrome 動作確認済み
- **静的解析:** 全パッケージで `flutter analyze` → No issues found

---

## ディレクトリ構成

```
chore-base/
├── pubspec.yaml                    # Pub Workspace 宣言
├── melos.yaml                      # Melos スクリプト設定
├── analysis_options.yaml           # 共通静的解析設定 (altive_lints)
│
├── apps/
│   └── app_main/                   # メイン Flutter アプリ
│       ├── dart_define/
│       │   ├── dev.json            # 開発環境設定
│       │   └── prod.json           # 本番環境設定
│       └── lib/
│           ├── main.dart
│           ├── app.dart            # NantoNackApp (MaterialApp.router)
│           ├── router.dart         # go_router ルート定義
│           ├── application/
│           │   └── stage_list_provider.dart  # ステージ解放ロジック
│           ├── domain/
│           │   └── stage.dart      # Stage / StageWithStatus モデル
│           └── presentation/
│               ├── home/
│               │   └── home_screen.dart
│               └── shopping/
│                   └── shopping_stub_screen.dart  # 開発用スタブ
│
└── packages/
    ├── system/                     # 基盤パッケージ
    │   └── lib/src/
    │       ├── database/           # Drift (ローカルDB)
    │       │   ├── app_database.dart
    │       │   ├── app_database_provider.dart
    │       │   ├── quiz_result_repository.dart
    │       │   ├── quiz_result_repository_provider.dart
    │       │   ├── user_status_repository.dart
    │       │   ├── user_status_repository_provider.dart
    │       │   ├── tables/
    │       │   │   ├── quiz_result_table.dart
    │       │   │   └── user_status_table.dart
    │       │   └── connection/     # プラットフォーム別DB接続
    │       │       ├── connection.dart          # 条件付きインポート
    │       │       ├── connection_native.dart
    │       │       ├── connection_web.dart
    │       │       └── connection_unsupported.dart
    │       ├── environment/
    │       │   ├── app_environment.dart  # dart-define-from-file 管理
    │       │   └── env.dart              # envied 機密情報管理
    │       ├── firebase/
    │       │   └── firebase_service.dart  # Firebase 初期化ラッパー
    │       ├── purchase/
    │       │   └── purchase_service.dart  # IAP スタブ
    │       └── initializer.dart
    │
    ├── quiz_core/                  # 共通 UI / エンティティ パッケージ
    │   ├── slang.yaml
    │   └── lib/
    │       ├── i18n/
    │       │   ├── ja.i18n.json    # 日本語翻訳
    │       │   ├── en.i18n.json    # 英語翻訳
    │       │   └── strings.g.dart  # slang 生成ファイル
    │       └── src/
    │           ├── entities/
    │           │   └── quiz_state.dart   # QuizStatus / QuizStateBase
    │           ├── theme/
    │           │   ├── app_colors.dart
    │           │   ├── app_text_styles.dart  # 解読不能フォント等
    │           │   └── app_theme.dart
    │           └── widgets/
    │               ├── stage_card.dart
    │               ├── quiz_result_overlay.dart
    │               └── play_limit_modal.dart
    │
    └── quizzes/
        └── shopping/               # ショッピングカテゴリ クイズパッケージ
            └── lib/src/
                ├── domain/
                │   ├── catalog.dart              # 商品カタログ (5品)
                │   └── entities/
                │       ├── shopping_item.dart
                │       ├── shopping_cart.dart
                │       └── cart_item.dart
                ├── application/
                │   ├── quiz_water_use_case.dart
                │   ├── quiz_cart_use_case.dart
                │   └── quiz_checkout_use_case.dart
                ├── infrastructure/
                │   ├── shopping_quiz_repository.dart
                │   └── shopping_quiz_repository_provider.dart
                └── presentation/
                    ├── shopping_item_tile.dart
                    ├── cart_badge.dart
                    ├── water_quiz/
                    │   ├── water_quiz_state.dart
                    │   ├── water_quiz_notifier.dart
                    │   └── water_quiz_screen.dart
                    ├── cart_quiz/
                    │   └── cart_quiz_screen.dart
                    └── checkout_quiz/
                        └── checkout_quiz_screen.dart
```

---

## フェーズ別 実装内容

### Phase 1: モノレポ基盤と system パッケージの構築

**Pub Workspace + Melos**
- ルート `pubspec.yaml` を Workspace 形式に変換。4パッケージ (`app_main`, `system`, `quiz_core`, `quizzes/shopping`) を管理
- `melos.yaml` を作成。`generate` / `lint` / `test:unit` / `test:all` / `build:web` スクリプトを定義

**静的解析**
- ルート `analysis_options.yaml` を共通設定とし、各パッケージから相対パスでインクルード
- `altive_lints` のカスタムプラグイン設定 (`avoid_hardcoded_color`, `avoid_hardcoded_japanese`) をルートで一元管理

**system パッケージ**

| 機能 | 実装内容 |
|---|---|
| Drift (ローカルDB) | `QuizResults` テーブル (`quizId`, `isCleared`, `clearTimeMs`, `score`, `failureCount`, `lastPlayedAt`)、`UserStatus` テーブル (`dailyPlayCount`, `isPremium`, `lastResetDate`) |
| プラットフォーム別DB接続 | 条件付きインポート (`dart.library.ffi` / `dart.library.js_interop`) でネイティブ/Web を切り替え |
| Firebase | 初期化ラッパー実装。設定ファイル未整備時はスキップするスタブ構造 |
| IAP | `PurchaseService` スタブ実装。Web 非対応を明示 |

### Phase 2: コアUIと多言語化 (quiz_core)

**slang 多言語化**
- 日本語 (`ja.i18n.json`) / 英語 (`en.i18n.json`) の翻訳ファイルを作成
- `build_runner` で型安全な `strings.g.dart` を生成
- `app_main` で `TranslationProvider` + `LocaleSettings.useDeviceLocale()` によりデバイスのロケールを自動検出

**quiz_core パッケージ**

| ファイル | 内容 |
|---|---|
| `quiz_state.dart` | `QuizStatus` enum (idle/playing/correct/incorrect/timeUp/completed)、`QuizStateBase` 抽象クラス。スコア計算ロジック (時間・失敗回数に基づくペナルティ) を実装 |
| `app_colors.dart` | NantoNack カラーパレット (cleared/locked/available 等) |
| `app_text_styles.dart` | 解読不能フォント・極小・ほぼ透明など、クイズ演出用の特殊 TextStyle |
| `stage_card.dart` | 3状態 (cleared/available/locked)、クリアタイム・スコア表示対応 |
| `quiz_result_overlay.dart` | 正解/不正解オーバーレイ。スコア・タイム・リトライ/次へボタン |
| `play_limit_modal.dart` | プレイ上限到達時の課金誘導 BottomSheet |

### Phase 3: 環境構築と機密情報管理

**dart-define-from-file**
- `dart_define/dev.json` / `prod.json` を作成
- `AppEnvironment` クラスで `String.fromEnvironment` による環境値の読み込みを一元管理
  - `FLAVOR`, `APP_NAME`, `API_BASE_URL`

**envied による機密情報管理**
- `packages/system/.env` に Firebase API キー等を記載 (`.gitignore` 対象)
- `.env.example` をコミット対象として提供
- `@Envied(obfuscate: true)` で XOR 難読化した `env.g.dart` を `build_runner` で生成

### Phase 4: アプリ全体のレイアウトと統合 (app_main)

**Repository 層**

| クラス | 役割 |
|---|---|
| `QuizResultRepository` | クイズ結果の保存 (upsert) / カテゴリ別取得 |
| `UserStatusRepository` | 日次プレイカウント管理 (日付変更でリセット)、プレミアムフラグ、上限チェック |

**ゲーム進行ロジック**
- `StageListNotifier` (`AsyncNotifierProvider`) でステージ一覧を管理
- **順次解放方式:** 前のステージが `isCleared == true` の場合のみ次ステージを `available` に設定
- クリア結果保存後に `ref.invalidateSelf()` でリスト自動更新

**ルーティング**

```
/                    → HomeScreen
/shopping/water      → WaterQuizScreen    (水を2つ買おう)
/shopping/cart       → CartQuizScreen     (カートの合計金額確認)
/shopping/checkout   → CheckoutQuizScreen (購入手続き完了)
```

**レスポンシブ対応**
- `responsive_framework` の `ResponsiveBreakpoints` で Mobile/Tablet/Desktop/4K を設定
- `MaxWidthBox(maxWidth: 800)` でデスクトップ時はコンテンツを中央寄せ

### Phase 5: ショッピングカテゴリの実装 (quizzes/shopping)

架空の EC サイト「NantoMall」を舞台に 3 つのクイズを実装。

**Domain 層**
- `ShoppingItem` — 商品エンティティ (`copyWith` 実装)
- `ShoppingCart` — カートエンティティ。`addItem` / `removeItem` / `updateQuantity` / `totalPrice` を実装 (`copyWith` 実装)
- `kShoppingCatalog` — 5種の商品カタログ (天然水 500ml/2L、緑茶、コーヒー、オレンジジュース)

**Application 層 (正誤判定ユースケース)**

| ユースケース | クリア条件 |
|---|---|
| `QuizWaterUseCase` | 水カテゴリ商品が合計 2 個以上 かつ 購入済み |
| `QuizCartUseCase` | 選択した金額 == カートの `totalPrice` |
| `QuizCheckoutUseCase` | 住所入力 + 支払い方法選択 + 確認チェック、全て完了 |

**Infrastructure 層**
- `ShoppingQuizRepository` → `system` パッケージの `QuizResultRepository` を経由して Drift に保存

**Presentation 層**

| 画面 | 内容 |
|---|---|
| `WaterQuizScreen` | 商品一覧 → カートに追加 → 購入。`WaterQuizNotifier` (`NotifierProvider`) で状態管理 |
| `CartQuizScreen` | 固定カート内容を表示し、合計金額を 4択から選択 |
| `CheckoutQuizScreen` | 住所入力 / 支払い方法選択 (RadioListTile) / 確認 CheckBox の 3ステップ |

### Phase 6: テストの実装と CI 設定

**Unit Tests — 19件 (全 pass)**

| ファイル | テスト数 |
|---|---|
| `quiz_water_use_case_test.dart` | 7件 |
| `quiz_cart_use_case_test.dart` | 2件 |
| `quiz_checkout_use_case_test.dart` | 4件 |
| `shopping_cart_test.dart` | 6件 |

**Widget Tests — 3件 (全 pass)**
- `stage_card_test.dart`: クリア済み表示、ロック時のタップ無効、クリアタイム/スコア表示

**Golden Tests — 6件 (全 pass)**
- `stage_card_golden_test.dart`: cleared / locked / available の 3バリアント × CI/ローカルバリアント

**Melos スクリプト**

```bash
melos run generate     # build_runner (drift_dev, slang, envied)
melos run lint         # flutter analyze (全パッケージ)
melos run test:unit    # flutter test (全パッケージ)
melos run test:all     # flutter test (全パッケージ)
melos run build:web    # flutter build web
```

---

## 技術的決定事項

| 項目 | 決定内容 | 理由 |
|---|---|---|
| Drift Web バックエンド | `drift/web.dart` (volatile) を暫定採用 | `drift/wasm.dart` は WASM ファイルのサーブ設定が必要なため、開発フェーズは揮発性インメモリで対応。TODO コメントで移行方針を明示 |
| Firebase 初期化 | スタブ実装 (スキップ) | Firebase プロジェクトの設定ファイル未整備。設定完了後に `FirebaseService.initialize()` を有効化する構造 |
| `riverpod_generator` | 使用禁止 | CLAUDE.md の規約に従い、`Provider` / `NotifierProvider` / `AsyncNotifierProvider` を手動定義 |
| `json_serializable` / `freezed` | 使用禁止 | CLAUDE.md の規約に従い、JSON 変換・`copyWith` はすべて手動実装 |
| `envied` バージョン | `^1.3.3` に変更 | 指定の `^0.5.4` が `analyzer ^9.0.0` と競合したため最新安定版を採用 |
| `alchemist` バージョン | `^0.14.0` に変更 | 指定の `^0.10.0` が Flutter 3.41.5 の Canvas API (`clipRSuperellipse`) と非互換のため |

---

## 検証結果

```
flutter analyze (app_main)   → No issues found ✅
flutter analyze (system)     → No issues found ✅
flutter analyze (quiz_core)  → No issues found ✅
flutter build web            → ✓ Built build\web ✅
flutter test (shopping)      → 19/19 passed ✅
flutter test (quiz_core)     → 9/9 passed ✅
```

---

## 今後の課題

- **Firebase 設定:** Firebase プロジェクト作成後、`firebase_options.dart` を生成して `FirebaseService.initialize()` を有効化
- **Drift Web 移行:** `drift/web.dart` (非推奨) から `drift/wasm.dart` へ移行。`sqlite3.wasm` と `drift_worker.dart.js` のサーブ設定が必要
- **IAP 実装:** `in_app_purchase` パッケージを使った課金フローの本実装
- **E2E テスト:** `patrol` による通しテストの実装 (Phase 6 スコープ外として残存)
- **slang の本格活用:** `avoid_hardcoded_japanese` lint を有効化し、全日本語文字列を翻訳キー経由に移行
