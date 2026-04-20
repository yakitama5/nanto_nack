import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

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
              isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz1.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '📍',
                        title: insight.locationTitle,
                        desc: insight.locationDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🧭',
                        title: insight.compassTitle,
                        desc: insight.compassDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🤏',
                        title: insight.zoomTitle,
                        desc: insight.zoomDesc,
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

