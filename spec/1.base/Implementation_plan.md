# 🚀 NantoNack 実装計画 (Implementation Plan)

## Phase 1: モノレポ基盤とシステム(system)の構築

1. **ワークスペース構築:** ルートの `pubspec.yaml` に **Pub Workspace** の定義を追加し、連動して `melos.yaml` を設定。`app_main`, `system`, `quiz_core`, `quizzes/shopping` 等のカテゴリパッケージを作成し、各々に `resolution: workspace` を指定。
2. **静的解析:** ルートに `analysis_options.yaml` (`altive_lints`) を設定。
3. **systemパッケージの実装:**
   * Firebase (RemoteConfig, Crashlytics, Analytics) の初期化とラッパー実装。
   * **Driftのセットアップ:** `QuizResult` テーブルと `UserStatus` テーブルの定義。`build_runner` 実行。
   * **アプリ内課金基盤:** `in_app_purchase` パッケージの初期化。

## Phase 2: コアUIと多言語化 (quiz_core)

1. **多言語化 (`slang`):** `slang` を導入し、日本語/英語用の翻訳ファイルを作成して `build_runner` で生成。
2. **quiz_coreパッケージの実装:**
   * NantoNack専用の `ThemeData` とカラーパレット定義。
   * 解読不能フォントの `TextStyle`、および「あるあるUIコンポーネント」の実装。
   * イミュータブルな状態管理（`copyWith` 実装）の共通基底クラス作成。

## Phase 3: 環境構築と機密情報管理

1. **環境別設定の導入:** `dart-define-from-file` を利用し、`dev.json`, `prod.json` などのJSONファイルを作成。`String.fromEnvironment` 経由で公開可能な設定値（Flavor, APIのBaseURLなど）を読み込む環境管理クラスを実装。
2. **機密情報の管理:** `envied` パッケージを導入。リポジトリにコミットしない `.env` ファイルにAPIキー等の機密情報を記載し、`build_runner` を実行して難読化されたDartクラス（`Env` クラス）を自動生成。

## Phase 4: アプリ全体のレイアウトと統合 (`app_main`)

1. **レスポンシブ対応:** `responsive_framework` を導入し、`MaxWidthBox` でデスクトップ向けの左右余白レイアウトを構築。
2. **ルーティング:** `go_router` でパスベースの遷移を定義（例: `/shopping/water`, `/shopping/cart`）。
3. **ゲーム進行ロジック:** Driftからクリア状況を取得し、「前のステージが `isCleared` なら次をアンロックする」順次解放ロジックの実装。
4. **画面実装:** ホーム画面（ステージ一覧）、制限到達時の課金（IAP）誘導モーダル。

## Phase 5: ショッピングカテゴリの実装 (`quizzes/shopping`)

※ 1つのパッケージ内に、ECアプリ系の複数のクイズを実装します。

1. **Domain & Application層:** * `shopping` 共通のエンティティ（Cart, Item等）を定義。
   * 「水を2つ購入する」「カートの中身を確認する」など、複数の問題それぞれの正誤判定ユースケースを実装。
2. **Infrastructure層:** クリア時に `system` の Drift Repository を呼び出し、結果とスコアを保存する処理。
3. **Presentation層:** 架空のECアプリのベースとなるUIコンポーネントを作成し、問題ごとに必要な画面（商品一覧画面、カート画面など）とRiverpodのコントローラーを実装。

## Phase 6: テストの実装とCI設定

1. **Golden Tests:** `alchemist` を利用した視覚的リグレッションテスト。
2. **E2E Tests:** `patrol` を利用した通しテストの実装。
3. **Melos Scripts:** `melos run test:all` などで全テストを実行する設定。
