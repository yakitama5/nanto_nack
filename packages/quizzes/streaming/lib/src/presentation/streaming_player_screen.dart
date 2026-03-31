import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';

/// YouTube 風プレイヤー共通UI
class StreamingPlayerScreen extends StatelessWidget {
  const StreamingPlayerScreen({
    super.key,
    required this.video,
    required this.isPlaying,
    required this.progressSeconds,
    required this.quizStatus,
    required this.remainingSeconds,
    required this.timeLimitSeconds,
    required this.missionText,
    required this.onGiveUp,
    required this.overlays,
    this.onPlayTap,
    this.onShareTap,
    this.onSaveTap,
    this.onMoreTap,
    this.onSubtitleToggle,
    this.showShareButton = true,
    this.showSaveButton = true,
    this.showMoreButton = false,
    this.showSubtitleToggle = false,
    this.highlightPlay = false,
    this.highlightShare = false,
    this.highlightSave = false,
    this.highlightMore = false,
  });

  final StreamingVideo video;
  final bool isPlaying;
  final int progressSeconds;
  final QuizStatus quizStatus;
  final int remainingSeconds;
  final int timeLimitSeconds;
  final String missionText;
  final VoidCallback onGiveUp;
  final List<Widget> overlays;

  final VoidCallback? onPlayTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onMoreTap;
  final VoidCallback? onSubtitleToggle;

  final bool showShareButton;
  final bool showSaveButton;
  final bool showMoreButton;
  final bool showSubtitleToggle;

  /// ボタンハイライト（ヒント）
  final bool highlightPlay;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightMore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              // ステータスバー分の余白
              SafeArea(
                bottom: false,
                child: _StreamingAppBar(onGiveUp: onGiveUp),
              ),
              // 動画プレイヤーエリア
              _VideoPlayer(
                video: video,
                isPlaying: isPlaying,
                progressSeconds: progressSeconds,
                onPlayTap: onPlayTap,
                highlightPlay: highlightPlay,
              ),
              // 動画情報・アクションボタン
              Expanded(
                child: ColoredBox(
                  color: Colors.white,
                  child: _VideoInfoSection(
                    video: video,
                    onShareTap: onShareTap,
                    onSaveTap: onSaveTap,
                    onMoreTap: onMoreTap,
                    onSubtitleToggle: onSubtitleToggle,
                    showShareButton: showShareButton,
                    showSaveButton: showSaveButton,
                    showMoreButton: showMoreButton,
                    showSubtitleToggle: showSubtitleToggle,
                    highlightShare: highlightShare,
                    highlightSave: highlightSave,
                    highlightMore: highlightMore,
                  ),
                ),
              ),
            ],
          ),
          // フローティングミッションバブル
          if (quizStatus == QuizStatus.playing)
            FloatingMissionBubble(
              remainingSeconds: remainingSeconds,
              missionText: missionText,
              hintUsed: false,
              timeLimitSeconds: timeLimitSeconds,
              onGiveUp: onGiveUp,
            ),
          // オーバーレイ
          ...overlays,
        ],
      ),
    );
  }
}

// ─── AppBar ─────────────────────────────────────────────────────────────────

class _StreamingAppBar extends StatelessWidget {
  const _StreamingAppBar({required this.onGiveUp});

  final VoidCallback onGiveUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF212121),
      height: 48,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          const Icon(Icons.cast, color: Colors.white),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert, color: Colors.white),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

// ─── 動画プレイヤー ──────────────────────────────────────────────────────────

class _VideoPlayer extends StatelessWidget {
  const _VideoPlayer({
    required this.video,
    required this.isPlaying,
    required this.progressSeconds,
    this.onPlayTap,
    this.highlightPlay = false,
  });

  final StreamingVideo video;
  final bool isPlaying;
  final int progressSeconds;
  final VoidCallback? onPlayTap;
  final bool highlightPlay;

