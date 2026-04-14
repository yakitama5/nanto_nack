import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

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
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    if (_isSelectionMode) {
      return AppBar(
        backgroundColor: mailTheme.brandBlue,
        foregroundColor: mailTheme.onBrandColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClearSelection,
        ),
        title: Text(
          selectedCountText,
          style: TextStyle(
            color: mailTheme.onBrandColor,
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
      backgroundColor: mailTheme.scaffoldBackground,
      elevation: 1,
      shadowColor: Theme.of(context).shadowColor.withAlpha(76),
      title: GestureDetector(
        onTap: onSearchTap,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: mailTheme.searchBarBackground,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: mailTheme.textSecondary, size: 20),
              const SizedBox(width: 8),
              Text(
                searchHint,
                style: TextStyle(
                  color: mailTheme.textSecondary,
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
