import 'package:flutter/material.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:quiz_core/quiz_core.dart';

/// メールアプリの左ドロワー
///
/// 受信トレイ・送信済み（ダミー）・ゴミ箱を切り替えるメニュー。
class MailDrawer extends StatelessWidget {
  const MailDrawer({
    super.key,
    required this.currentFolder,
    required this.inboxLabel,
    required this.sentLabel,
    required this.trashLabel,
    required this.appTitle,
    this.onFolderChanged,
  });

  final MailFolder currentFolder;
  final String inboxLabel;
  final String sentLabel;
  final String trashLabel;
  final String appTitle;
  final void Function(MailFolder folder)? onFolderChanged;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: mailTheme.drawerHeaderBackground),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                appTitle,
                style: TextStyle(
                  color: mailTheme.onBrandColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _DrawerItem(
            icon: Icons.inbox_outlined,
            label: inboxLabel,
            isSelected: currentFolder == MailFolder.inbox,
            onTap: () {
              Navigator.of(context).pop();
              onFolderChanged?.call(MailFolder.inbox);
            },
          ),
          _DrawerItem(
            icon: Icons.send_outlined,
            label: sentLabel,
            isSelected: false,
            onTap: () {
              // ダミー: 送信済みは切り替えのみ（クイズ対象外）
              Navigator.of(context).pop();
            },
          ),
          _DrawerItem(
            icon: Icons.delete_outlined,
            label: trashLabel,
            isSelected: currentFolder == MailFolder.trash,
            onTap: () {
              Navigator.of(context).pop();
              onFolderChanged?.call(MailFolder.trash);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? mailTheme.brandBlue : mailTheme.textSecondary,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? mailTheme.brandBlue : mailTheme.textPrimary,
          fontWeight:
              isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: mailTheme.selectedBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onTap: onTap,
    );
  }
}
