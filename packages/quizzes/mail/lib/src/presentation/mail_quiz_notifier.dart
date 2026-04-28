import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mail/src/application/quiz_archive_mail_use_case.dart';
import 'package:mail/src/application/quiz_empty_trash_use_case.dart';
import 'package:mail/src/application/quiz_search_use_case.dart';
import 'package:mail/src/application/quiz_select_delete_use_case.dart';
import 'package:mail/src/domain/entities/mail.dart';
import 'package:mail/src/domain/entities/mail_folder.dart';
import 'package:mail/src/domain/mail_catalog.dart';
import 'package:mail/src/domain/mail_quiz_config.dart';
import 'package:mail/src/infrastructure/mail_quiz_repository_provider.dart';
import 'package:mail/src/presentation/mail_quiz_state.dart';
import 'package:mail/src/presentation/mail_quiz_type.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

/// メールクイズの統合 Provider。
///
/// [MailQuizType] を family 引数に渡すことで Quiz1〜4 のどれかを指定する。
/// ```dart
/// ref.watch(mailQuizProvider(MailQuizType.archive))
/// ref.read(mailQuizProvider(MailQuizType.archive).notifier).archiveMail(id)
/// ```
final mailQuizProvider = NotifierProvider.autoDispose
    .family<MailQuizNotifier, MailQuizState, MailQuizType>(
  MailQuizNotifier.new,
);