  @override
  Widget build(BuildContext context) {
    final thumbnailColor =
        StreamingCatalog.thumbnailColors[video.colorSeed % StreamingCatalog.thumbnailColors.length];
    final thumbnailIcon =
        StreamingCatalog.thumbnailIcons[video.colorSeed % StreamingCatalog.thumbnailIcons.length];
    final progress = video.durationSeconds > 0
        ? (progressSeconds / video.durationSeconds).clamp(0.0, 1.0)
        : 0.0;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          // サムネイル背景
          Container(
            color: thumbnailColor,
            child: Center(
              child: Icon(thumbnailIcon, size: 72, color: Colors.white54),
            ),
          ),
          // 再生中オーバーレイ（暗転 + 一時停止アイコン）
          if (isPlaying)
            Container(
              color: Colors.black.withValues(alpha: 0.3),
              child: const Center(
                child: Icon(
                  Icons.pause,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          // 再生ボタン（未再生のみ）
          if (!isPlaying)
            GestureDetector(
              onTap: onPlayTap,
              child: Center(
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: highlightPlay
                        ? Colors.red.withValues(alpha: 0.9)
                        : Colors.black.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                    border: highlightPlay
                        ? Border.all(color: Colors.yellow, width: 3)
                        : null,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 44,
                  ),
                ),
              ),
            ),
          // プログレスバー
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                // 時間表示
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(progressSeconds),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        _formatDuration(video.durationSeconds),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                // シークバー
                SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white30,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

// ─── 動画情報セクション ───────────────────────────────────────────────────────

class _VideoInfoSection extends StatelessWidget {
  const _VideoInfoSection({
    required this.video,
    this.onShareTap,
    this.onSaveTap,
    this.onMoreTap,
    this.onSubtitleToggle,
    required this.showShareButton,
    required this.showSaveButton,
    required this.showMoreButton,
    required this.showSubtitleToggle,
    required this.highlightShare,
    required this.highlightSave,
    required this.highlightMore,
  });

  final StreamingVideo video;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onMoreTap;
  final VoidCallback? onSubtitleToggle;
  final bool showShareButton;
  final bool showSaveButton;
  final bool showMoreButton;
  final bool showSubtitleToggle;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightMore;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タイトル・チャンネル情報
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  video.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    UnreadableText(
                      '${_formatViewCount(video.viewCount)} ${sq.common.views}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Text(
                      ' · ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    UnreadableText(
                      video.uploadedAgo,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // アクションボタン行
          _ActionButtonRow(
            video: video,
            onShareTap: onShareTap,
            onSaveTap: onSaveTap,
            onMoreTap: onMoreTap,
            showShareButton: showShareButton,
            showSaveButton: showSaveButton,
            showMoreButton: showMoreButton,
            highlightShare: highlightShare,
            highlightSave: highlightSave,
            highlightMore: highlightMore,
          ),
          const Divider(height: 1),
          // チャンネル情報
          _ChannelRow(video: video),
          const Divider(height: 1),
          // 字幕トグル（Quiz4で使用）
          if (showSubtitleToggle)
            _SubtitleRow(
              video: video,
              onToggle: onSubtitleToggle,
            ),
        ],
      ),
    );
  }

  String _formatViewCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(0)}K';
    }
    return count.toString();
  }
}

// ─── アクションボタン行 ───────────────────────────────────────────────────────

class _ActionButtonRow extends StatelessWidget {
  const _ActionButtonRow({
    required this.video,
    this.onShareTap,
    this.onSaveTap,
    this.onMoreTap,
    required this.showShareButton,
    required this.showSaveButton,
    required this.showMoreButton,
    required this.highlightShare,
    required this.highlightSave,
    required this.highlightMore,
  });

