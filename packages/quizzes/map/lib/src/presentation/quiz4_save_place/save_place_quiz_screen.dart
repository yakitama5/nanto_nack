import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../domain/map_catalog.dart';
import '../../domain/map_quiz_config.dart';
import '../../i18n/map_translations_extension.dart';
import '../map_app_screen.dart';
import 'save_place_quiz_notifier.dart';

/// Quiz 4「駅をお気に入りに追加しよう」
class SavePlaceQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const SavePlaceQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<SavePlaceQuizScreen> createState() =>
      _SavePlaceQuizScreenState();
}

class _SavePlaceQuizScreenState extends ConsumerState<SavePlaceQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(savePlaceQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savePlaceQuizProvider);
    final missionText = context.s.quiz4.missionText;
    final notifier = ref.read(savePlaceQuizProvider.notifier);

    return MapAppScreen(
      key: ValueKey(_retryCount),
      places: MapCatalog.places,
      selectedPlace: state.selectedPlace,
      locationShown: false,
      showSearchBar: false,
      showDirectionsButton: false,
      showFavoriteButton: true,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: MapQuizConfig.quiz4SavePlaceTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      onPlaceSelect: notifier.selectPlace,
      isFavorite: state.selectedPlace?.isFavorite ?? false,
      onFavoriteTap: notifier.tapFavorite,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MapQuizConfig.quiz4SavePlaceTimeLimitSeconds,
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
              isLimitReached: ref.watch(isPlayLimitReachedProvider).valueOrNull ?? false,
              insight: Builder(
                builder: (context) {
                  final insight = context.s.quiz4.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '⭐',
                        title: insight.starTitle,
                        desc: insight.starDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📋',
                        title: insight.savedTitle,
                        desc: insight.savedDesc,
                      ),
                      QuizInsightItem(
                        emoji: '🎨',
                        title: insight.colorTitle,
                        desc: insight.colorDesc,
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

