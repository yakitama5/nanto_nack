import 'package:flutter/material.dart';
import 'package:mail/src/i18n/mail_translations_extension.dart';
import 'package:quiz_core/quiz_core.dart';

/// メールアプリのAppBar
///
/// 通常時は検索バー、選択時は青背景＋件数＋削除アイコンを表示する。
/// [emptyTrashLabel] と [onEmptyTrash] を渡すとゴミ箱フォルダ表示時に
/// 右上の overflow メニューから「空にする」操作が可能になる。
class MailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MailAppBar({
    super.key,
    required this.selectedCount,
    required this.searchHint,
    required this.selectedCountText,
    required this.deleteTooltip,
    this.onSearchTap,
    this.onDeleteSelected,
    this.onClearSelection,
    this.emptyTrashLabel,
    this.onEmptyTrash,
  });

  final int selectedCount;
  final String searchHint;
  final String selectedCountText;

  /// 削除ボタンのツールチップ文字列（カスタム言語テキストを渡す）
  final String deleteTooltip;

  final VoidCallback? onSearchTap;
  final VoidCallback? onDeleteSelected;
  final VoidCallback? onClearSelection;

  /// ゴミ箱を空にするメニューのラベル（Quiz2 のみ使用）
  final String? emptyTrashLabel;

  /// ゴミ箱を空にするコールバック（ゴミ箱フォルダ表示中かつ Quiz2 のみ渡す）
  final VoidCallback? onEmptyTrash;

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
            tooltip: deleteTooltip,
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
        child: _SearchBarContainer(searchHint: searchHint),
      ),
      actions: [
        if (onEmptyTrash != null)
          PopupMenuButton<String>(
            onSelected: (_) => onEmptyTrash?.call(),
            icon: Icon(Icons.more_vert, color: mailTheme.textSecondary),
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'empty',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_sweep_outlined,
                      color: mailTheme.destructive,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      emptyTrashLabel ?? '',
                      style: TextStyle(color: mailTheme.destructive),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

/// Quiz4 専用 SearchAppBar
///
/// 検索前は検索バー風コンテナ、検索中はテキストフィールドを表示する。
/// [onShowHint] が非 null のときのみヒントアイコンボタンを表示する。
class MailSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MailSearchAppBar({
    super.key,
    required this.isSearching,
    required this.searchController,
    required this.searchHint,
    required this.hint,
    required this.onOpenSearch,
    required this.onCancelSearch,
    required this.onQueryChanged,
    required this.onSubmitSearch,
    this.onShowHint,
  });

  final bool isSearching;
  final TextEditingController searchController;
  final String searchHint;
  final String hint;
  final VoidCallback onOpenSearch;
  final VoidCallback onCancelSearch;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onSubmitSearch;

  /// ヒントボタンのコールバック（null のときはボタンを非表示）
  final VoidCallback? onShowHint;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    final hintTooltip = context.sq.common.hintTooltip;

    if (isSearching) {
      return AppBar(
        backgroundColor: mailTheme.scaffoldBackground,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: mailTheme.textSecondary),
          onPressed: onCancelSearch,
        ),
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: searchHint,
            border: InputBorder.none,
            hintStyle: TextStyle(color: mailTheme.textSecondary),
          ),
          onChanged: onQueryChanged,
          onSubmitted: (_) => onSubmitSearch(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: mailTheme.textSecondary),
            onPressed: onSubmitSearch,
          ),
        ],
      );
    }

    return AppBar(
      backgroundColor: mailTheme.scaffoldBackground,
      elevation: 1,
      shadowColor: Theme.of(context).shadowColor.withAlpha(76),
      title: GestureDetector(
        onTap: onOpenSearch,
        child: _SearchBarContainer(searchHint: searchHint),
      ),
      actions: [
        if (onShowHint != null)
          IconButton(
            icon: Icon(Icons.help_outline, color: mailTheme.textSecondary),
            onPressed: onShowHint,
            tooltip: hintTooltip,
          ),
      ],
    );
  }
}

/// 検索バー風の丸みを帯びたコンテナ。
///
/// [MailAppBar] と [MailSearchAppBar] で共通利用する。
class _SearchBarContainer extends StatelessWidget {
  const _SearchBarContainer({required this.searchHint});

  final String searchHint;

  @override
  Widget build(BuildContext context) {
    final mailTheme = Theme.of(context).extension<MailAppTheme>()!;
    return Container(
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
            style: TextStyle(color: mailTheme.textSecondary, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
