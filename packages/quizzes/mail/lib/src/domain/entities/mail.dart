import 'package:mail/src/domain/entities/mail_folder.dart';

/// メールエンティティ
class Mail {
  const Mail({
    required this.id,
    required this.sender,
    required this.subject,
    required this.bodyPreview,
    required this.isRead,
    required this.folder,
    required this.timeLabel,
  });

  final String id;

  /// 送信者名（英語。UIではカスタム言語に変換して表示）
  final String sender;

  /// 件名（英語。UIではカスタム言語に変換して表示）
  final String subject;

  /// 本文プレビュー（英語。UIではカスタム言語に変換して表示）
  final String bodyPreview;

  /// 既読フラグ
  final bool isRead;

  /// フォルダ
  final MailFolder folder;

  /// 受信時刻の表示ラベル（例: "15m", "1h", "2d"）
  ///
  /// MailCatalogで静的に生成し、clock.now()を使ってUI側での
  /// DateTime.now()呼び出しを不要にしている。
  final String timeLabel;

  Mail copyWith({
    String? id,
    String? sender,
    String? subject,
    String? bodyPreview,
    bool? isRead,
    MailFolder? folder,
    String? timeLabel,
  }) {
    return Mail(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      subject: subject ?? this.subject,
      bodyPreview: bodyPreview ?? this.bodyPreview,
      isRead: isRead ?? this.isRead,
      folder: folder ?? this.folder,
      timeLabel: timeLabel ?? this.timeLabel,
    );
  }
}
