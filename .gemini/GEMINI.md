# 🤖 NantoNack (Gemini CLI) Flutter 開発ガイドライン

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

* **Monorepo構成:** `melos` を使用したモノレポ構成を採用し、クイズごとの独立性とテスト容易性を確保します。
  * **`apps/app_main/`**: メインアプリケーションのエントリーポイント。全体の状態管理、ルーティング（ホーム画面、ステージ選択など）を担います。
  * **`packages/core/`**: 全クイズで使い回す共通パッケージ（あるあるUIコンポーネント、解読不能フォント設定、共通のドメインロジックなど）。
  * **`packages/quizzes/quiz_*/`**: 各クイズ問題ごとの独立したワークスペース（例：`quiz_001_water`）。

## 🏛️ Application Architecture (アプリケーションアーキテクチャ)

* **4層レイヤードアーキテクチャ:** プロジェクト（各パッケージ）は以下の4つの論理レイヤーに整理し、関心の分離を徹底してください。
  * **Presentation (プレゼンテーション層):** クイズの画面UI（解読不能な文字やUIの描画）、ユーザーのタップ操作の受け取り、状態の監視を行います（UIコンポーネント、コントローラー）。
  * **Application (アプリケーション層):** ユースケースを定義します。Presentation層からの入力を受け取り、Domain層やInfrastructure層の処理を調整してアプリの機能を実行します。
  * **Domain (ドメイン層):** 「この操作順序で正解とするか」などのビジネスルール、エンティティを定義します。Flutter UIや外部パッケージに依存しない純粋なDartコードで記述します。
  * **Infrastructure (インフラストラクチャ層):** データソースへのアクセスを担います。クイズの解説文データの取得や、ローカルDBへの進行度保存といった Repository の実装を行います。

## 🎨 Flutter Style Guide & Best Practices

* **原則:** SOLID原則の適用、継承よりコンポジションの優先、イミュータビリティ（不変性）の確保。
* **命名規則:** クラスには `PascalCase`、メンバー/変数には `camelCase`、ファイルには `snake_case`。
* **ウィジェット:** 可能な限り `const` コンストラクタを使用し、大きな `build()` メソッドは小さなプライベート `Widget` クラスに分割してください。

## ⚙️ State Management (状態管理)

* **Riverpod:** 状態管理には `flutter_riverpod` を使用します。
* **標準Providerの利用:** コード生成（`riverpod_generator`）は使用せず、標準の `Provider`、`NotifierProvider` などを直接定義して使用してください。
* **Hooks不使用:** `flutter_hooks` および `HookConsumerWidget` は使用しません。標準の `ConsumerWidget` または `ConsumerStatefulWidget` を使用してください。

## 🔗 Routing (ルーティング)

* **GoRouter:** 宣言的なナビゲーションのために `go_router` を使用してください。
* **標準ルーティング定義:** コード生成（`go_router_builder`）は使用せず、標準の `GoRoute` 定義を用いてパスベースでルーティングを構築してください。

## 🔒 Data Handling & Code Generation (データ処理とコード生成)

* **コード生成の制限:** 本プロジェクトで許可されているコード生成ツールは、アセットの自動生成を行う **`flutter_gen` のみ** です。`json_serializable` や `build_runner` に依存するその他の自動生成は一切行いません。
* APIレスポンスやローカル保存データの変換（`fromJson` / `toJson`）は手動で実装してください。

## 🌍 Internationalization (国際化)

* コード生成ツールを使用せず、Flutter標準の `flutter_localizations` と `.arb` ファイルによる多言語化アプローチを採用してください。

## 💅 Visual Design & Theming

* **解読不能テキスト:** クイズ画面のダミーテキストには、既存のアプリと区別するため、特定のダミーフォントを適用するカスタム `TextStyle` を `core` パッケージで定義して使用してください。
* **あるあるUI:** わざと分かりにくいボタンやナビゲーションは `core` でコンポーネント化し、意図的な「悪さ」を表現しつつも、Flutterの基本レイアウト原則を意図的に崩す場合はドキュメントを残してください。
