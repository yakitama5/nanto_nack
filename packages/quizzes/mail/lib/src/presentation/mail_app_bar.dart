import 'package:flutter/material.dart';

/// メールアプリのAppBar
///
/// 通常時は検索バー、選択時は青背景＋件数＋削除アイコンを表示する。
class MailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MailAppBar({
    super.key,
    required this.selectedCount,
    required this.searchHint,
    required this.selectedCountText,
    this.onSearchTap,
    this.onDeleteSelected,
    this.onClearSelection,
  });

  final int selectedCount;
  final String searchHint;
  final String selectedCountText;
  final VoidCallback? onSearchTap;
  final VoidCallback? onDeleteSelected;
  final VoidCallback? onClearSelection;

  bool get _isSelectionMode => selectedCount > 0;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (_isSelectionMode) {
      return AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClearSelection,
        ),
        title: Text(
          selectedCountText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            onPressed: onDeleteSelected,
            tooltip: 'Delete',
          ),
        ],
      );
    }

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.grey.withAlpha(76),
      title: GestureDetector(
        onTap: onSearchTap,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F3F4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Color(0xFF5F6368), size: 20),
              const SizedBox(width: 8),
              Text(
                searchHint,
                style: const TextStyle(
                  color: Color(0xFF5F6368),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
