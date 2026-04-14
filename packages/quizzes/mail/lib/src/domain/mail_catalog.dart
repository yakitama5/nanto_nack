import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

/// メールアプリのマスターデータカタログ
///
/// テキストはすべて英語で定義し、UI表示時にカスタム言語に変換する。
/// [timeLabel] は相対表記（例: "15m", "1h"）を静的に定義しているため、
/// 現在時刻のパラメータは不要。
class MailCatalog {
  MailCatalog._();

  /// Quiz1用: 受信トレイのメール（上から3番目がアーカイブ対象）
  ///
  /// `mail_quiz1_target` が3番目に配置されている。
  static List<Mail> quiz1Mails() => [
        Mail(
          id: 'mail_q1_1',
          sender: 'Alice Johnson',
          subject: 'Team meeting tomorrow',
          bodyPreview: 'Hi, just a reminder about our team meeting at 10am.',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '15m',
        ),
        Mail(
          id: 'mail_q1_2',
          sender: 'Bob Smith',
          subject: 'Project update',
          bodyPreview: 'The latest report is attached. Please review by Friday.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '1h',
        ),
        // 上から3番目: アーカイブ対象
        Mail(
          id: 'mail_quiz1_target',
          sender: 'Newsletter',
          subject: 'Weekly digest - Top stories',
          bodyPreview: 'Check out this week\'s top stories and updates.',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '3h',
        ),
        Mail(
          id: 'mail_q1_4',
          sender: 'Carol White',
          subject: 'Lunch plans?',
          bodyPreview: 'Are you free for lunch this week? Let me know!',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '5h',
        ),
        Mail(
          id: 'mail_q1_5',
          sender: 'Support Team',
          subject: 'Your ticket has been resolved',
          bodyPreview: 'We have resolved your support request. Thank you.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '8h',
        ),
      ];

  /// Quiz2用: ゴミ箱にメールあり
  static List<Mail> quiz2Mails() => [
        // 受信トレイ
        Mail(
          id: 'mail_q2_1',
          sender: 'Alice Johnson',
          subject: 'Hello there',
          bodyPreview: 'Just checking in. Hope you are doing well!',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '2h',
        ),
        Mail(
          id: 'mail_q2_2',
          sender: 'Bob Smith',
          subject: 'Quick question',
          bodyPreview: 'Do you have time for a quick call today?',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '4h',
        ),
        // ゴミ箱
        Mail(
          id: 'mail_q2_trash_1',
          sender: 'Spam Bot',
          subject: 'You have won a prize!',
          bodyPreview: 'Click here to claim your reward immediately.',
          isRead: false,
          folder: MailFolder.trash,
          timeLabel: '1d',
        ),
        Mail(
          id: 'mail_q2_trash_2',
          sender: 'Old Newsletter',
          subject: 'Unsubscribe confirmation',
          bodyPreview: 'You have been unsubscribed from our mailing list.',
          isRead: true,
          folder: MailFolder.trash,
          timeLabel: '2d',
        ),
        Mail(
          id: 'mail_q2_trash_3',
          sender: 'Promotions',
          subject: 'Limited time offer!',
          bodyPreview: 'Save 50% on all items this weekend only.',
          isRead: false,
          folder: MailFolder.trash,
          timeLabel: '3d',
        ),
      ];

  /// Quiz3用: 受信トレイに5件（3件選択して削除）
  static List<Mail> quiz3Mails() => [
        Mail(
          id: 'mail_q3_1',
          sender: 'Alice Johnson',
          subject: 'Weekend plans',
          bodyPreview: 'Are you free this Saturday for the barbecue?',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '30m',
        ),
        Mail(
          id: 'mail_q3_2',
          sender: 'Bob Smith',
          subject: 'Invoice #1042',
          bodyPreview: 'Please find the invoice attached for your records.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '2h',
        ),
        Mail(
          id: 'mail_q3_3',
          sender: 'Carol White',
          subject: 'Photo album shared',
          bodyPreview: 'I shared our trip photos with you. Take a look!',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '4h',
        ),
        Mail(
          id: 'mail_q3_4',
          sender: 'David Lee',
          subject: 'Conference registration',
          bodyPreview:
              'Your registration for the annual conference is confirmed.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '6h',
        ),
        Mail(
          id: 'mail_q3_5',
          sender: 'Emma Brown',
          subject: 'Happy Birthday!',
          bodyPreview:
              'Wishing you a wonderful birthday! Hope you have a great day.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '8h',
        ),
      ];

  /// Quiz4用: 通常受信トレイ（検索クイズ用）
  static List<Mail> quiz4Mails() => [
        Mail(
          id: 'mail_q4_1',
          sender: 'Alice Johnson',
          subject: 'Project files',
          bodyPreview: 'Sending over the project files for your review.',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '1h',
        ),
        Mail(
          id: 'mail_q4_2',
          sender: 'Bob Smith',
          subject: 'Meeting notes',
          bodyPreview: 'Here are the notes from our meeting yesterday.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '3h',
        ),
        Mail(
          id: 'mail_q4_3',
          sender: 'Carol White',
          subject: 'Video presentation',
          bodyPreview: 'Attached is the full video presentation for the client.',
          isRead: true,
          folder: MailFolder.inbox,
          timeLabel: '5h',
        ),
        Mail(
          id: 'mail_q4_4',
          sender: 'David Lee',
          subject: 'Design assets',
          bodyPreview: 'All design assets are ready. Files are attached.',
          isRead: false,
          folder: MailFolder.inbox,
          timeLabel: '7h',
        ),
      ];
}
