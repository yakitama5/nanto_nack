import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/map_catalog.dart';
import '../../domain/map_quiz_config.dart';
import '../../i18n/map_translations_extension.dart';
import '../map_app_screen.dart';
import 'start_navigation_quiz_notifier.dart';

/// Quiz 3「公園まで電車でルートを案内しよう」
class StartNavigationQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const StartNavigationQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<StartNavigationQuizScreen> createState() =>
      _StartNavigationQuizScreenState();
}

class _StartNavigationQuizScreenState
    extends ConsumerState<StartNavigationQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(startNavigationQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(startNavigationQuizProvider);
    final missionText = context.s.quiz3.missionText;
    final notifier = ref.read(startNavigationQuizProvider.notifier);

    return MapAppScreen(
      key: ValueKey(_retryCount),
      places: MapCatalog.places,
      selectedPlace: state.selectedPlace,
      locationShown: false,
      showSearchBar: false,
      showDirectionsButton: false,
      showFavoriteButton: false,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MapQuizConfig.quiz3StartNavigationTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      isNavigating: state.showDirections,
      onPlaceSelect: notifier.selectPlace,
      onTransportSelect: notifier.selectTransport,
      selectedTransportIndex: state.selectedTransportIndex,
      onNavigationStart: notifier.tapStartNavigation,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MapQuizConfig.quiz3StartNavigationTimeLimitSeconds,
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
                setState(() {
                  _showCutIn = true;
                  _retryCount++;
                });
                notifier.retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz3.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '📍',
                        title: insight.destinationTitle,
                        desc: insight.destinationDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🚆',
                        title: insight.transportTitle,
                        desc: insight.transportDesc,
                      ),
                      QuizInsightItem(
                        emoji: '▶',
                        title: insight.startTitle,
                        desc: insight.startDesc,
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

