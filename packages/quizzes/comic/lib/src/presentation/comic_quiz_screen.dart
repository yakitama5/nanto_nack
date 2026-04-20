import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../domain/comic_quiz_config.dart';
import '../i18n/comic_translations_extension.dart';
import 'comic_quiz_notifier.dart';
import 'comic_quiz_type.dart';
import 'manga_viewer.dart';

/// コミッククイズ画面
///
/// [type] によって4つのクイズ（ページ操作・拡大・メニュー・応援）を切り替える。
class ComicQuizScreen extends ConsumerStatefulWidget {
  const ComicQuizScreen({
    super.key,
    required this.type,
    this.onCompleted,
  });

  final ComicQuizType type;
  final VoidCallback? onCompleted;

  @override
  ConsumerState<ComicQuizScreen> createState() => _ComicQuizScreenState();
}

class _ComicQuizScreenState extends ConsumerState<ComicQuizScreen> {
  bool _showCutIn = true;

  // リトライ時に MangaViewer の内部状態（PageController 等）をリセットするキー
  int _viewerKey = 0;

  @override
  void initState() {
    super.initState();
  }

  String _missionText(BuildContext context) => switch (widget.type) {
        ComicQuizType.quiz1 => context.s.quiz1.mission,
        ComicQuizType.quiz2 => context.s.quiz2.mission,
        ComicQuizType.quiz3 => context.s.quiz3.mission,
        ComicQuizType.quiz4 => context.s.quiz4.mission,
      };

  Widget _buildInsight(BuildContext context) => switch (widget.type) {
        ComicQuizType.quiz1 => Builder(
            builder: (context) {
              final insight = context.s.quiz1.insight;
              return QuizInsightContent(
                title: insight.title,
                subtitle: insight.subtitle,
                items: [
                  QuizInsightItem(
                    emoji: '👆',
                    title: insight.step1Title,
                    desc: insight.step1Desc,
                  ),
                ],
              );
            },
          ),
        ComicQuizType.quiz2 => Builder(
            builder: (context) {
              final insight = context.s.quiz2.insight;
              return QuizInsightContent(
                title: insight.title,
                subtitle: insight.subtitle,
                items: [
                  QuizInsightItem(
                    emoji: '🤏',
                    title: insight.step1Title,
                    desc: insight.step1Desc,
                  ),
                ],
              );
            },
          ),
        ComicQuizType.quiz3 => Builder(
            builder: (context) {
              final insight = context.s.quiz3.insight;
              return QuizInsightContent(
                title: insight.title,
                subtitle: insight.subtitle,
                items: [
                  QuizInsightItem(
                    emoji: '☝️',
                    title: insight.step1Title,
                    desc: insight.step1Desc,
                  ),
                ],
              );
            },
          ),
        ComicQuizType.quiz4 => Builder(
            builder: (context) {
              final insight = context.s.quiz4.insight;
              return QuizInsightContent(
                title: insight.title,
                subtitle: insight.subtitle,
                items: [
                  QuizInsightItem(
                    emoji: '❤️',
                    title: insight.step1Title,
                    desc: insight.step1Desc,
                  ),
                ],
              );
            },
          ),
      };

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(comicQuizProvider(widget.type));
    final notifier = ref.read(comicQuizProvider(widget.type).notifier);
    final missionText = _missionText(context);

    return MangaViewerScaffold(
      key: ValueKey(_viewerKey),
      state: quizState.mangaApp,
      quizStatus: quizState.status,
      totalPages: ComicQuizConfig.totalPages,
      onPageChanged: notifier.goToPage,
      onScaleChanged: notifier.updateScale,
      onToggleMenu: notifier.toggleMenu,
      onIncrementLikes: notifier.incrementLikes,
      likeTarget: ComicQuizConfig.quiz4LikeTarget,
      overlays: [
        // フローティングミッションバブル（プレイ中のみ表示）
        if (quizState.status == QuizStatus.playing)
          FloatingMissionBubble(
            remainingSeconds: quizState.remainingSeconds,
            missionText: missionText,
            // comic カテゴリはヒント機能なし
            hintUsed: false,
            timeLimitSeconds: ComicQuizConfig.timeLimitSeconds,
            onGiveUp: () => notifier.giveUp(),
          ),
        // ミッションカットイン演出
        if (_showCutIn)
          MissionCutIn(
            missionText: missionText,
            timeLimitSeconds: ComicQuizConfig.timeLimitSeconds,
            onFinished: () {
              if (!mounted) return;
              setState(() => _showCutIn = false);
              ref.read(comicQuizProvider(widget.type).notifier).startQuiz();
            },
          ),
        // クイズ結果オーバーレイ
        if (quizState.status == QuizStatus.correct ||
            quizState.status == QuizStatus.incorrect ||
            quizState.status == QuizStatus.timeUp ||
            quizState.status == QuizStatus.giveUp)
          Positioned.fill(
            child: QuizResultOverlay(
              status: quizState.status,
              score: quizState.score,
              elapsedMs: quizState.elapsedMs,
              onRetry: () {
                setState(() {
                  _showCutIn = true;
                  _viewerKey++;
                });
                notifier.retry();
              },
              onNext: quizState.status == QuizStatus.correct
                  ? widget.onCompleted
                  : null,
              onBack: () => Navigator.of(context).pop(),
              isLimitReached: ref.isPlayLimitReached,
              insight: _buildInsight(context),
            ),
          ),
      ],
    );
  }
}
