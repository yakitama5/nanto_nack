import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz1_subtitle/subtitle_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class SubtitleQuizScreen extends ConsumerStatefulWidget {
  const SubtitleQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<SubtitleQuizScreen> createState() => _SubtitleQuizScreenState();
}

class _SubtitleQuizScreenState extends ConsumerState<SubtitleQuizScreen> {
  static const _timeLimitSeconds = 30;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(subtitleQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(subtitleQuizProvider);
    final missionText = context.s.quiz1.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: true,
      progressSeconds: 120,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(subtitleQuizProvider.notifier).giveUp(),
      onSubtitleToggle: () =>
          ref.read(subtitleQuizProvider.notifier).tapCC(),
      showShareButton: false,
      showSaveButton: false,
      showDownloadButton: false,
      showMoreButton: false,
      highlightCC: state.status == QuizStatus.playing && !state.video.subtitlesEnabled,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
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
                ref.read(subtitleQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _SubtitleInsight(missionText: missionText),
            ),
          ),
      ],
    );
  }
}

class _SubtitleInsight extends StatelessWidget {
  const _SubtitleInsight({required this.missionText});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
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
        _InsightItem(emoji: '📺', title: insight.ccTitle, desc: insight.ccDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '👀', title: insight.visibilityTitle, desc: insight.visibilityDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🔴', title: insight.feedbackTitle, desc: insight.feedbackDesc),
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
