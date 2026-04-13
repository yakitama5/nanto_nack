import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/map_catalog.dart';
import '../../domain/map_quiz_config.dart';
import '../../i18n/map_translations_extension.dart';
import '../map_app_screen.dart';
import 'show_location_quiz_notifier.dart';

/// Quiz 1「現在地を表示してください」
class ShowLocationQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const ShowLocationQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<ShowLocationQuizScreen> createState() =>
      _ShowLocationQuizScreenState();
}

class _ShowLocationQuizScreenState
    extends ConsumerState<ShowLocationQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(showLocationQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(showLocationQuizProvider);
    final missionText = context.s.quiz1.missionText;

    return MapAppScreen(
      key: ValueKey(_retryCount),
      places: MapCatalog.places,
      selectedPlace: null,
      locationShown: state.locationShown,
      showSearchBar: true,
      showDirectionsButton: false,
      showFavoriteButton: false,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MapQuizConfig.quiz1ShowLocationTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: () => ref.read(showLocationQuizProvider.notifier).giveUp(),
      highlightLocationButton: false,
      onLocationTap: () =>
          ref.read(showLocationQuizProvider.notifier).tapLocation(),
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MapQuizConfig.quiz1ShowLocationTimeLimitSeconds,
            onFinished: () => setState(() => _showCutIn = false),
          ),
        if (state.status == QuizStatus.correct ||
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
                  _retryCount++;
                });
                ref.read(showLocationQuizProvider.notifier).retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _ShowLocationInsight(),
            ),
          ),
      ],
    );
  }
}

class _ShowLocationInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz1.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '📍',
          title: insight.locationTitle,
          desc: insight.locationDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🧭',
          title: insight.compassTitle,
          desc: insight.compassDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '🤏',
          title: insight.zoomTitle,
          desc: insight.zoomDesc,
        ),
      ],
    );
  }
}

class _InsightHeader extends StatelessWidget {
  const _InsightHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.lightbulb, color: Color(0xFFFFD814), size: 20),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).extension<MapAppTheme>()!.subTextColor,
              ),
        ),
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
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .extension<MapAppTheme>()!
                          .subTextColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
