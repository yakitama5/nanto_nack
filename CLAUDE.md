# 🤖 NantoNack Flutter 開発ガイドライン

あなたは Flutter と Dart 開発の専門家です。このガイドラインは、UI/UX直感クイズアプリ「NantoNack」を、**美しく、高性能で、保守性の高い** アプリケーションとして構築することを目的としています。

## 🤝 Interaction Guidelines (対話ガイドライン)

* **ユーザーペルソナ:** ユーザーはプログラミングの概念には慣れていますが、Dartは初めてかもしれないと想定してください。
* **説明:** コードを生成する際は、Dart固有の機能について説明を提供してください。
* **やり取りする言語:** ユーザーは日本人です。やりとりは基本的に日本語でお願いします。
* 以下のドキュメントも**日本語で作成する**
  * 実装計画 (Implementation Plan)
  * 修正内容の確認 (Walkthrough)
  * タスクリスト (Task List)
  * リリースノート (Release Notes)
* 思考過程も原則日本語とする。

## 🏗️ Project Structure (プロジェクト構造)

* **Monorepo構成:** Dartネイティブの **Pub Workspace** と **Melos** を組み合わせたモノレポ構成を採用します。ルートの `pubspec.yaml` で `workspace` を宣言し、各パッケージで `resolution: workspace` を指定します。
  * **`apps/app_main/`**: メインアプリケーションのエントリーポイント。全体の状態管理、ルーティング、UIの枠組みを担います。
  * **`packages/system/`**: アプリケーションの基盤パッケージ。メンテナンス制御、Firebase、ローカルDB（Drift）、およびアプリ内課金（IAP）の基盤設定を管理します。
  * **`packages/quiz_core/`**: 全カテゴリで共通利用するパッケージ。あるあるUIコンポーネント、解読不能フォント設定、クイズの共通エンティティを管理します。
  * **`packages/quizzes/<category_name>/`**: クイズの**カテゴリごと**の独立したワークスペース（例：`shopping`, `sns`）。1つのカテゴリパッケージ内に、関連する複数のクイズ（例：ショッピングカテゴリ内の「水を買う」「カートを見る」等）を内包し、ドメイン知識（カートモデル等）を共有します。

## 🏛️ Application Architecture (アプリケーションアーキテクチャ)

* **4層レイヤードアーキテクチャ:** 各パッケージは以下の4つの論理レイヤーに整理し、関心の分離を徹底してください。カテゴリパッケージ内で複数のクイズを扱う場合も、この層の中で機能（クイズ）ごとにディレクトリを切って整理します。
  * **Presentation:** UI描画、ユーザー操作の受け取り、状態の監視。
  * **Application:** ユースケースの定義。Presentationからの入力を受け取り、DomainやInfrastructureの処理を調整します。
  * **Domain:** ビジネスルール、エンティティの定義。Flutter UIや外部パッケージに依存しない純粋なDartコード。
  * **Infrastructure:** データソースへのアクセス（Firebase, Drift, IAP等）を担う Repository の実装。

## 🎨 Flutter Style Guide & Best Practices

* **原則:** SOLID原則の適用、継承よりコンポジションの優先。
* **イミュータビリティ:** 変更不可能なデータ構造を優先し、状態やモデルの定義・更新には必ず **`copyWith` メソッド** を実装して利用してください。
* **静的解析:** **`altive_lints`** を利用して厳格なコード規約を適用し、高品質なコードベースを保ちます。

## ⚙️ State Management (状態管理)

* **Riverpod:** 状態管理には `flutter_riverpod` を使用します。
* **標準Providerの利用:** `riverpod_generator` は使用せず、標準の `Provider`, `NotifierProvider` などを直接定義してください。
* **Hooks不使用:** `flutter_hooks` は使用せず、標準の `ConsumerWidget` または `ConsumerStatefulWidget` を使用してください。

## 🔗 Routing & Layout (ルーティングとレイアウト)

* **GoRouter:** 宣言的なナビゲーションのために `go_router` を使用します（`go_router_builder` は不使用）。
* **レスポンシブデザイン:** **`responsive_framework`** を利用してマルチデバイスに対応します。
  * **Mobile / Tablet:** 画面サイズに合わせて最適化。
  * **Desktop (Web/Mac/Windows等):** タブレットの横幅（例: 最大800px等）で固定し、左右に余白（マージン）を表示するレイアウトとします。

## 🔒 Data Handling, Backend & Code Generation

* **ローカルデータ (Drift):** ローカルデータベースには **`drift`** を利用し、プレイデータ（`isCleared`, `clearTimeMs`, `score`, `failureCount`）を保存します。
* **Firebase連携:** `packages/system` 内で RemoteConfig, Crashlytics, Analytics を初期化・利用します。
* **コード生成の制限:** 許可されているツールは以下の3つのみです。
  1. `flutter_gen` (アセット自動生成)
  2. `drift_dev`, `build_runner` (ローカルDB)
  3. `slang`, `build_runner` (多言語化)
  ※ `json_serializable`、`riverpod_generator`、`go_router_builder` などは引き続き禁止とし、手動で実装してください。

## 🌍 Internationalization (国際化)

* **Slang:** 国際化（i18n）には型安全な `slang` と `slang_flutter` を使用します（JSON/YAMLベースでコード生成）。

## 🎮 Game Logic & Monetization (ゲーム進行と課金)

* **ステージ解放 (アンロック):** 前のステージをクリア（`isCleared == true`）することで次の問題が解放される「順次解放方式」を採用します。
* **マネタイズ (アプリ内課金):** 広告は極力排除し、アプリ内課金（`in_app_purchase`）を想定します。1日のプレイ回数制限とその解除フラグなどは `system` パッケージで管理します。

## 🧪 Testing (テスティング)

* **ユニット (`test`) / ウィジェット (`flutter_test`) / ゴールデン (`alchemist`) / E2E (`patrol`)** を利用し、`melos` スクリプトで一括実行します。
