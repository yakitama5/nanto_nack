import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/domain/entities/chat_message.dart';

/// チャットアプリのマスターデータカタログ
///
/// テキストはすべて英語で定義し、UI表示時に toAlienLanguage() で変換する。
class ChatCatalog {
  ChatCatalog._();

  /// Quiz1 用コンタクトリスト（Alice に unread:1）
  static List<ChatContact> quiz1Contacts(DateTime now) => [
        ChatContact(
          id: 'alice',
          name: 'Alice',
          lastMessage: 'Send me a stamp!',
          lastMessageAt: now.subtract(const Duration(minutes: 5)),
          unreadCount: 1,
          isOnline: true,
        ),
        ChatContact(
          id: 'bob',
          name: 'Bob',
          lastMessage: 'Thanks for the update.',
          lastMessageAt: now.subtract(const Duration(hours: 3)),
          isOnline: false,
        ),
        ChatContact(
          id: 'carol',
          name: 'Carol',
          lastMessage: 'Got it!',
          lastMessageAt: now.subtract(const Duration(hours: 5)),
          isOnline: false,
        ),
        ChatContact(
          id: 'team',
          name: 'Project Team',
          lastMessage: 'Meeting at 3pm.',
          lastMessageAt: now.subtract(const Duration(hours: 8)),
          isOnline: false,
        ),
        ChatContact(
          id: 'mom',
          name: 'Mom',
          lastMessage: 'Come home for dinner!',
          lastMessageAt: now.subtract(const Duration(hours: 24)),
          isOnline: false,
        ),
      ];

  /// Quiz2 用コンタクトリスト（Bob に unread:1）
  static List<ChatContact> quiz2Contacts(DateTime now) => [
        ChatContact(
          id: 'alice',
          name: 'Alice',
          lastMessage: 'See you tomorrow!',
          lastMessageAt: now.subtract(const Duration(hours: 1)),
          isOnline: true,
        ),
        ChatContact(
          id: 'bob',
          name: 'Bob',
          lastMessage: 'What do you think?',
          lastMessageAt: now.subtract(const Duration(minutes: 3)),
          unreadCount: 1,
          isOnline: false,
        ),
        ChatContact(
          id: 'carol',
          name: 'Carol',
          lastMessage: 'Got it!',
          lastMessageAt: now.subtract(const Duration(hours: 5)),
          isOnline: false,
        ),
        ChatContact(
          id: 'team',
          name: 'Project Team',
          lastMessage: 'Meeting at 3pm.',
          lastMessageAt: now.subtract(const Duration(hours: 8)),
          isOnline: false,
        ),
        ChatContact(
          id: 'mom',
          name: 'Mom',
          lastMessage: 'Come home for dinner!',
          lastMessageAt: now.subtract(const Duration(hours: 24)),
          isOnline: false,
        ),
      ];

  /// Quiz3 用コンタクトリスト（Carol に unread:1）
  static List<ChatContact> quiz3Contacts(DateTime now) => [
        ChatContact(
          id: 'alice',
          name: 'Alice',
          lastMessage: 'See you tomorrow!',
          lastMessageAt: now.subtract(const Duration(hours: 1)),
          isOnline: true,
        ),
        ChatContact(
          id: 'bob',
          name: 'Bob',
          lastMessage: 'Thanks for the update.',
          lastMessageAt: now.subtract(const Duration(hours: 3)),
          isOnline: false,
        ),
        ChatContact(
          id: 'carol',
          name: 'Carol',
          lastMessage: 'Any photos from the trip?',
          lastMessageAt: now.subtract(const Duration(minutes: 5)),
          unreadCount: 1,
          isOnline: true,
        ),
        ChatContact(
          id: 'team',
          name: 'Project Team',
          lastMessage: 'Meeting at 3pm.',
          lastMessageAt: now.subtract(const Duration(hours: 8)),
          isOnline: false,
        ),
        ChatContact(
          id: 'mom',
          name: 'Mom',
          lastMessage: 'Come home for dinner!',
          lastMessageAt: now.subtract(const Duration(hours: 24)),
          isOnline: false,
        ),
      ];

  /// Quiz4 用コンタクトリスト（Alice が最上位＝直近にやり取りあり）
  static List<ChatContact> quiz4Contacts(DateTime now) => [
        ChatContact(
          id: 'alice',
          name: 'Alice',
          lastMessage: 'Oops, wrong person!',
          lastMessageAt: now.subtract(const Duration(minutes: 2)),
          isOnline: true,
        ),
        ChatContact(
          id: 'bob',
          name: 'Bob',
          lastMessage: 'Thanks for the update.',
          lastMessageAt: now.subtract(const Duration(hours: 3)),
          isOnline: false,
        ),
        ChatContact(
          id: 'carol',
          name: 'Carol',
          lastMessage: 'Got it!',
          lastMessageAt: now.subtract(const Duration(hours: 5)),
          isOnline: false,
        ),
      ];

  /// 後方互換用コンタクトリスト（既存コードが参照している箇所向け）
  static final List<ChatContact> contacts = [
    ChatContact(
      id: 'alice',
      name: 'Alice',
      lastMessage: 'See you tomorrow!',
      lastMessageAt: DateTime(2026, 3, 31, 9, 15),
      unreadCount: 1,
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

  /// Quiz 1 (Send Stamp) の初期メッセージ
  static List<ChatMessage> quiz1InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q1_1',
          text: 'Hey! How are you?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 10)),
        ),
        ChatMessage(
          id: 'q1_2',
          text: 'Send me a stamp!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 5)),
        ),
      ];

  /// Quiz 2 (Reaction) の初期メッセージ
  static List<ChatMessage> quiz2InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q2_1',
          text: 'Good morning!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 15)),
        ),
        ChatMessage(
          id: 'q2_2',
          text: 'Check out this photo!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 8)),
        ),
        ChatMessage(
          id: 'q2_3',
          text: 'What do you think?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 3)),
        ),
      ];

  /// Quiz 3 (Send Image) の初期メッセージ
  static List<ChatMessage> quiz3InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q3_1',
          text: 'Can you send me a photo?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 10)),
        ),
        ChatMessage(
          id: 'q3_2',
          text: 'Any photos from the trip?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 5)),
        ),
      ];

  /// Quiz 4 (Cancel Message) の初期メッセージ
  static List<ChatMessage> quiz4InitialMessages(DateTime now) => [
        ChatMessage(
          id: 'q4_1',
          text: 'Hi there!',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 60)),
        ),
        ChatMessage(
          id: 'q4_2',
          text: 'How was your weekend?',
          isMine: false,
          sentAt: now.subtract(const Duration(minutes: 30)),
        ),
        ChatMessage(
          id: 'q4_3',
          text: 'Oops, wrong person!',
          isMine: true,
          sentAt: now.subtract(const Duration(minutes: 2)),
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
  static final List<ChatContact> groupCandidates =
      contacts.where((c) => c.id != 'team').toList();
}
