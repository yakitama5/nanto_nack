import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/domain/entities/chat_message.dart';

/// チャットアプリのマスターデータカタログ
///
/// テキストはすべて英語で定義し、UI表示時に toAlienLanguage() で変換する。
class ChatCatalog {
  ChatCatalog._();

  /// 固定の連絡先リスト
  static final List<ChatContact> contacts = [
    ChatContact(
      id: 'alice',
      name: 'Alice',
      lastMessage: 'See you tomorrow!',
      lastMessageAt: DateTime(2026, 3, 31, 9, 15),
      unreadCount: 2,
      isOnline: true,
    ),
    ChatContact(
      id: 'bob',
      name: 'Bob',
      lastMessage: 'Thanks for the update.',
      lastMessageAt: DateTime(2026, 3, 31, 8, 42),
      isOnline: false,
    ),
    ChatContact(
      id: 'carol',
      name: 'Carol',
      lastMessage: 'Got it!',
      lastMessageAt: DateTime(2026, 3, 30, 22, 10),
      unreadCount: 1,
      isOnline: true,
    ),
    ChatContact(
      id: 'team',
      name: 'Project Team',
      lastMessage: 'Meeting at 3pm.',
      lastMessageAt: DateTime(2026, 3, 30, 18, 0),
      isOnline: false,
    ),
    ChatContact(
      id: 'mom',
      name: 'Mom',
      lastMessage: 'Come home for dinner!',
      lastMessageAt: DateTime(2026, 3, 29, 17, 30),
      isOnline: false,
    ),
  ];

  /// Quiz 1 (Send Message) の初期メッセージ
  static List<ChatMessage> quiz1InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q1_1',
          text: 'Hey! How are you?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 10)),
        ),
        ChatMessage(
          id: 'q1_2',
          text: "What's up today?",
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 5)),
        ),
      ];

  /// Quiz 2 (Send Stamp) の初期メッセージ
  static List<ChatMessage> quiz2InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q2_1',
          text: 'Good morning!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 8)),
        ),
        ChatMessage(
          id: 'q2_2',
          text: 'Have a nice day!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 3)),
        ),
      ];

  /// Quiz 3 (Delete Message) の初期メッセージ
  static List<ChatMessage> quiz3InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q3_1',
          text: 'Hi there!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 15)),
        ),
        ChatMessage(
          id: 'q3_2',
          text: 'Oops, wrong message.',
          isMine: true,
          sentAt: now.subtract(const Duration(minutes: 10)),
        ),
        ChatMessage(
          id: 'q3_3',
          text: 'No worries!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 5)),
        ),
      ];

  /// スタンプ一覧（絵文字ベース）
  static const List<String> stamps = [
    '😊',
    '😂',
    '👍',
    '❤️',
    '🙏',
    '😭',
    '🎉',
    '🔥',
    '😎',
    '🥰',
    '😅',
    '👋',
  ];

  /// グループ作成時の選択可能メンバー
  static final List<ChatContact> groupCandidates = contacts
      .where((c) => c.id != 'team')
      .toList();
}
