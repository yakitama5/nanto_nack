import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz2_skip_seek/skip_seek_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_overlay_menu.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class SkipSeekQuizScreen extends ConsumerStatefulWidget {
  const SkipSeekQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SkipSeekQuizScreen> createState() => _SkipSeekQuizScreenState();
}

class _SkipSeekQuizScreenState extends ConsumerState<SkipSeekQuizScreen> {
  static const _timeLimitSeconds = 45;
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(skipSeekQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(skipSeekQuizProvider);
    final missionText = context.s.quiz2.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: state.progressSeconds,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(skipSeekQuizProvider.notifier).giveUp(),
      onNextTap: () => ref.read(skipSeekQuizProvider.notifier).tapNext(),
      onSeek: (val) => ref.read(skipSeekQuizProvider.notifier).onSeek(val),
      onLikeTap: () => ref.read(skipSeekQuizProvider.notifier).tapLike(),
      onDislikeTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapDislike(),
      onShareTap: () => ref.read(skipSeekQuizProvider.notifier).tapShare(),
      onSaveTap: () => ref.read(skipSeekQuizProvider.notifier).tapSave(),
      onDownloadTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapDownload(),
      onMoreTap: () =>
          ref.read(skipSeekQuizProvider.notifier).tapSettings(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightNext: _hintUsed && state.status == QuizStatus.playing && !state.isSkipped,
      highlightSeek: _hintUsed && state.status == QuizStatus.playing && state.isSkipped,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.isSettingsOpen)
          StreamingOverlayMenu(
            onDismiss: () =>
                ref.read(skipSeekQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {},
              onQualityTap: () {},
              onSpeedTap: () {},
              onDismiss: () =>
                  ref.read(skipSeekQuizProvider.notifier).dismissSettings(),
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
                ref.read(skipSeekQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _SkipSeekInsight(missionText: missionText),
            ),
          ),
      ],
    );
  }
}

class _SkipSeekInsight extends StatelessWidget {
  const _SkipSeekInsight({required this.missionText});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
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
              ?.copyWith(color: Theme.of(context).extension<StreamingAppTheme>()!.subTextColor),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '⏭️', title: insight.skipTitle, desc: insight.skipDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🔴', title: insight.seekTitle, desc: insight.seekDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🎯', title: insight.targetTitle, desc: insight.targetDesc),
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
                    ?.copyWith(color: Theme.of(context).extension<StreamingAppTheme>()!.subTextColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

