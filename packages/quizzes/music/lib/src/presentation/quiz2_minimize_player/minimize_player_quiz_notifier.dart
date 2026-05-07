import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:system/system.dart';

import '../../application/quiz_minimize_player_use_case.dart';
import '../../domain/music_catalog.dart';
import '../../infrastructure/music_quiz_repository_provider.dart';
import 'minimize_player_quiz_state.dart';

final minimizePlayerQuizProvider = AutoDisposeNotifierProvider<
    MinimizePlayerQuizNotifier, MinimizePlayerQuizState>(
  MinimizePlayerQuizNotifier.new,
);

class MinimizePlayerQuizNotifier
    extends AutoDisposeNotifier<MinimizePlayerQuizState> {
  static const _quizId = 'music_quiz2';

  final _useCase = const QuizMinimizePlayerUseCase();
  AudioPlayer? _player;
  Timer? _timer;

  @override
  MinimizePlayerQuizState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _player?.dispose();
    });
    _initPlayer();
    return MinimizePlayerQuizState.initial();
  }

  void _initPlayer() {
    try {
      _player = AudioPlayer();
      _player!.setLoopMode(LoopMode.off);
      final source = ConcatenatingAudioSource(
        children: [
          AudioSource.asset(MusicCatalog.songs[0].audioAssetPath),
          AudioSource.asset(MusicCatalog.songs[1].audioAssetPath),
        ],
      );
      _player!.setAudioSource(source).then((_) {
        _player!.play();
      }).catchError((_) {});
    } catch (_) {}
  }

  void startQuiz() {
    if (state.status != QuizStatus.idle) return;
    state = MinimizePlayerQuizState.initial().copyWith(
      status: QuizStatus.playing,
      startedAt: clock.now(),
    );
    ref.read(analyticsServiceProvider).logQuizStarted(quizId: _quizId);
    _startTimer();
  }

  Future<void> nextSong() async {
    if (state.status != QuizStatus.playing) return;
    final nextIndex =
        (state.musicState.currentSongIndex + 1) % MusicCatalog.songs.length;
    await _player?.seekToNext();
    state = state.copyWith(
      musicState: state.musicState.copyWith(currentSongIndex: nextIndex),
    );
  }

  Future<void> previousSong() async {
    if (state.status != QuizStatus.playing) return;
    final prevIndex =
        (state.musicState.currentSongIndex - 1 + MusicCatalog.songs.length) %
        MusicCatalog.songs.length;
    await _player?.seekToPrevious();
    state = state.copyWith(
      musicState: state.musicState.copyWith(currentSongIndex: prevIndex),
    );
  }

  void togglePlayPause() {
    if (state.status != QuizStatus.playing) return;
    if (state.musicState.isPlaying) {
      _player?.pause();
    } else {
      _player?.play();
    }
    state = state.copyWith(
      musicState: state.musicState.copyWith(
        isPlaying: !state.musicState.isPlaying,
      ),
    );
  }

  Future<void> togglePlayerExpansion(bool expanded) async {
    if (state.status != QuizStatus.playing) return;

    final isClear = _useCase.isClear(isExpanded: expanded);

    if (isClear) {
      _timer?.cancel();
      final elapsed = state.startedAt != null
          ? clock.now().difference(state.startedAt!).inMilliseconds
          : 0;
      state = state.copyWith(
        musicState: state.musicState.copyWith(isPlayerExpanded: expanded),
        status: QuizStatus.correct,
        elapsedMs: elapsed,
      );
      unawaited(hapticFeedback.playSuccessFeedback());
      await _saveResult(isCleared: true, elapsedMs: elapsed);
    } else {
      state = state.copyWith(
        musicState: state.musicState.copyWith(isPlayerExpanded: expanded),
      );
    }
  }

  void cycleRepeatMode() {
    if (state.status != QuizStatus.playing) return;
    final nextMode = switch (state.musicState.repeatMode) {
      LoopMode.off => LoopMode.all,
      LoopMode.all => LoopMode.one,
      LoopMode.one => LoopMode.off,
    };
    _player?.setLoopMode(nextMode);
    state = state.copyWith(
      musicState: state.musicState.copyWith(repeatMode: nextMode),
    );
  }

  void updateLyricsSize(double size) {
    if (state.status != QuizStatus.playing) return;
    state = state.copyWith(
      musicState: state.musicState.copyWith(lyricsSheetSize: size),
    );
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
    } catch (error, stackTrace) {
      appLogger.e(
        'Failed to save giveUp result',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void retry() {
    _timer?.cancel();
    ref.read(analyticsServiceProvider).logQuizRetried(quizId: _quizId);
    _initPlayer();
    state = MinimizePlayerQuizState.initial();
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
    } catch (error, stackTrace) {
      appLogger.e(
        'Failed to save timeUp result',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _saveResult({
    required bool isCleared,
    required int elapsedMs,
  }) async {
    final repo = ref.read(musicQuizRepositoryProvider);
    await repo.saveResult(
      quizId: _quizId,
      isCleared: isCleared,
      clearTimeMs: isCleared ? elapsedMs : null,
      score: isCleared ? state.score : 0,
      failureCount: state.failureCount,
    );
    if (isCleared) {
      unawaited(
        ref.read(analyticsServiceProvider).logQuizCompleted(
              quizId: _quizId,
              score: state.score,
              failureCount: state.failureCount,
              clearTimeMs: elapsedMs,
            ),
      );
    }
  }
}
