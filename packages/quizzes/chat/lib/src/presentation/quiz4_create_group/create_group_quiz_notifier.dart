import 'dart:async';

import 'package:chat/src/application/quiz_create_group_use_case.dart';
import 'package:chat/src/domain/chat_catalog.dart';
import 'package:chat/src/domain/chat_quiz_config.dart';
import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:chat/src/infrastructure/chat_quiz_repository_provider.dart';
import 'package:chat/src/presentation/quiz4_create_group/create_group_quiz_state.dart';
import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

final createGroupQuizProvider = AutoDisposeNotifierProvider<
    CreateGroupQuizNotifier, CreateGroupQuizState>(
  CreateGroupQuizNotifier.new,
);

class CreateGroupQuizNotifier
    extends AutoDisposeNotifier<CreateGroupQuizState> {
  static const _quizId = 'chat_quiz4';

  final _useCase = const QuizCreateGroupUseCase();
  Timer? _timer;

  @override
  CreateGroupQuizState build() {
    ref.onDispose(() => _timer?.cancel());
    return CreateGroupQuizState.initial(timeLimitSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds);
  }

  void startQuiz() {
    _timer?.cancel();
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds,
      step: CreateGroupStep.contactList,
      selectedMembers: const [],
      groupCreated: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  void startGroupCreation() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(step: CreateGroupStep.selectMembers);
  }

  void toggleMember(ChatContact contact) {
    if (state.status != QuizStatus.playing) return;
    if (state.step != CreateGroupStep.selectMembers) return;

    final isSelected = state.selectedMembers.any((m) => m.id == contact.id);
    final newSelected = isSelected
        ? state.selectedMembers.where((m) => m.id != contact.id).toList()
        : [...state.selectedMembers, contact];
    state = state.copyWith(selectedMembers: newSelected);
  }

  void proceedToNameInput() {
    if (state.status != QuizStatus.playing) return;
    if (!_useCase.hasEnoughMembers(
      selectedCount: state.selectedMembers.length,
    )) return;
    state = state.copyWith(step: CreateGroupStep.nameInput);
  }

  void updateGroupName(String name) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(groupName: name);
  }

  void backToSelectMembers() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(step: CreateGroupStep.selectMembers);
  }

  Future<void> createGroup() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();

    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;

    final isClear = _useCase.isClear(groupCreated: true);
    state = state.copyWith(
      groupCreated: true,
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      await hapticFeedback.playSuccessFeedback();
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      _startTimer();
    }
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.giveUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = CreateGroupQuizState.initial(
      timeLimitSeconds: ChatQuizConfig.quiz4CreateGroupTimeLimitSeconds,
    ).copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = state.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        _onTimeUp();
      } else {
        state = state.copyWith(remainingSeconds: remaining);
      }
    });
  }

  Future<void> _onTimeUp() async {
    final elapsed = state.startedAt != null
        ? clock.now().difference(state.startedAt!).inMilliseconds
        : 0;
    state = state.copyWith(
      status: QuizStatus.timeUp,
      remainingSeconds: 0,
      elapsedMs: elapsed,
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (_) {}
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    if (isCleared) {
      await ref.read(analyticsServiceProvider).logQuizCompleted(
            quizId: _quizId,
            score: state.score,
            failureCount: state.failureCount,
            clearTimeMs: elapsedMs,
          );
    }
    final repo = ref.read(chatQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }

  List<ChatContact> get groupCandidates => ChatCatalog.groupCandidates;
}
