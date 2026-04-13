import 'dart:async';
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
    this.onNextTap,
    this.onSeek,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onLikeTap,
    this.onDislikeTap,
    this.onShareTap,
    this.onSaveTap,
    this.onDownloadTap,
    this.onMoreTap,
    this.onSubtitleToggle,
    this.onQualitySelect,
    this.onSpeedSelect,
    this.showShareButton = true,
    this.showSaveButton = true,
    this.showDownloadButton = true,
    this.showMoreButton = true,
    this.showSubtitleToggle = false,
    this.highlightPlay = false,
    this.highlightNext = false,
    this.highlightSeek = false,
    this.highlightCC = false,
    this.highlightShare = false,
    this.highlightSave = false,
    this.highlightDownload = false,
    this.highlightMore = false,
    this.hintUsed = false,
    this.onHintTap,
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
  final VoidCallback? onNextTap;
  final ValueChanged<double>? onSeek;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;
  final VoidCallback? onLikeTap;
  final VoidCallback? onDislikeTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onDownloadTap;
  final VoidCallback? onMoreTap;
  final VoidCallback? onSubtitleToggle;
  final ValueChanged<String>? onQualitySelect;
  final ValueChanged<double>? onSpeedSelect;

  final bool showShareButton;
  final bool showSaveButton;
  final bool showDownloadButton;
  final bool showMoreButton;
  final bool showSubtitleToggle;

  /// ボタンハイライト（ヒント）
  final bool highlightPlay;
  final bool highlightNext;
  final bool highlightSeek;
  final bool highlightCC;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightDownload;
  final bool highlightMore;

  /// ヒントを使用済みかどうか
  final bool hintUsed;

  /// ヒントボタンタップ時のコールバック
  final VoidCallback? onHintTap;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(context.s.common.quitConfirmTitle),
            content: Text(context.s.common.quitConfirmMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: Text(context.s.common.continueButton),
              ),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                child: Text(context.s.common.quitButton),
              ),
            ],
          ),
        );
        if (confirmed == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).extension<StreamingAppTheme>()!.playerBackground,
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
                onNextTap: onNextTap,
                onSeek: onSeek,
                onLongPressStart: onLongPressStart,
                onLongPressEnd: onLongPressEnd,
                onCCSelect: onSubtitleToggle,
                onMoreTap: onMoreTap,
                highlightPlay: highlightPlay,
                highlightNext: highlightNext,
                highlightSeek: highlightSeek,
                highlightCC: highlightCC,
                highlightMore: highlightMore,
              ),
              // 動画情報・アクションボタン
              Expanded(
                child: Container(
                  color: Theme.of(context).extension<StreamingAppTheme>()!.infoSectionBackground,
                  child: _VideoInfoSection(
                    video: video,
                    onLikeTap: onLikeTap,
                    onDislikeTap: onDislikeTap,
                    onShareTap: onShareTap,
                    onSaveTap: onSaveTap,
                    onDownloadTap: onDownloadTap,
                    onMoreTap: onMoreTap,
                    onSubtitleToggle: onSubtitleToggle,
                    showShareButton: showShareButton,
                    showSaveButton: showSaveButton,
                    showDownloadButton: showDownloadButton,
                    showMoreButton: showMoreButton,
                    showSubtitleToggle: showSubtitleToggle,
                    highlightShare: highlightShare,
                    highlightSave: highlightSave,
                    highlightDownload: highlightDownload,
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
              hintUsed: hintUsed,
              onHintTap: onHintTap,
              timeLimitSeconds: timeLimitSeconds,
              onGiveUp: onGiveUp,
            ),
          // オーバーレイ
          ...overlays,
        ],
      ),
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
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    return Container(
      color: ext.appBarBackground,
      height: 48,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            onPressed: () => Navigator.maybePop(context),
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

class _VideoPlayer extends StatefulWidget {
  const _VideoPlayer({
    required this.video,
    required this.isPlaying,
    required this.progressSeconds,
    this.onPlayTap,
    this.onNextTap,
    this.onSeek,
    this.onLongPressStart,
    this.onLongPressEnd,
    this.onCCSelect,
    this.onMoreTap,
    this.highlightPlay = false,
    this.highlightNext = false,
    this.highlightSeek = false,
    this.highlightCC = false,
    this.highlightMore = false,
  });

  final StreamingVideo video;
  final bool isPlaying;
  final int progressSeconds;
  final VoidCallback? onPlayTap;
  final VoidCallback? onNextTap;
  final ValueChanged<double>? onSeek;
  final VoidCallback? onLongPressStart;
  final VoidCallback? onLongPressEnd;
  final VoidCallback? onCCSelect;
  final VoidCallback? onMoreTap;
  final bool highlightPlay;
  final bool highlightNext;
  final bool highlightSeek;
  final bool highlightCC;
  final bool highlightMore;

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  bool _showControls = true;
  Timer? _hideTimer;
  late int _localProgress;
  Timer? _progressTimer;

  @override
  void initState() {
    super.initState();
    _localProgress = widget.progressSeconds;
    if (widget.isPlaying) {
      _startProgressTimer();
    }
  }

  @override
  void didUpdateWidget(_VideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 再生状態が変わったとき
    if (widget.isPlaying != oldWidget.isPlaying) {
      if (widget.isPlaying) {
        _startProgressTimer();
      } else {
        _progressTimer?.cancel();
      }
    }
    // 外部からの進行秒数更新（シークや動画切り替え）を同期する
    if (widget.progressSeconds != oldWidget.progressSeconds) {
      setState(() => _localProgress = widget.progressSeconds);
    }
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (_localProgress < widget.video.durationSeconds) {
            _localProgress++;
          }
        });
      }
    });
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && widget.isPlaying) {
        setState(() => _showControls = false);
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
      if (_showControls) {
        _startHideTimer();
      }
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _progressTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // プレイヤー外（ヒントハイライト・ブランドカラー）はテーマから取得する
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    final thumbnailColor =
        StreamingCatalog.thumbnailColors[widget.video.colorSeed % StreamingCatalog.thumbnailColors.length];
    final thumbnailIcon =
        StreamingCatalog.thumbnailIcons[widget.video.colorSeed % StreamingCatalog.thumbnailIcons.length];
    final progress = widget.video.durationSeconds > 0
        ? (_localProgress / widget.video.durationSeconds).clamp(0.0, 1.0)
        : 0.0;

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
        onTap: _toggleControls,
        onLongPressStart: (_) => widget.onLongPressStart?.call(),
        onLongPressEnd: (_) => widget.onLongPressEnd?.call(),
        child: Stack(
          children: [
            // サムネイル背景
            Container(
              color: thumbnailColor,
              child: Center(
                child: Icon(thumbnailIcon, size: 72, color: Colors.white54),
              ),
            ),
            // 倍速再生中表示
            if (widget.video.playbackSpeed > 1.0)
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${widget.video.playbackSpeed}x ➡➡',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            // コントロールUI
            if (_showControls)
              Container(
                color: Colors.black38,
                child: Stack(
                  children: [
                    // 中央ボタン（再生・スキップ）
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous, color: Colors.white, size: 32),
                            onPressed: null,
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: widget.onPlayTap,
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: widget.highlightPlay
                                    ? ext.brandRedColor.withValues(alpha: 0.8)
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                                border: widget.highlightPlay
                                    ? Border.all(color: ext.highlightBorderColor, width: 2)
                                    : null,
                              ),
                              child: Icon(
                                widget.isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          IconButton(
                            icon: Icon(
                              Icons.skip_next,
                              color: widget.highlightNext ? ext.highlightBorderColor : Colors.white,
                              size: 32,
                            ),
                            onPressed: widget.onNextTap,
                          ),
                        ],
                      ),
                    ),
                    // 右上ボタン（CC, ⚙）
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Icon(
                                  Icons.closed_caption_outlined,
                                  color: widget.video.subtitlesEnabled ? Colors.white : Colors.white70,
                                ),
                                if (widget.video.subtitlesEnabled)
                                  Container(
                                    width: 14,
                                    height: 2,
                                    color: ext.brandRedColor,
                                  ),
                              ],
                            ),
                            onPressed: widget.onCCSelect,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            style: widget.highlightCC
                                ? IconButton.styleFrom(backgroundColor: ext.highlightBorderColor.withValues(alpha: 0.3))
                                : null,
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: widget.onMoreTap,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: widget.highlightMore
                                  ? BoxDecoration(
                                      color: ext.highlightBorderColor.withValues(alpha: 0.3),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: ext.highlightBorderColor, width: 1.5),
                                    )
                                  : null,
                              child: const Icon(Icons.settings_outlined, color: Colors.white70),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            // プログレスバー（シーク対応）
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  // 時間表示（コントロール表示時のみ）
                  if (_showControls)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Text(
                            _formatDuration(_localProgress),
                            style: const TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          const Text(' / ', style: TextStyle(color: Colors.white54, fontSize: 11)),
                          Text(
                            _formatDuration(widget.video.durationSeconds),
                            style: const TextStyle(color: Colors.white54, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  // シークバー
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      thumbShape: widget.highlightSeek || _showControls
                          ? const RoundSliderThumbShape(enabledThumbRadius: 6)
                          : const RoundSliderThumbShape(enabledThumbRadius: 0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                      activeTrackColor: ext.brandRedColor,
                      inactiveTrackColor: Colors.white24,
                      thumbColor: ext.brandRedColor,
                    ),
                    child: Slider(
                      value: progress,
                      onChanged: (val) {
                        setState(
                          () => _localProgress =
                              (widget.video.durationSeconds * val).round(),
                        );
                        widget.onSeek?.call(val);
                        _startHideTimer();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    this.onLikeTap,
    this.onDislikeTap,
    this.onShareTap,
    this.onSaveTap,
    this.onDownloadTap,
    this.onMoreTap,
    this.onSubtitleToggle,
    required this.showShareButton,
    required this.showSaveButton,
    required this.showDownloadButton,
    required this.showMoreButton,
    required this.showSubtitleToggle,
    required this.highlightShare,
    required this.highlightSave,
    required this.highlightDownload,
    required this.highlightMore,
  });

  final StreamingVideo video;
  final VoidCallback? onLikeTap;
  final VoidCallback? onDislikeTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onDownloadTap;
  final VoidCallback? onMoreTap;
  final VoidCallback? onSubtitleToggle;
  final bool showShareButton;
  final bool showSaveButton;
  final bool showDownloadButton;
  final bool showMoreButton;
  final bool showSubtitleToggle;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightDownload;
  final bool highlightMore;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;

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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    UnreadableText(
                      '${_formatViewCount(video.viewCount)} ${sq.common.views}',
                      style: TextStyle(
                        fontSize: 12,
                        color: ext.subTextColor,
                      ),
                    ),
                    Text(' · ', style: TextStyle(color: ext.subTextColor)),
                    UnreadableText(
                      video.uploadedAgo,
                      style: TextStyle(
                        fontSize: 12,
                        color: ext.subTextColor,
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
            onLikeTap: onLikeTap,
            onDislikeTap: onDislikeTap,
            onShareTap: onShareTap,
            onSaveTap: onSaveTap,
            onDownloadTap: onDownloadTap,
            onMoreTap: onMoreTap,
            showShareButton: showShareButton,
            showSaveButton: showSaveButton,
            showDownloadButton: showDownloadButton,
            showMoreButton: showMoreButton,
            highlightShare: highlightShare,
            highlightSave: highlightSave,
            highlightDownload: highlightDownload,
            highlightMore: highlightMore,
          ),
          const Divider(height: 1),
          // チャンネル情報
          _ChannelRow(video: video),
          const Divider(height: 1),
          // 字幕トグル
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
    this.onLikeTap,
    this.onDislikeTap,
    this.onShareTap,
    this.onSaveTap,
    this.onDownloadTap,
    this.onMoreTap,
    required this.showShareButton,
    required this.showSaveButton,
    required this.showDownloadButton,
    required this.showMoreButton,
    required this.highlightShare,
    required this.highlightSave,
    required this.highlightDownload,
    required this.highlightMore,
  });

  final StreamingVideo video;
  final VoidCallback? onLikeTap;
  final VoidCallback? onDislikeTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onSaveTap;
  final VoidCallback? onDownloadTap;
  final VoidCallback? onMoreTap;
  final bool showShareButton;
  final bool showSaveButton;
  final bool showDownloadButton;
  final bool showMoreButton;
  final bool highlightShare;
  final bool highlightSave;
  final bool highlightDownload;
  final bool highlightMore;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Row(
        children: [
          // いいね（アニメーション付き）
          _AnimatedLikeButton(
            isLiked: video.isLiked,
            count: _formatCount(video.likeCount),
            label: sq.common.likeButton,
            onTap: onLikeTap,
          ),
          // 低評価
          _ActionButton(
            icon: Icons.thumb_down_outlined,
            label: sq.common.dislikeButton,
            onTap: onDislikeTap,
          ),
          // シェア
          if (showShareButton)
            _ActionButton(
              icon: Icons.share_outlined,
              label: sq.common.shareButton,
              onTap: onShareTap,
              isHighlighted: highlightShare,
            ),
          // ダウンロード (Quiz 4)
          if (showDownloadButton)
            _ActionButton(
              icon: video.isDownloaded ? Icons.file_download_done : Icons.file_download_outlined,
              label: sq.common.downloadButton,
              onTap: onDownloadTap,
              isHighlighted: highlightDownload,
              isActive: video.isDownloaded,
            ),
          // 保存
          if (showSaveButton)
            _ActionButton(
              icon: video.isSaved ? Icons.bookmark : Icons.bookmark_border_outlined,
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
    this.onTap,
    this.isHighlighted = false,
    this.isActive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isHighlighted;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    final color = isActive ? ext.activeStateColor : ext.actionButtonColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: isHighlighted
            ? BoxDecoration(
                border: Border.all(color: ext.highlightBorderColor, width: 2),
                borderRadius: BorderRadius.circular(20),
                color: ext.highlightBorderColor.withValues(alpha: 0.1),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 2),
            UnreadableText(
              label,
              style: TextStyle(fontSize: 10, color: color),
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
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    final thumbnailColor =
        StreamingCatalog.thumbnailColors[video.colorSeed % StreamingCatalog.thumbnailColors.length];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: thumbnailColor,
            child: Text(
              video.channelName[0],
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UnreadableText(
                  video.channelName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                UnreadableText(
                  '1.2M ${sq.common.subscribers}',
                  style: TextStyle(fontSize: 11, color: ext.subTextColor),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: ext.subscribeButtonBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: UnreadableText(
                sq.common.subscribeButton,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
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
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;

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
                color: video.subtitlesEnabled ? ext.subtitleToggleActive : ext.subtitleToggleInactive,
                borderRadius: BorderRadius.circular(14),
              ),
              child: AnimatedAlign(
                alignment: video.subtitlesEnabled ? Alignment.centerRight : Alignment.centerLeft,
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
            video.subtitlesEnabled ? sq.common.subtitlesOn : sq.common.subtitlesOff,
            style: TextStyle(
              fontSize: 12,
              color: video.subtitlesEnabled ? ext.subtitleToggleActive : ext.subTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── ⋮ メニュー (Settings) ────────────────────────────────────────────────────

class StreamingMoreMenu extends StatelessWidget {
  const StreamingMoreMenu({
    super.key,
    required this.video,
    required this.onSubtitleTap,
    required this.onQualityTap,
    required this.onSpeedTap,
    required this.onDismiss,
  });

  final StreamingVideo video;
  final VoidCallback onSubtitleTap;
  final VoidCallback onQualityTap;
  final VoidCallback onSpeedTap;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final sq = context.sq;
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;

    return Container(
      decoration: BoxDecoration(
        color: ext.infoSectionBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
                color: ext.subtitleToggleInactive,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.subtitles_outlined),
              title: UnreadableText(sq.common.subtitles),
              trailing: UnreadableText(video.subtitlesEnabled ? sq.common.subtitlesOn : sq.common.subtitlesOff),
              onTap: onSubtitleTap,
            ),
            ListTile(
              leading: const Icon(Icons.high_quality),
              title: UnreadableText(sq.common.quality),
              trailing: UnreadableText(video.quality),
              onTap: onQualityTap,
            ),
            ListTile(
              leading: const Icon(Icons.speed),
              title: UnreadableText(sq.common.playbackSpeed),
              trailing: UnreadableText('${video.playbackSpeed}x'),
              onTap: onSpeedTap,
            ),
            ListTile(
              leading: const Icon(Icons.flag_outlined),
              title: UnreadableText(sq.common.reportButton),
              onTap: onDismiss,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ─── Selection Lists ─────────────────────────────────────────────────────────

class StreamingSelectionList extends StatelessWidget {
  const StreamingSelectionList({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  final String title;
  final List<String> items;
  final String selectedItem;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    return Container(
      decoration: BoxDecoration(
        color: ext.infoSectionBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: UnreadableText(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Divider(height: 1),
            ...items.map(
              (item) => ListTile(
                title: UnreadableText(item),
                trailing: item == selectedItem ? Icon(Icons.check, color: ext.activeStateColor) : null,
                onTap: () => onSelected(item),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ─── いいねボタン（スケールアニメーション付き） ──────────────────────────────────

class _AnimatedLikeButton extends StatefulWidget {
  const _AnimatedLikeButton({
    required this.isLiked,
    required this.count,
    required this.label,
    this.onTap,
  });

  final bool isLiked;
  final String count;
  final String label;
  final VoidCallback? onTap;

  @override
  State<_AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<_AnimatedLikeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.4),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.4, end: 1.0),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward(from: 0);
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<StreamingAppTheme>()!;
    final color = widget.isLiked ? ext.activeStateColor : ext.actionButtonColor;
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _scale,
              child: Icon(
                widget.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                size: 22,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            UnreadableText(
              '${widget.label} ${widget.count}',
              style: TextStyle(fontSize: 10, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
