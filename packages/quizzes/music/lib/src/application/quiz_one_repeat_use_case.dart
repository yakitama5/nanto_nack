import 'package:just_audio/just_audio.dart';

class QuizOneRepeatUseCase {
  const QuizOneRepeatUseCase();

  bool isClear({required LoopMode repeatMode}) => repeatMode == LoopMode.one;
}
