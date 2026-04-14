# 📧 メールアプリ謎解き（全4ステージ）実装計画書

## 1. 概要と要件
スマホの直感操作をテーマにした謎解きゲームの「メールアプリ編」を実装する。
全4問（Quiz1〜4）は独立したクイズだが、ベースとなる「モックのメールアプリUIと状態管理」は全クイズで共通の基盤を使用する。
本物のような操作感（ガワ）を作り込み、特定の操作が行われた際にクリア判定を行う。

## 2. データモデル (Mail)
以下のプロパティを持つ `Mail` クラスを定義する。
- `id`: String (一意のID)
- `sender`: String (送信者名)
- `subject`: String (件名)
- `bodyPreview`: String (本文プレビュー)
- `isRead`: bool (既読フラグ)
- `folder`: enum MailFolder (inbox, sent, trash, archive)
  - `sent` はドロワーに表示されるが、クイズ対象外のダミーフォルダ

## 3. 状態管理 (Riverpod)
メールアプリの共通状態を管理する `MailAppNotifier` を実装する。クイズごとに初期化されるよう `autoDispose` を使用すること。

### 保持する状態 (State)
- `mails`: List<Mail> (全メールのリスト。Quiz開始時にモックデータを注入)
- `currentFolder`: MailFolder (現在表示しているフォルダ。初期値は inbox)
- `selectedMailIds`: Set<String> (長押しで選択されたメールID。空なら通常モード)
- `searchQuery`: String (検索ボックスの入力値)

### 状態更新メソッド (Actions)
- `toggleSelection(String id)`: 長押し・タップでの選択/選択解除
- `clearSelection()`: 選択モードの解除
- `archiveMail(String id)`: 指定IDのフォルダを archive に変更
- `moveToTrash()`: `selectedMailIds` に含まれるメールを trash へ移動し、選択解除
- `emptyTrash()`: trash フォルダのメールを完全に削除
- `changeFolder(MailFolder folder)`: フォルダの切り替え
- `submitSearch(String query)`: 検索の実行

## 4. 共通UIコンポーネント構成
本物のメールアプリを模倣したマテリアルデザインで構築する。

- **MailAppScaffold**: 全体のベース。
- **MailAppBar**: 
  - 通常時: 検索モックバーを表示。
  - 選択時: `selectedMailIds` が1件以上の場合は青色に変化し、「X件選択中」のテキストと「ゴミ箱アイコン（タップで `moveToTrash`）」を表示。
- **MailDrawer**: 画面左端からのスワイプ、またはハンバーガーメニューで開く。受信トレイ・送信済み（ダミー）・ゴミ箱の切り替えメニュー。
- **MailListItem**: メール1行分のUI。
  - `Dismissible` でラップし、右から左へのスワイプで背景を緑＋アーカイブアイコンにし、`archiveMail` を発火させる。
  - 長押し（`onLongPress`）で `toggleSelection` を発火させ、選択モードへ移行（背景色変化＋チェックマーク表示）。

## 5. クイズごとのクリア判定条件
各クイズの要件と、ゲームクリアを発火させるトリガー条件。

### Quiz1: 特定のメールをアーカイブする
- **お題**: 「上から3番目のメールをアーカイブしよう」
- **クリア条件**: `archiveMail(String id)` が呼ばれた際、対象のIDが「特定のメール（例: 上から3番目に配置した特定のID）」であった瞬間にクリア。

### Quiz2: ゴミ箱を空にする
- **お題**: 「ゴミ箱を空にしよう」
- **想定操作**: 左端スワイプでDrawerを開く -> ゴミ箱を選択 -> 「ゴミ箱を空にする」ボタンをタップ。
- **クリア条件**: `emptyTrash()` が実行され、ゴミ箱内のメールが0件になった瞬間にクリア。

### Quiz3: 3件選択して削除する
- **お題**: 「3件のメールを選択して削除しよう」
- **想定操作**: メール長押しで選択モードへ -> 合計3件タップして選択 -> ヘッダーのゴミ箱アイコンをタップ。
- **クリア条件**: `moveToTrash()` が呼ばれた際、`selectedMailIds.length == 3` であった瞬間にクリア。

### Quiz4: 特定のコマンドで検索する
- **お題**: 「5Mバイト以上のメールを検索しよう」
- **想定操作**: 検索ボックスをタップ -> `larger:5M` と入力して検索実行。
- **ヒント機能**: お題画面のヒントボタン押下で「Tips: サイズ指定検索は larger:5M のように入力！」と表示する。
- **クリア条件**: `submitSearch()` が呼ばれた際、`state.mailApp.searchQuery.trim().toLowerCase() == "larger:5m"` に一致した瞬間にクリア。大文字小文字を区別しない（`LARGER:5M` や `Larger:5M` も正解）。コロンを含む完全一致のみクリアとし、スペース区切り（`larger 5M`）は不正解。
