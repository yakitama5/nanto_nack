import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import '../../i18n/strings.g.dart' as $chat;

/// LINE 風のアプリシェル（ボトムナビ付き）
///
/// ホーム・トーク・ニュースの3タブを持つ。
/// 各クイズのコンタクトリストを受け取り、タブ間のナビゲーションを担う。
class ChatAppShell extends StatelessWidget {
  const ChatAppShell({
    super.key,
    required this.currentTab,
    required this.onTabChanged,
    required this.contacts,
    required this.onContactTap,
    required this.quizStatus,
    required this.overlays,
    this.talkTabBadgeCount = 0,
  });

  final ChatTab currentTab;
  final void Function(ChatTab tab) onTabChanged;
  final List<ChatContact> contacts;
  final void Function(ChatContact contact) onContactTap;
  final List<Widget> overlays;
  final QuizStatus quizStatus;

  /// トークタブに表示する未読バッジ数
  final int talkTabBadgeCount;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<ChatAppTheme>()!;

    final scaffold = Scaffold(
      backgroundColor: ext.scaffoldBackground,
      body: Column(
        children: [
          // ヘッダー
          Container(
            color: ext.brandColor,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: UnreadableText(
                        sq.common.appTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ),
          // タブコンテンツ
          Expanded(
            child: switch (currentTab) {
              ChatTab.home => _HomeTabContent(sq: sq),
              ChatTab.talk => _TalkTabContent(
                  contacts: contacts,
                  onContactTap: onContactTap,
                ),
              ChatTab.news => _NewsTabContent(sq: sq),
            },
          ),
        ],
      ),
      // LINE 風カスタムボトムナビゲーションバー
      bottomNavigationBar: _ChatNavBar(
        currentTab: currentTab,
        onTabChanged: onTabChanged,
        talkTabBadgeCount: talkTabBadgeCount,
        sq: sq,
      ),
    );

    final body = overlays.isEmpty
        ? scaffold
        : Stack(
            children: [
              scaffold,
              ...overlays,
            ],
          );

    return QuizExitScope(
      quizStatus: quizStatus,
      child: body,
    );
  }
}

// ─── カスタムナビゲーションバー ────────────────────────────────────────────

/// カスタム LINE 風ボトムナビゲーションバー
///
/// Material の NavigationBar ではなく独自実装を使うことで、
/// LINE らしいグリーンアクセントのカスタムデザインを実現する。
class _ChatNavBar extends StatelessWidget {
  const _ChatNavBar({
    required this.currentTab,
    required this.onTabChanged,
    required this.talkTabBadgeCount,
    required this.sq,
  });

  final ChatTab currentTab;
  final void Function(ChatTab) onTabChanged;
  final int talkTabBadgeCount;
  final $chat.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;

