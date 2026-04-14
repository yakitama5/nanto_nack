import 'package:flutter/material.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';

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
    required this.emptyTrashLabel,
    required this.appTitle,
    this.onFolderChanged,
    this.onEmptyTrash,
  });

  final MailFolder currentFolder;
  final String inboxLabel;
  final String sentLabel;
  final String trashLabel;
  final String emptyTrashLabel;
  final String appTitle;
  final void Function(MailFolder folder)? onFolderChanged;
  final VoidCallback? onEmptyTrash;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF1A73E8)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                appTitle,
                style: const TextStyle(
                  color: Colors.white,
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
          if (currentFolder == MailFolder.trash && onEmptyTrash != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  onEmptyTrash?.call();
                },
                icon: const Icon(Icons.delete_sweep_outlined),
                label: Text(emptyTrashLabel),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
              ),
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
    return ListTile(
      leading: Icon(
        icon,
        color:
            isSelected ? const Color(0xFF1A73E8) : const Color(0xFF5F6368),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? const Color(0xFF1A73E8)
              : const Color(0xFF202124),
          fontWeight:
              isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: const Color(0xFFE8F0FE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      onTap: onTap,
    );
  }
}
