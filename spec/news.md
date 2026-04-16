# 📰 ニュースアプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件（※厳守事項）
スマホの直感操作をテーマにした謎解きゲームの「ニュースアプリ編」を実装する。

**【Presentation層の共通化に関する厳守事項】**
全4問（Quiz1〜4）は独立したクイズとして出題されるが、Presentation層（モックのニュースアプリUIと状態管理）は**全クイズで完全に共通の基盤（1つの大きなアプリ）**を使用することを厳守する。
クイズごとに「この機能はまだ使えない」といった制限をかけたり、UIを出し分けたりしてはならない。常にすべての機能（引っ張って更新、横スワイプでのタブ移動、文字サイズの変更、隠しメニューによる非表示など）が自由に操作できる状態を維持すること。
クイズによって変化するのは、**「ユーザーのどの操作・状態変化を監視してクリア判定（正解）とするか」という条件のみ**である。

## 2. データモデル (NewsArticle)
以下のプロパティを持つ `NewsArticle` クラスを定義する。
- `id`: String (一意のID)
- `title`: String (見出し)
- `contentPreview`: String (記事のプレビュー本文)
- `category`: enum NewsCategory (top, entertainment, sports 等)
- `imageUrl`: String (ダミーのサムネイル画像URLまたはパス)
- `isHidden`: bool (非表示フラグ。初期値はfalse)

## 3. 状態管理 (Riverpod)
ニュースアプリの共通状態を管理する `NewsAppNotifier` を実装する。クイズごとに初期化されるよう `autoDispose` を使用すること。

### 保持する状態 (State)
- `articles`: List<NewsArticle> (全記事のリスト。Quiz開始時にモックデータを注入)
- `currentCategory`: NewsCategory (現在表示しているタブ/カテゴリ。初期値は top)
- `fontSize`: enum ArticleFontSize (small, medium, large。初期値は medium)

### 状態更新メソッド (Actions)
- `refreshNews()`: ニュースを更新する（ダミーのローディング待機処理を入れる）。
- `changeCategory(NewsCategory category)`: 表示するカテゴリタブを切り替える。
- `changeFontSize(ArticleFontSize newSize)`: 記事詳細画面での文字サイズを変更する。
- `hideArticle(String id)`: 指定したIDの記事の `isHidden` を true にし、リストから除外する。

## 4. 共通UIコンポーネント構成
本物のニュースアプリ（Yahoo!ニュース等）を模倣したUIで構築する。
※前述の通り、これらは全クイズで共通して利用可能（フル機能が動作する状態）にしておくこと。

- **NewsAppScaffold**: 全体のベース。
  - 上部に `TabBar` を配置し、「主要」「エンタメ」「スポーツ」などのカテゴリを並べる。
- **NewsListArea**: 記事の一覧を表示するメイン領域。
  - `DefaultTabController` や `PageView` を組み合わせ、**画面の横スワイプ**で隣のカテゴリ（タブ）へ切り替わるようにする（`changeCategory` が連動）。
  - 全体を `RefreshIndicator` でラップし、**下への引っ張り（Pull to Refresh）**で `refreshNews` を発動させる。
- **NewsListItem**: 記事1件分のUI。
  - タップで `ArticleDetailScreen` へ画面遷移する。
  - 長押し（`onLongPress`）、または右下の「…」アイコンタップで `showModalBottomSheet` を展開。「この記事を非表示にする」ボタンを配置し、タップで `hideArticle` を発火させる。
- **ArticleDetailScreen**: 記事の詳細画面（モック）。
  - AppBarの右上に「Aa」アイコンを配置。タップで文字サイズ変更のボトムシートまたはポップアップメニューを開き、`changeFontSize` を発火させる。
  - 本文テキストは `fontSize` の状態に応じて実際の見た目（TextStyleのfontSize）を変化させる。

## 5. クイズごとのクリア判定条件
ベースとなるアプリは常にフル機能で動作するが、以下の条件が満たされた瞬間を監視してゲームクリアを発火させる。

### Quiz1: ニュースを更新する
- **お題**: 「ニュースを最新の状態に更新しよう」
- **想定操作**: 記事一覧画面をさらに下へ引っ張り、指を離す（Pull to Refresh）。
- **クリア条件**: `refreshNews()` が呼び出され、ローディング（Future処理など）が開始または完了した瞬間にクリア。

### Quiz2: カテゴリを切り替える
- **お題**: 「『スポーツ』カテゴリのトップニュースを確認しよう」
- **想定操作**: 画面を右から左へ大きくスワイプする、または上部の「スポーツ」タブを直接タップする。
- **クリア条件**: `changeCategory()` が呼ばれ、`currentCategory` が `NewsCategory.sports` に切り替わった瞬間にクリア。

### Quiz3: 記事の文字サイズを変える
- **お題**: 「この記事の文字が小さくて読みづらい……文字サイズを『大』に変更しよう」
- **想定操作**: 任意の記事（または指定された特定の記事）をタップして詳細画面を開き、右上の「Aa」アイコンから文字サイズ「大」を選択する。
- **クリア条件**: `changeFontSize()` が呼ばれ、`fontSize` が `ArticleFontSize.large` になった瞬間にクリア。

### Quiz4: 興味のない記事を非表示にする
- **お題**: 「ネタバレを含んでいる『映画のレビュー』記事を一覧から非表示にしよう」
- **想定操作**: 対象の記事（『映画のレビュー』）を長押し（または「…」をタップ）してメニューを開き、「この記事を非表示」を選択する。
- **クリア条件**: `hideArticle(String id)` が呼ばれ、対象ID（『映画のレビュー』記事）の `isHidden` が `true` になった瞬間にクリア。
