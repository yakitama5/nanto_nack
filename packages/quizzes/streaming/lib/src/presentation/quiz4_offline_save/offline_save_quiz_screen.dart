import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz4_offline_save/offline_save_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class OfflineSaveQuizScreen extends ConsumerStatefulWidget {
  const OfflineSaveQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<OfflineSaveQuizScreen> createState() => _OfflineSaveQuizScreenState();
}

class _OfflineSaveQuizScreenState extends ConsumerState<OfflineSaveQuizScreen> {
  static const _timeLimitSeconds = 90;
  bool _showCutIn = true;

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

    final isHighestQuality = state.video.quality == '2160p' || state.video.quality == '1080p';

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: 600,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
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
      highlightMore: state.status == QuizStatus.playing && !isHighestQuality && !state.isSettingsOpen,
      highlightDownload: state.status == QuizStatus.playing && isHighestQuality && !state.video.isDownloaded,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 設定メニュー
        if (state.isSettingsOpen && !state.isQualityListOpen)
          _OverlayMenu(
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
          _OverlayMenu(
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
                setState(() => _showCutIn = true);
                ref.read(offlineSaveQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _OfflineSaveInsight(missionText: missionText),
            ),
          ),
      ],
    );
  }
}

class _OverlayMenu extends StatelessWidget {
  const _OverlayMenu({required this.onDismiss, required this.child});

  final VoidCallback onDismiss;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onDismiss,
        child: ColoredBox(
          color: Colors.black45,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {},
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _OfflineSaveInsight extends StatelessWidget {
  const _OfflineSaveInsight({required this.missionText});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz4.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                insight.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          insight.subtitle,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '📈', title: insight.qualityTitle, desc: insight.qualityDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '⬇️', title: insight.downloadTitle, desc: insight.downloadDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '📋', title: insight.locationTitle, desc: insight.locationDesc),
      ],
    );
  }
}

class _InsightItem extends StatelessWidget {
  const _InsightItem({
    required this.emoji,
    required this.title,
    required this.desc,
  });

  final String emoji;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
