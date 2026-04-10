import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';

import '../../domain/map_catalog.dart';
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
  static const _timeLimitSeconds = 60;
  bool _showCutIn = true;

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
      places: MapCatalog.places,
      selectedPlace: state.selectedPlace,
      locationShown: false,
      showSearchBar: false,
      showDirectionsButton: false,
      showFavoriteButton: false,
      quizStatus: state.status,
      remainingSeconds: state.remainingSeconds,
      timeLimitSeconds: _timeLimitSeconds,
      missionText: missionText,
      onGiveUp: notifier.giveUp,
      onPlaceSelect: notifier.selectPlace,
      overlays: [
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: _timeLimitSeconds,
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
                setState(() => _showCutIn = true);
                notifier.retry();
              },
              onNext: state.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              insight: _ShowSchoolInfoInsight(),
            ),
          ),
      ],
    );
  }
}

class _ShowSchoolInfoInsight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final insight = context.s.quiz2.insight;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InsightHeader(title: insight.title, subtitle: insight.subtitle),
        const SizedBox(height: 12),
        _InsightItem(
          emoji: '🏫',
          title: insight.iconTitle,
          desc: insight.iconDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '👆',
          title: insight.tapTitle,
          desc: insight.tapDesc,
        ),
        const SizedBox(height: 10),
        _InsightItem(
          emoji: '📋',
          title: insight.infoTitle,
          desc: insight.infoDesc,
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
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.grey.shade600),
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
