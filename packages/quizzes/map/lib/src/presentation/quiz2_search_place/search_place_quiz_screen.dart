import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/map_catalog.dart';
import '../../domain/map_quiz_config.dart';
import '../../i18n/map_translations_extension.dart';
import '../map_app_screen.dart';
import 'search_place_quiz_notifier.dart';

/// Quiz 2「登録した学校の情報を表示しよう」
class ShowSchoolInfoQuizScreen extends ConsumerStatefulWidget {
  /// コンストラクタ
  const ShowSchoolInfoQuizScreen({super.key, this.onCompleted});

  /// クイズ完了コールバック
  final VoidCallback? onCompleted;

  @override
  ConsumerState<ShowSchoolInfoQuizScreen> createState() =>
      _ShowSchoolInfoQuizScreenState();
}

class _ShowSchoolInfoQuizScreenState
    extends ConsumerState<ShowSchoolInfoQuizScreen> {
  bool _showCutIn = true;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(showSchoolInfoQuizProvider.notifier).startQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(showSchoolInfoQuizProvider);
    final missionText = context.s.quiz2.missionText;
    final notifier = ref.read(showSchoolInfoQuizProvider.notifier);

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
      timeLimitSeconds: MapQuizConfig.quiz2SearchPlaceTimeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      onPlaceSelect: notifier.selectPlace,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: MapQuizConfig.quiz2SearchPlaceTimeLimitSeconds,
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
                  final insight = context.s.quiz2.insight;
                  return QuizInsightContent(
                    title: insight.title,
                    subtitle: insight.subtitle,
                    items: [
                      QuizInsightItem(
                        emoji: '🏫',
                        title: insight.iconTitle,
                        desc: insight.iconDesc,
                      ),
                      QuizInsightItem(
                        emoji: '👆',
                        title: insight.tapTitle,
                        desc: insight.tapDesc,
                      ),
                      QuizInsightItem(
                        emoji: '📋',
                        title: insight.infoTitle,
                        desc: insight.infoDesc,
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

