# クイズ3（画像送信）の正解条件修正 修正計画

## 概要
クイズ3「画像を送る」において、特定のチャットルーム（Carol）だけでなく、どのチャットルームからでも画像を送信すれば正解となるように修正する。

## 修正内容

### 1. SendImageQuizState の修正
- `isCorrectChatRoom` フィールドを削除。
- `openedContact` フィールド（ChatContact?）を追加し、現在開いているチャットルームのコンタクトを保持する。

### 2. SendImageQuizNotifier の修正
- `openChatRoom()` と `openWrongChatRoom()` を `openChatRoom(ChatContact contact)` に統合し、引数で渡されたコンタクトを `state.openedContact` にセットする。
- `closeChatRoom()` で `openedContact` を null にする。
- `sendImage()`, `sendTextMessage()`, `sendStampAsMessage()` 内の `isCorrectChatRoom` チェックによる不正解判定を削除。

### 3. SendImageQuizScreen の修正
- `_openedContact` メンバ変数を削除。
- `onContactTap` で `carol` かどうかの条件分岐を削除し、一律 `notifier.openChatRoom(contact)` を呼ぶ。
- `ChatRoomScreen` に渡す `contact` を `state.openedContact` に変更。
- `ChatRoomScreen` に渡す `messages` を、どのルームでも `state.messages` を表示するように変更。

### 4. 静的解析
- `fvm flutter analyze` を実行し、未使用のインポートなどを解消する。
