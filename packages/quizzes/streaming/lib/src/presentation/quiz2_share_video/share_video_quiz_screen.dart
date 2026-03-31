import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz2_share_video/share_video_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class ShareVideoQuizScreen extends ConsumerStatefulWidget {
  const ShareVideoQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<ShareVideoQuizScreen> createState() =>
      _ShareVideoQuizScreenState();
}

class _ShareVideoQuizScreenState extends ConsumerState<ShareVideoQuizScreen> {
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(shareVideoQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shareVideoQuizProvider);
    final missionText = context.s.quiz2.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: true,
      progressSeconds: 30,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(shareVideoQuizProvider.notifier).giveUp(),
      onShareTap: () => ref.read(shareVideoQuizProvider.notifier).tapShare(),
      showShareButton: true,
      showSaveButton: false,
      showMoreButton: false,
      highlightShare: state.status == QuizStatus.playing,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.isShareSheetOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: () =>
                  ref.read(shareVideoQuizProvider.notifier).dismissShareSheet(),
              child: ColoredBox(
                color: Colors.black54,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: StreamingShareSheet(
                    onShare: () =>
                        ref.read(shareVideoQuizProvider.notifier).confirmShare(),
                    onDismiss: () => ref
                        .read(shareVideoQuizProvider.notifier)
                        .dismissShareSheet(),
                  ),
                ),
              ),
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
                ref.read(shareVideoQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _ShareVideoInsight(missionText: missionText),
            ),
          ),
      ],
    );
  }
}

class _ShareVideoInsight extends StatelessWidget {
  const _ShareVideoInsight({required this.missionText});

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
              ?.copyWith(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        _InsightItem(emoji: '📤', title: insight.shareTitle, desc: insight.shareDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '↔️', title: insight.actionTitle, desc: insight.actionDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '📋', title: insight.modalTitle, desc: insight.modalDesc),
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