  final StreamingVideo video;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onMoreTap;
  final bool showShareButton;
  final bool showSaveButton;
  final bool showMoreButton;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightMore;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // いいね
          _ActionButton(
            icon: video.isLiked
                ? Icons.thumb_up
                : Icons.thumb_up_outlined,
            label: sq.common.likeButton,
            count: _formatCount(video.likeCount),
          ),
          // 低評価
          _ActionButton(
            icon: Icons.thumb_down_outlined,
            label: sq.common.dislikeButton,
          ),
          // シェア
          if (showShareButton)
            _ActionButton(
              icon: Icons.share_outlined,
              label: sq.common.shareButton,
              onTap: onShareTap,
              isHighlighted: highlightShare,
            ),
          // 保存
          if (showSaveButton)
            _ActionButton(
              icon: video.isSaved
                  ? Icons.bookmark
                  : Icons.bookmark_border_outlined,
              label: sq.common.saveButton,
              onTap: onSaveTap,
              isHighlighted: highlightSave,
              isActive: video.isSaved,
            ),
          // その他
          if (showMoreButton)
            _ActionButton(
              icon: Icons.more_horiz,
              label: sq.common.moreButton,
              onTap: onMoreTap,
              isHighlighted: highlightMore,
            ),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(0)}K';
    }
    return count.toString();
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    this.count,
    this.onTap,
    this.isHighlighted = false,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final String? count;
  final VoidCallback? onTap;
  final bool isHighlighted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.blue : Colors.black87;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: isHighlighted
            ? BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 2),
                borderRadius: BorderRadius.circular(8),
                color: Colors.yellow.withValues(alpha: 0.1),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 2),
            UnreadableText(
              count != null ? '$label $count' : label,
              style: TextStyle(fontSize: 11, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── チャンネル行 ─────────────────────────────────────────────────────────────

class _ChannelRow extends StatelessWidget {
  const _ChannelRow({required this.video});

  final StreamingVideo video;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final thumbnailColor =
        StreamingCatalog.thumbnailColors[video.colorSeed % StreamingCatalog.thumbnailColors.length];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: thumbnailColor,
            child: Text(
              video.channelName[0],
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: UnreadableText(
              video.channelName,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: null,
            child: UnreadableText(
              sq.common.subscribeButton,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── 字幕行 ───────────────────────────────────────────────────────────────────

class _SubtitleRow extends StatelessWidget {
  const _SubtitleRow({
    required this.video,
    this.onToggle,
  });

  final StreamingVideo video;
  final VoidCallback? onToggle;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.subtitles_outlined, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: UnreadableText(
              sq.common.subtitles,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          GestureDetector(
            onTap: onToggle,
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                color: video.subtitlesEnabled
                    ? Colors.blue
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14),
              ),
              child: AnimatedAlign(
                alignment: video.subtitlesEnabled
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          UnreadableText(
            video.subtitlesEnabled
                ? sq.common.subtitlesOn
                : sq.common.subtitlesOff,
            style: TextStyle(
              fontSize: 12,
              color: video.subtitlesEnabled ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── シェアシート ─────────────────────────────────────────────────────────────

/// 動画シェアシート（iOS/Android 風ボトムシート）
class StreamingShareSheet extends StatelessWidget {
  const StreamingShareSheet({
    super.key,
    required this.onShare,
    required this.onDismiss,
  });

  final VoidCallback onShare;
  final VoidCallback onDismiss;

  static const _shareApps = [
    (icon: Icons.message, color: Color(0xFF25D366)),
    (icon: Icons.email_outlined, color: Color(0xFF4285F4)),
    (icon: Icons.chat_bubble_outline, color: Color(0xFF1DA1F2)),
    (icon: Icons.facebook, color: Color(0xFF1877F2)),
    (icon: Icons.content_copy, color: Color(0xFF757575)),
    (icon: Icons.more_horiz, color: Color(0xFF757575)),
  ];

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            UnreadableText(
              sq.common.shareTitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _shareApps.map((app) {
                return GestureDetector(
                  onTap: onShare,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: app.color.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(app.icon, color: app.color, size: 26),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ─── ⋮ メニュー ────────────────────────────────────────────────────────────

/// 動画の「その他」メニュー（ボトムシート）
class StreamingMoreMenu extends StatelessWidget {
  const StreamingMoreMenu({
    super.key,
    required this.video,
    required this.onSubtitleTap,
    required this.onDismiss,
  });

  final StreamingVideo video;
  final VoidCallback onSubtitleTap;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    final items = [
      (icon: Icons.subtitles_outlined, label: sq.common.subtitles, onTap: onSubtitleTap),
      (icon: Icons.high_quality, label: sq.common.quality, onTap: onDismiss),
      (icon: Icons.speed, label: sq.common.playbackSpeed, onTap: onDismiss),
      (icon: Icons.flag_outlined, label: sq.common.reportButton, onTap: onDismiss),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ...items.map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: UnreadableText(item.label),
                onTap: item.onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
