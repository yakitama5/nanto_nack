import 'package:chat/src/domain/chat_tab.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/i18n/chat_translations_extension.dart';
import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';

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
    required this.overlays,
    this.talkTabBadgeCount = 0,
  });

  final ChatTab currentTab;
  final void Function(ChatTab tab) onTabChanged;
  final List<ChatContact> contacts;
  final void Function(ChatContact contact) onContactTap;
  final List<Widget> overlays;

  /// トークタブに表示する未読バッジ数
  final int talkTabBadgeCount;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    const lineGreen = Color(0xFF00B900);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Column(
            children: [
              // ヘッダー
              Container(
                color: lineGreen,
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
                        const Icon(Icons.search, color: Colors.white),
                        const SizedBox(width: 16),
                        const Icon(Icons.more_vert, color: Colors.white),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
              // タブコンテンツ
              Expanded(
                child: switch (currentTab) {
                  ChatTab.home => _HomeTabContent(),
                  ChatTab.talk => _TalkTabContent(
                      contacts: contacts,
                      onContactTap: onContactTap,
                    ),
                  ChatTab.news => const _NewsTabContent(),
                },
              ),
            ],
          ),
          // オーバーレイ（MissionCutIn, QuizResultOverlay など）
          ...overlays,
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentTab.index,
        onDestinationSelected: (index) =>
            onTabChanged(ChatTab.values[index]),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: sq.common.homeTab,
          ),
          NavigationDestination(
            icon: talkTabBadgeCount > 0
                ? Badge(
                    label: Text('$talkTabBadgeCount'),
                    child: const Icon(Icons.chat_bubble_outline),
                  )
                : const Icon(Icons.chat_bubble_outline),
            selectedIcon: talkTabBadgeCount > 0
                ? Badge(
                    label: Text('$talkTabBadgeCount'),
                    child: const Icon(Icons.chat_bubble),
                  )
                : const Icon(Icons.chat_bubble),
            label: sq.common.talkTab,
          ),
          NavigationDestination(
            icon: const Icon(Icons.newspaper_outlined),
            selectedIcon: const Icon(Icons.newspaper),
            label: sq.common.newsTab,
          ),
        ],
      ),
    );
  }
}

// ─── ホームタブ ────────────────────────────────────────────────────────────

class _HomeTabContent extends StatelessWidget {
  const _HomeTabContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // プロフィールバナー
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.person, size: 36, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UnreadableText(
                        'My Profile',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      UnreadableText(
                        'Status message here',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.qr_code, color: Colors.grey),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // サービスアイコングリッド
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  'Services',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ServiceIcon(icon: Icons.payments_outlined, label: 'Pay'),
                    _ServiceIcon(icon: Icons.store_outlined, label: 'Shop'),
                    _ServiceIcon(icon: Icons.local_offer_outlined, label: 'Coupon'),
                    _ServiceIcon(icon: Icons.games_outlined, label: 'Games'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ServiceIcon(icon: Icons.tv_outlined, label: 'TV'),
                    _ServiceIcon(icon: Icons.music_note_outlined, label: 'Music'),
                    _ServiceIcon(icon: Icons.newspaper_outlined, label: 'News'),
                    _ServiceIcon(icon: Icons.more_horiz, label: 'More'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // タイムラインプレースホルダー
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(3, (i) => _TimelineItem(index: i)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  const _ServiceIcon({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.grey.shade600, size: 28),
        ),
        const SizedBox(height: 4),
        UnreadableText(
          label,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 10,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
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
    return ListView.separated(
      itemCount: contacts.length,
      separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF00897B),
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
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          trailing: contact.unreadCount > 0
              ? CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red,
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
  const _NewsTabContent();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 10,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 64,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
