import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/streaming_quiz_config.dart';
import 'package:system/system.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz4_offline_save/offline_save_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_overlay_menu.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class OfflineSaveQuizScreen extends ConsumerStatefulWidget {
  const OfflineSaveQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<OfflineSaveQuizScreen> createState() => _OfflineSaveQuizScreenState();
}

class _OfflineSaveQuizScreenState extends ConsumerState<OfflineSaveQuizScreen> {
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(offlineSaveQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(offlineSaveQuizProvider);
    final missionText = context.s.quiz4.missionText;

    // 1080p以上の高画質（最高画質ではないが、ダウンロード可能な品質）かどうかを判定
    final isHighQuality = state.video.quality == '2160p' || state.video.quality == '1080p';

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: 600,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: StreamingQuizConfig.quiz4OfflineSaveTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(offlineSaveQuizProvider.notifier).giveUp(),
      onMoreTap: () => ref.read(offlineSaveQuizProvider.notifier).tapSettings(),
      onDownloadTap: () =>
          ref.read(offlineSaveQuizProvider.notifier).tapDownload(),
      onLikeTap: () => ref.read(offlineSaveQuizProvider.notifier).tapLike(),
      onDislikeTap: () =>
          ref.read(offlineSaveQuizProvider.notifier).tapDislike(),
      onShareTap: () => ref.read(offlineSaveQuizProvider.notifier).tapShare(),
      onSaveTap: () => ref.read(offlineSaveQuizProvider.notifier).tapSave(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightMore: _hintUsed && state.status == QuizStatus.playing && !isHighQuality && !state.isSettingsOpen,
      highlightDownload: _hintUsed && state.status == QuizStatus.playing && isHighQuality && !state.video.isDownloaded,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: StreamingQuizConfig.quiz4OfflineSaveTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 設定メニュー
        if (state.isSettingsOpen && !state.isQualityListOpen)
          StreamingOverlayMenu(
            onDismiss: () => ref.read(offlineSaveQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {},
              onQualityTap: () => ref.read(offlineSaveQuizProvider.notifier).tapQualityMenu(),
              onSpeedTap: () {},
              onDismiss: () => ref.read(offlineSaveQuizProvider.notifier).dismissSettings(),
            ),
          ),
        // 画質選択リスト
        if (state.isQualityListOpen)
          StreamingOverlayMenu(
            onDismiss: () => ref.read(offlineSaveQuizProvider.notifier).dismissSettings(),
            child: StreamingSelectionList(
              title: context.s.common.quality,
              items: const ['144p', '360p', '720p', '1080p', '2160p (4K)'],
              selectedItem: state.video.quality,
              onSelected: (val) {
                final quality = val.split(' ')[0];
                ref.read(offlineSaveQuizProvider.notifier).selectQuality(quality);
              },
            ),
          ),
        if (state.status == QuizStatus.correct ||
            state.status == QuizStatus.incorrect ||
            state.status == QuizStatus.timeUp ||
            state.status == QuizStatus.giveUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: state.status,
              score: state.score,
              elapsedMs: state.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _hintUsed = false;
                });
                ref.read(offlineSaveQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz4.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '📈',
                        title: insight.qualityTitle,
                        desc: insight.qualityDesc,
                      ),
                      QuizInsightItem(
                        emoji: '⬇️',
                        title: insight.downloadTitle,
                        desc: insight.downloadDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📋',
                        title: insight.locationTitle,
                        desc: insight.locationDesc,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}

