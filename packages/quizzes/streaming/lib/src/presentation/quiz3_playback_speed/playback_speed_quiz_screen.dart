import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/i18n/streaming_translations_extension.dart';
import 'package:streaming/src/presentation/quiz3_playback_speed/playback_speed_quiz_notifier.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

class PlaybackSpeedQuizScreen extends ConsumerStatefulWidget {
  const PlaybackSpeedQuizScreen({super.key, this.onCompleted});

  final VoidCallback? onCompleted;

  @override
  ConsumerState<PlaybackSpeedQuizScreen> createState() => _PlaybackSpeedQuizScreenState();
}

class _PlaybackSpeedQuizScreenState extends ConsumerState<PlaybackSpeedQuizScreen> {
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;
  bool _hintUsed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(playbackSpeedQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(playbackSpeedQuizProvider);
    final missionText = context.s.quiz3.missionText;

    return StreamingPlayerScreen(
      video: state.video,
      isPlaying: state.status == QuizStatus.playing,
      progressSeconds: 300,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(playbackSpeedQuizProvider.notifier).giveUp(),
      onMoreTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSettings(),
      onLongPressStart: () => ref.read(playbackSpeedQuizProvider.notifier).longPressStart(),
      onLongPressEnd: () => ref.read(playbackSpeedQuizProvider.notifier).longPressEnd(),
      onLikeTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapLike(),
      onDislikeTap: () =>
          ref.read(playbackSpeedQuizProvider.notifier).tapDislike(),
      onShareTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapShare(),
      onSaveTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSave(),
      onDownloadTap: () =>
          ref.read(playbackSpeedQuizProvider.notifier).tapDownload(),
      showShareButton: true,
      showSaveButton: true,
      showDownloadButton: true,
      showMoreButton: true,
      hintUsed: _hintUsed,
      onHintTap: () => setState(() => _hintUsed = true),
      highlightMore: _hintUsed && state.status == QuizStatus.playing && !state.isSettingsOpen,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        // 設定メニュー
        if (state.isSettingsOpen && !state.isSpeedListOpen)
          _OverlayMenu(
            onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            child: StreamingMoreMenu(
              video: state.video,
              onSubtitleTap: () {},
              onQualityTap: () {},
              onSpeedTap: () => ref.read(playbackSpeedQuizProvider.notifier).tapSpeedMenu(),
              onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            ),
          ),
        // 再生速度リスト
        if (state.isSpeedListOpen)
          _OverlayMenu(
            onDismiss: () => ref.read(playbackSpeedQuizProvider.notifier).dismissSettings(),
            child: StreamingSelectionList(
              title: context.s.common.playbackSpeed,
              items: const ['0.25x', '0.5x', '0.75x', 'Normal', '1.25x', '1.5x', '1.75x', '2x'],
              selectedItem: state.video.playbackSpeed == 1.0 ? 'Normal' : '${state.video.playbackSpeed}x',
              onSelected: (val) {
                final speed = val == 'Normal' ? 1.0 : double.tryParse(val.replaceAll('x', '')) ?? 1.0;
                ref.read(playbackSpeedQuizProvider.notifier).selectSpeed(speed);
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
                ref.read(playbackSpeedQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _PlaybackSpeedInsight(missionText: missionText),
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
              onTap: () {}, // メニュー内タップで閉じないように
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaybackSpeedInsight extends StatelessWidget {
  const _PlaybackSpeedInsight({required this.missionText});

  final String missionText;

  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz3.insight;
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
        _InsightItem(emoji: '👆', title: insight.gestureTitle, desc: insight.gestureDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '⚙️', title: insight.gearTitle, desc: insight.gearDesc),
        const SizedBox(height: 10),
        _InsightItem(emoji: '🔢', title: insight.speedTitle, desc: insight.speedDesc),
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