/// メールクイズ共通の Notifier。
///
/// Quiz1〜4 のすべての挙動を1つにまとめ、クイズ種別 ([arg]) によって
/// 使用する初期データとクリア条件を切り替える。
/// 共通の `startQuiz` / `giveUp` / `retry` / `_saveResult` はそのまま共有する。
class MailQuizNotifier
    extends AutoDisposeFamilyNotifier<MailQuizState, MailQuizType> {
  final _archiveUseCase = const QuizArchiveMailUseCase();
  final _emptyTrashUseCase = const QuizEmptyTrashUseCase();
  final _selectDeleteUseCase = const QuizSelectDeleteUseCase();
  final _searchUseCase = const QuizSearchUseCase();

  Timer? _timer;

  /// クイズ種別に対応する永続化ID
  String get _quizId => switch (arg) {
        MailQuizType.archive => 'mail_quiz1',
        MailQuizType.emptyTrash => 'mail_quiz2',
        MailQuizType.selectDelete => 'mail_quiz3',
        MailQuizType.search => 'mail_quiz4',
      };

  /// クイズ種別に対応する初期メールリスト
  List<Mail> get _initialMails => switch (arg) {
        MailQuizType.archive => MailCatalog.quiz1Mails(),
        MailQuizType.emptyTrash => MailCatalog.quiz2Mails(),
        MailQuizType.selectDelete => MailCatalog.quiz3Mails(),
        MailQuizType.search => MailCatalog.quiz4Mails(),
      };

  @override
  MailQuizState build(MailQuizType arg) {
    ref.onDispose(() => _timer?.cancel());
    return MailQuizState.initial(initialMails: _initialMails);
  }

  // ─────────────────────────────────────────────
  // 共通アクション
  // ─────────────────────────────────────────────

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = state.copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
      remainingSeconds: MailQuizConfig.timeLimitSeconds,
      mailApp: state.mailApp.copyWith(
        mails: _initialMails,
        selectedMailIds: {},
        searchQuery: '',
      ),
      isSearching: false,
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> giveUp() async {
    if (state.status != QuizStatus.playing) return;
    _timer?.cancel();
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.giveUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[MailQuizNotifier] giveUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    if (state.status == QuizStatus.playing) return;
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    state = MailQuizState.initial(initialMails: _initialMails);
  }

  // ─────────────────────────────────────────────
  // Quiz1: アーカイブ
  // ─────────────────────────────────────────────

  /// 指定IDのメールをアーカイブし、クリア判定を行う
  Future<void> archiveMail(String id) async {
    if (state.status != QuizStatus.playing) return;

    final updatedMails = state.mailApp.mails.map((m) {
      return m.id == id ? m.copyWith(folder: MailFolder.archive) : m;
    }).toList();

    final isClear = _archiveUseCase.isClear(archivedMailId: id);
    await _applyResult(isClear: isClear, updatedMails: updatedMails);
  }

  // ─────────────────────────────────────────────
  // Quiz2: ゴミ箱を空にする
  // ─────────────────────────────────────────────

  /// フォルダを切り替える
  void changeFolder(MailFolder folder) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(currentFolder: folder),
    );
  }

  /// ゴミ箱を空にしてクリア判定を行う
  Future<void> emptyTrash() async {
    if (state.status != QuizStatus.playing) return;

    final updatedMails =
        state.mailApp.mails.where((m) => m.folder != MailFolder.trash).toList();

    final isClear = _emptyTrashUseCase.isClear(mails: updatedMails);
    await _applyResult(isClear: isClear, updatedMails: updatedMails);
  }

  // ─────────────────────────────────────────────
  // Quiz3: 選択して削除
  // ─────────────────────────────────────────────

  /// 長押し・タップでメールの選択/選択解除を切り替える
  void toggleSelection(String id) {
    if (state.status != QuizStatus.playing) return;
    final current = Set<String>.from(state.mailApp.selectedMailIds);
    if (current.contains(id)) {
      current.remove(id);
    } else {
      current.add(id);
    }
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(selectedMailIds: current),
    );
  }

  /// 選択モードを解除する
  void clearSelection() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(selectedMailIds: {}),
    );
  }

  /// 選択されたメールをゴミ箱へ移動し、クリア判定を行う
  Future<void> moveToTrash() async {
    if (state.status != QuizStatus.playing) return;

    final selectedCount = state.mailApp.selectedMailIds.length;
    final isClear = _selectDeleteUseCase.isClear(selectedCount: selectedCount);

    final selectedIds = Set<String>.from(state.mailApp.selectedMailIds);
    final updatedMails = state.mailApp.mails.map((m) {
      return selectedIds.contains(m.id)
          ? m.copyWith(folder: MailFolder.trash)
          : m;
    }).toList();

    final elapsed = _elapsed;
    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
      mailApp: state.mailApp.copyWith(
        mails: updatedMails,
        selectedMailIds: {},
      ),
    );

    if (isClear) {
      _timer?.cancel();
      // autoDispose により dispose 後に ref.read すると例外になるため、
      // 永続化処理を先に完了させてから haptic を再生する
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } catch (error, stackTrace) {
        appLogger.e(
          '[MailQuizNotifier] moveToTrash: _saveResult failed',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        await hapticFeedback.playSuccessFeedback();
      }
    }
  }

  // ─────────────────────────────────────────────
  // Quiz4: 検索
  // ─────────────────────────────────────────────

  /// ヒントを使用する（Quiz4のみ）
  ///
  /// FloatingMissionBubble 内のヒントボタンから呼ばれる。
  /// 使用後は [MailQuizState.hintUsed] が true になり、
  /// BodyのHintCardが表示される。
  void useHint() {
    if (state.status != QuizStatus.playing) return;
    if (state.hintUsed) return;
    state = state.copyWith(hintUsed: true);
  }

  /// 検索バーをタップして入力モードへ移行する
  void openSearch() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(isSearching: true);
  }

  /// 検索クエリを更新する
  void updateQuery(String query) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      mailApp: state.mailApp.copyWith(searchQuery: query),
    );
  }

  /// 検索を実行してクリア判定を行う
  Future<void> submitSearch() async {
    if (state.status != QuizStatus.playing) return;
    final query = state.mailApp.searchQuery.trim();
    final isClear = _searchUseCase.isClear(query: query);
    final elapsed = _elapsed;

    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
    );

    if (isClear) {
      _timer?.cancel();
      // autoDispose により dispose 後に ref.read すると例外になるため、
      // 永続化処理を先に完了させてから haptic を再生する
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } catch (error, stackTrace) {
        appLogger.e(
          '[MailQuizNotifier] submitSearch: _saveResult failed',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        await hapticFeedback.playSuccessFeedback();
      }
    }
  }

  /// 検索をキャンセルする
  void cancelSearch() {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      isSearching: false,
      mailApp: state.mailApp.copyWith(searchQuery: ''),
    );
  }

  // ─────────────────────────────────────────────
  // Private helpers
  // ─────────────────────────────────────────────

  int get _elapsed => state.startedAt != null
      ? clock.now().difference(state.startedAt!).inMilliseconds
      : 0;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.status != QuizStatus.playing) {
        _timer?.cancel();
        return;
      }
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
    final elapsed = _elapsed;
    state = state.copyWith(status: QuizStatus.timeUp, elapsedMs: elapsed);
    unawaited(
      ref.read(analyticsServiceProvider).logQuizGivenUp(quizId: _quizId),
    );
    try {
      await _saveResult(isCleared: false, elapsedMs: elapsed);
    } catch (error, stackTrace) {
      appLogger.e(
        '[MailQuizNotifier] _onTimeUp: _saveResult failed',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// メールリスト更新 + クリア判定を一括適用するヘルパー（Quiz1・2共通）
  Future<void> _applyResult({
    required bool isClear,
    required List<Mail> updatedMails,
  }) async {
    final elapsed = _elapsed;
    state = state.copyWith(
      status: isClear ? QuizStatus.correct : state.status,
      elapsedMs: isClear ? elapsed : state.elapsedMs,
      mailApp: state.mailApp.copyWith(mails: updatedMails),
    );

    if (isClear) {
      _timer?.cancel();
      // autoDispose により dispose 後に ref.read すると例外になるため、
      // 永続化処理を先に完了させてから haptic を再生する
      try {
        await _saveResult(isCleared: true, elapsedMs: elapsed);
      } catch (error, stackTrace) {
        appLogger.e(
          '[MailQuizNotifier] _applyResult: _saveResult failed',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        await hapticFeedback.playSuccessFeedback();
      }
    }
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
    final repo = ref.read(mailQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
  }
}