    return Container(
      decoration: BoxDecoration(
        color: ext.navBarBackground,
        boxShadow: [
          BoxShadow(
            color: ext.borderColor.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ChatNavItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: sq.common.homeTab,
                selected: currentTab == ChatTab.home,
                color: ext.brandColor,
                onTap: () => onTabChanged(ChatTab.home),
              ),
              _ChatNavItemWithBadge(
                icon: Icons.chat_bubble_outline,
                selectedIcon: Icons.chat_bubble,
                label: sq.common.talkTab,
                selected: currentTab == ChatTab.talk,
                badgeCount: talkTabBadgeCount,
                color: ext.brandColor,
                onTap: () => onTabChanged(ChatTab.talk),
              ),
              _ChatNavItem(
                icon: Icons.newspaper_outlined,
                selectedIcon: Icons.newspaper,
                label: sq.common.newsTab,
                selected: currentTab == ChatTab.news,
                color: ext.brandColor,
                onTap: () => onTabChanged(ChatTab.news),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatNavItem extends StatelessWidget {
  const _ChatNavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? selectedIcon : icon,
              size: 24,
              color: selected ? color : ext.navInactiveColor,
            ),
            const SizedBox(height: 2),
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 10,
                color: selected ? color : ext.navInactiveColor,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatNavItemWithBadge extends StatelessWidget {
  const _ChatNavItemWithBadge({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.badgeCount,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final int badgeCount;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  selected ? selectedIcon : icon,
                  size: 24,
                  color: selected ? color : ext.navInactiveColor,
                ),
                if (badgeCount > 0)
                  Positioned(
                    top: -6,
                    right: -8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 1,
                      ),
                      decoration: BoxDecoration(
                        color: ext.badgeColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 10,
                color: selected ? color : ext.navInactiveColor,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── ホームタブ ────────────────────────────────────────────────────────────

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent({required this.sq});

  final $chat.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return SingleChildScrollView(
      child: Column(
        children: [
          // プロフィールバナー
          Container(
            color: ext.surfaceColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: ext.brandColor,
                  child: const Icon(Icons.person, size: 36, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnreadableText(
                        sq.common.myProfile,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      UnreadableText(
                        sq.common.statusMessage,
                        style: TextStyle(
                          color: ext.subTextColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: ext.borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.qr_code, size: 20, color: ext.navInactiveColor),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // サービスアイコングリッド
          Container(
            color: ext.surfaceColor,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  sq.common.services,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ServiceIcon(
                      icon: Icons.payments_outlined,
                      label: sq.common.payService,
                      color: ext.serviceIconPayColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.store_outlined,
                      label: sq.common.shopService,
                      color: ext.serviceIconDefaultColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.local_offer_outlined,
                      label: sq.common.couponService,
                      color: ext.serviceIconCouponColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.games_outlined,
                      label: sq.common.gamesService,
                      color: ext.serviceIconGamesColor,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ServiceIcon(
                      icon: Icons.tv_outlined,
                      label: sq.common.tvService,
                      color: ext.serviceIconTvColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.music_note_outlined,
                      label: sq.common.musicService,
                      color: ext.serviceIconMusicColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.newspaper_outlined,
                      label: sq.common.newsService,
                      color: ext.serviceIconNewsColor,
                    ),
                    _ServiceIcon(
                      icon: Icons.more_horiz,
                      label: sq.common.moreService,
                      color: ext.serviceIconDefaultColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // タイムライン
          Container(
            color: ext.surfaceColor,
            child: Column(
              children: [
                _TimelinePost(
                  name: sq.common.timelineName1,
                  content: sq.common.timelinePost1,
                  time: sq.common.timelineTime1,
                  likes: sq.common.timelineLikes1,
                  likeLabel: sq.common.likeButton,
                  commentLabel: sq.common.commentButton,
                  avatarColor: ext.timelineAvatar1Color,
                ),
                const Divider(height: 1, indent: 16),
                _TimelinePost(
                  name: sq.common.timelineName2,
                  content: sq.common.timelinePost2,
                  time: sq.common.timelineTime2,
                  likes: sq.common.timelineLikes2,
                  likeLabel: sq.common.likeButton,
                  commentLabel: sq.common.commentButton,
                  avatarColor: ext.timelineAvatar2Color,
                ),
                const Divider(height: 1, indent: 16),
                _TimelinePost(
                  name: sq.common.timelineName3,
                  content: sq.common.timelinePost3,
                  time: sq.common.timelineTime3,
                  likes: sq.common.timelineLikes3,
                  likeLabel: sq.common.likeButton,
                  commentLabel: sq.common.commentButton,
                  avatarColor: ext.timelineAvatar3Color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  const _ServiceIcon({required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final iconColor = color;
    final bgColor = color.withValues(alpha: 0.1);
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          children: [
            Material(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
              child: SizedBox(
                width: 52,
                height: 52,
                child: Icon(icon, color: iconColor, size: 26),
              ),
            ),
            const SizedBox(height: 4),
            UnreadableText(
              label,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelinePost extends StatelessWidget {
  const _TimelinePost({
    required this.name,
    required this.content,
    required this.time,
    required this.likes,
    required this.likeLabel,
    required this.commentLabel,
    required this.avatarColor,
  });

  final String name;
  final String content;
  final String time;
  final String likes;
  final String likeLabel;
  final String commentLabel;
  final Color avatarColor;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: avatarColor,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnreadableText(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      UnreadableText(
                        time,
                        style: TextStyle(
                          fontSize: 11,
                          color: ext.navInactiveColor,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.more_horiz,
                      color: ext.navInactiveColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            UnreadableText(
              content,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: ext.navInactiveColor,
                        ),
                        const SizedBox(width: 4),
                        UnreadableText(
                          likes,
                          style: TextStyle(
                            fontSize: 12,
                            color: ext.subTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up_outlined,
                          size: 16,
                          color: ext.navInactiveColor,
                        ),
                        const SizedBox(width: 4),
                        UnreadableText(
                          likeLabel,
                          style: TextStyle(
                            fontSize: 12,
                            color: ext.subTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 16,
                          color: ext.navInactiveColor,
                        ),
                        const SizedBox(width: 4),
                        UnreadableText(
                          commentLabel,
                          style: TextStyle(
                            fontSize: 12,
                            color: ext.subTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── トークタブ ────────────────────────────────────────────────────────────

class _TalkTabContent extends StatelessWidget {
  const _TalkTabContent({
    required this.contacts,
    required this.onContactTap,
  });

  final List<ChatContact> contacts;
  final void Function(ChatContact contact) onContactTap;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return ListView.separated(
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          tileColor: ext.surfaceColor,
          leading: CircleAvatar(
            backgroundColor: ext.avatarBackground,
            child: Text(
              contact.name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: UnreadableText(
            contact.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: UnreadableText(
            contact.lastMessage,
            style: TextStyle(color: ext.subTextColor, fontSize: 12),
          ),
          trailing: contact.unreadCount > 0
              ? CircleAvatar(
                  radius: 10,
                  backgroundColor: ext.badgeColor,
                  child: Text(
                    '${contact.unreadCount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                )
              : null,
          onTap: () => onContactTap(contact),
        );
      },
    );
  }
}

// ─── ニュースタブ ──────────────────────────────────────────────────────────

class _NewsTabContent extends StatelessWidget {
  const _NewsTabContent({required this.sq});

  final $chat.Translations sq;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return Column(
      children: [
        // タブセレクタ
        Container(
          color: ext.surfaceColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              _NewsTabSelector(
                label: sq.common.forYouTab,
                isSelected: true,
              ),
              const SizedBox(width: 16),
              _NewsTabSelector(
                label: sq.common.followTab,
                isSelected: false,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        // ニュースリスト
        Expanded(
          child: ListView(
            children: [
              _NewsItem(
                headline: sq.common.newsHeadline1,
                source: sq.common.newsSource1,
                tag: sq.common.newsTag1,
                time: sq.common.newsTime1,
                tagColor: ext.newsTagBlue,
              ),
              const Divider(height: 1, indent: 16),
              _NewsItem(
                headline: sq.common.newsHeadline2,
                source: sq.common.newsSource2,
                tag: sq.common.newsTag2,
                time: sq.common.newsTime2,
                tagColor: ext.newsTagGreen,
              ),
              const Divider(height: 1, indent: 16),
              _NewsItem(
                headline: sq.common.newsHeadline3,
                source: sq.common.newsSource3,
                tag: sq.common.newsTag3,
                time: sq.common.newsTime3,
                tagColor: ext.newsTagOrange,
              ),
              const Divider(height: 1, indent: 16),
              _NewsItem(
                headline: sq.common.newsHeadline4,
                source: sq.common.newsSource4,
                tag: sq.common.newsTag4,
                time: sq.common.newsTime4,
                tagColor: ext.newsTagPurple,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NewsTabSelector extends StatelessWidget {
  const _NewsTabSelector({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UnreadableText(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? ext.brandColor : ext.subTextColor,
              ),
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(
                  color: ext.brandColor,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NewsItem extends StatelessWidget {
  const _NewsItem({
    required this.headline,
    required this.source,
    required this.tag,
    required this.time,
    required this.tagColor,
  });

  final String headline;
  final String source;
  final String tag;
  final String time;
  final Color tagColor;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ChatAppTheme>()!;
    return InkWell(
      onTap: () {},
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: tagColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: UnreadableText(
                    tag,
                    style: TextStyle(
                      fontSize: 10,
                      color: tagColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                UnreadableText(
                  headline,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    UnreadableText(
                      source,
                      style: TextStyle(
                        fontSize: 11,
                        color: ext.subTextColor,
                      ),
                    ),
                    Text(
                      ' · ',
                      style: TextStyle(
                        color: ext.subTextColor,
                        fontSize: 11,
                      ),
                    ),
                    UnreadableText(
                      time,
                      style: TextStyle(
                        fontSize: 11,
                        color: ext.subTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 72,
            height: 60,
            decoration: BoxDecoration(
              color: tagColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.image_outlined,
              color: tagColor.withValues(alpha: 0.5),
              size: 28,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
