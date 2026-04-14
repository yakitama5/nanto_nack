import 'package:flutter/material.dart';
import 'package:mail/src/domain/entities/mail.dart';
import 'package:quiz_core/quiz_core.dart';

/// メール1行分のUI
///
/// - [Dismissible] で右→左スワイプにアーカイブアクションを設定
/// - 長押しで選択モードへ移行
/// - 選択モード時は背景色変化＋チェックマーク表示
class MailListItem extends StatelessWidget {
  const MailListItem({
    super.key,
    required this.mail,
    required this.isSelected,
    required this.archiveLabel,
    this.onTap,
    this.onLongPress,
    this.onDismissed,
    this.isSelectionMode = false,
  });

  final Mail mail;
  final bool isSelected;
  final String archiveLabel;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final void Function(String id)? onDismissed;
  final bool isSelectionMode;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    final tile = _MailTile(
      mail: mail,
      isSelected: isSelected,
      isSelectionMode: isSelectionMode,
      onTap: onTap,
      onLongPress: onLongPress,
    );

    // 選択モード中はスワイプ無効
    if (isSelectionMode) return tile;

    return Dismissible(
      key: ValueKey(mail.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: mailTheme.archiveSwipeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.archive_outlined,
              color: mailTheme.onBrandColor,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              archiveLabel,
              style: TextStyle(color: mailTheme.onBrandColor, fontSize: 12),
            ),
          ],
        ),
      ),
      onDismissed: (_) => onDismissed?.call(mail.id),
      child: tile,
    );
  }
}

class _MailTile extends StatelessWidget {
  const _MailTile({
    required this.mail,
    required this.isSelected,
    required this.isSelectionMode,
    this.onTap,
    this.onLongPress,
  });

  final Mail mail;
  final bool isSelected;
  final bool isSelectionMode;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        color: isSelected
            ? mailTheme.selectedBackground
            : mail.isRead
                ? mailTheme.scaffoldBackground
                : mailTheme.unreadBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(
              sender: mail.sender,
              isSelected: isSelected,
              isSelectionMode: isSelectionMode,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          mail.sender,
                          style: TextStyle(
                            fontWeight: mail.isRead
                                ? FontWeight.normal
                                : FontWeight.bold,
                            fontSize: 14,
                            color: mailTheme.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        mail.timeLabel,
                        style: TextStyle(
                          fontSize: 12,
                          color: mail.isRead
                              ? mailTheme.textSecondary
                              : mailTheme.brandBlue,
                          fontWeight: mail.isRead
                              ? FontWeight.normal
                              : FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    mail.subject,
                    style: TextStyle(
                      fontWeight:
                          mail.isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 13,
                      color: mailTheme.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    mail.bodyPreview,
                    style: TextStyle(
                      fontSize: 12,
                      color: mailTheme.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.sender,
    required this.isSelected,
    required this.isSelectionMode,
  });

  final String sender;
  final bool isSelected;
  final bool isSelectionMode;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    if (isSelected) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: mailTheme.brandBlue,
        child: Icon(Icons.check, color: mailTheme.onBrandColor, size: 20),
      );
    }

    if (isSelectionMode) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: mailTheme.unselectedAvatarBackground,
        child: Icon(Icons.check, color: mailTheme.unselectedCheckColor, size: 20),
      );
    }

    final initials = sender.isNotEmpty ? sender[0].toUpperCase() : '?';
    final hue = sender.codeUnits.fold(0, (a, b) => a + b) % 360;
    final color = HSLColor.fromAHSL(1, hue.toDouble(), 0.5, 0.45).toColor();

    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
