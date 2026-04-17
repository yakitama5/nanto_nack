import 'package:quiz_core/quiz_core.dart';

import '../config/route_path_constants.dart';
import 'category.dart';

/// ステージの種類
enum GenericQuizStage {
  quiz1,
  quiz2,
  quiz3,
  quiz4;

  String label(Translations t, QuizCategory category) => switch (this) {
        quiz1 => switch (category) {
            QuizCategory.shopping => t.play.stageTitle.shopping_quiz1,
            QuizCategory.chat => t.play.stageTitle.chat_quiz1,
            QuizCategory.streaming => t.play.stageTitle.streaming_quiz1,
            QuizCategory.map => t.play.stageTitle.map_quiz1,
            QuizCategory.alarm => t.play.stageTitle.alarm_quiz1,
            QuizCategory.payment => t.play.stageTitle.payment_quiz1,
            QuizCategory.mail => t.play.stageTitle.mail_quiz1,
            QuizCategory.news => t.play.stageTitle.news_quiz1,
            QuizCategory.calendar => t.play.stageTitle.calendar_quiz1,
            QuizCategory.sns => t.play.stageTitle.sns_quiz1,
          },
        quiz2 => switch (category) {
            QuizCategory.shopping => t.play.stageTitle.shopping_quiz2,
            QuizCategory.chat => t.play.stageTitle.chat_quiz2,
            QuizCategory.streaming => t.play.stageTitle.streaming_quiz2,
            QuizCategory.map => t.play.stageTitle.map_quiz2,
            QuizCategory.alarm => t.play.stageTitle.alarm_quiz2,
            QuizCategory.payment => t.play.stageTitle.payment_quiz2,
            QuizCategory.mail => t.play.stageTitle.mail_quiz2,
            QuizCategory.news => t.play.stageTitle.news_quiz2,
            QuizCategory.calendar => t.play.stageTitle.calendar_quiz2,
            QuizCategory.sns => t.play.stageTitle.sns_quiz2,
          },
        quiz3 => switch (category) {
            QuizCategory.shopping => t.play.stageTitle.shopping_quiz3,
            QuizCategory.chat => t.play.stageTitle.chat_quiz3,
            QuizCategory.streaming => t.play.stageTitle.streaming_quiz3,
            QuizCategory.map => t.play.stageTitle.map_quiz3,
            QuizCategory.alarm => t.play.stageTitle.alarm_quiz3,
            QuizCategory.payment => t.play.stageTitle.payment_quiz3,
            QuizCategory.mail => t.play.stageTitle.mail_quiz3,
            QuizCategory.news => t.play.stageTitle.news_quiz3,
            QuizCategory.calendar => t.play.stageTitle.calendar_quiz3,
            QuizCategory.sns => t.play.stageTitle.sns_quiz3,
          },
        quiz4 => switch (category) {
            QuizCategory.shopping => t.play.stageTitle.shopping_quiz4,
            QuizCategory.chat => t.play.stageTitle.chat_quiz4,
            QuizCategory.streaming => t.play.stageTitle.streaming_quiz4,
            QuizCategory.map => t.play.stageTitle.map_quiz4,
            QuizCategory.alarm => t.play.stageTitle.alarm_quiz4,
            QuizCategory.payment => t.play.stageTitle.payment_quiz4,
            QuizCategory.mail => t.play.stageTitle.mail_quiz4,
            QuizCategory.news => t.play.stageTitle.news_quiz4,
            QuizCategory.calendar => t.play.stageTitle.calendar_quiz4,
            QuizCategory.sns => t.play.stageTitle.sns_quiz4,
          },
      };

  static GenericQuizStage fromId(String id) {
    if (id.endsWith('quiz1')) return GenericQuizStage.quiz1;
    if (id.endsWith('quiz2')) return GenericQuizStage.quiz2;
    if (id.endsWith('quiz3')) return GenericQuizStage.quiz3;
    if (id.endsWith('quiz4')) return GenericQuizStage.quiz4;
    throw ArgumentError('Unknown stage id: $id');
  }
}

/// ステージの定義（静的データ）
class Stage {
  const Stage({
    required this.id,
    required this.category,
    required this.routePath,
    required this.difficulty,
  });

  final String id;
  final QuizCategory category;
  final String routePath;

  /// 難易度 (1〜5)
  final int difficulty;
}

/// アプリで定義するステージ一覧
///
/// EnumのゲッターはDartのconst contextで使えないため、finalで定義し、不変コンテナでラップしている。
final List<Stage> kAllStages = List.unmodifiable([
  // ショッピングカテゴリー
  const Stage(
    id: 'shopping_quiz1',
    category: QuizCategory.shopping,
    routePath: kShoppingWaterPath,
    difficulty: 1,
  ),
  const Stage(
    id: 'shopping_quiz2',
    category: QuizCategory.shopping,
    routePath: kShoppingCheckoutPath,
    difficulty: 2,
  ),
  const Stage(
    id: 'shopping_quiz3',
    category: QuizCategory.shopping,
    routePath: kShoppingReorderPath,
    difficulty: 3,
  ),
  const Stage(
    id: 'shopping_quiz4',
    category: QuizCategory.shopping,
    routePath: kShoppingCartPath,
    difficulty: 5,
  ),
  // チャットカテゴリー
  const Stage(
    id: 'chat_quiz1',
    category: QuizCategory.chat,
    routePath: kChatQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'chat_quiz2',
    category: QuizCategory.chat,
    routePath: kChatQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'chat_quiz3',
    category: QuizCategory.chat,
    routePath: kChatQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'chat_quiz4',
    category: QuizCategory.chat,
    routePath: kChatQuiz4Path,
    difficulty: 4,
  ),
  // 動画カテゴリー
  const Stage(
    id: 'streaming_quiz1',
    category: QuizCategory.streaming,
    routePath: kStreamingQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'streaming_quiz2',
    category: QuizCategory.streaming,
    routePath: kStreamingQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'streaming_quiz3',
    category: QuizCategory.streaming,
    routePath: kStreamingQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'streaming_quiz4',
    category: QuizCategory.streaming,
    routePath: kStreamingQuiz4Path,
    difficulty: 4,
  ),
  // マップカテゴリー
  const Stage(
    id: 'map_quiz1',
    category: QuizCategory.map,
    routePath: kMapQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'map_quiz2',
    category: QuizCategory.map,
    routePath: kMapQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'map_quiz3',
    category: QuizCategory.map,
    routePath: kMapQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'map_quiz4',
    category: QuizCategory.map,
    routePath: kMapQuiz4Path,
    difficulty: 4,
  ),
  // アラームカテゴリー
  const Stage(
    id: 'alarm_quiz1',
    category: QuizCategory.alarm,
    routePath: kAlarmQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'alarm_quiz2',
    category: QuizCategory.alarm,
    routePath: kAlarmQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'alarm_quiz3',
    category: QuizCategory.alarm,
    routePath: kAlarmQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'alarm_quiz4',
    category: QuizCategory.alarm,
    routePath: kAlarmQuiz4Path,
    difficulty: 4,
  ),
  // 決済カテゴリー
  const Stage(
    id: 'payment_quiz1',
    category: QuizCategory.payment,
    routePath: kPaymentQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'payment_quiz2',
    category: QuizCategory.payment,
    routePath: kPaymentQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'payment_quiz3',
    category: QuizCategory.payment,
    routePath: kPaymentQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'payment_quiz4',
    category: QuizCategory.payment,
    routePath: kPaymentQuiz4Path,
    difficulty: 4,
  ),
  // メールカテゴリー
  const Stage(
    id: 'mail_quiz1',
    category: QuizCategory.mail,
    routePath: kMailQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'mail_quiz2',
    category: QuizCategory.mail,
    routePath: kMailQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'mail_quiz3',
    category: QuizCategory.mail,
    routePath: kMailQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'mail_quiz4',
    category: QuizCategory.mail,
    routePath: kMailQuiz4Path,
    difficulty: 4,
  ),
  // ニュースカテゴリー
  const Stage(
    id: 'news_quiz1',
    category: QuizCategory.news,
    routePath: kNewsQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'news_quiz2',
    category: QuizCategory.news,
    routePath: kNewsQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'news_quiz3',
    category: QuizCategory.news,
    routePath: kNewsQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'news_quiz4',
    category: QuizCategory.news,
    routePath: kNewsQuiz4Path,
    difficulty: 4,
  ),
  // カレンダーカテゴリー
  const Stage(
    id: 'calendar_quiz1',
    category: QuizCategory.calendar,
    routePath: kCalendarQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'calendar_quiz2',
    category: QuizCategory.calendar,
    routePath: kCalendarQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'calendar_quiz3',
    category: QuizCategory.calendar,
    routePath: kCalendarQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'calendar_quiz4',
    category: QuizCategory.calendar,
    routePath: kCalendarQuiz4Path,
    difficulty: 4,
  ),
  // SNSカテゴリー
  const Stage(
    id: 'sns_quiz1',
    category: QuizCategory.sns,
    routePath: kSnsQuiz1Path,
    difficulty: 1,
  ),
  const Stage(
    id: 'sns_quiz2',
    category: QuizCategory.sns,
    routePath: kSnsQuiz2Path,
    difficulty: 2,
  ),
  const Stage(
    id: 'sns_quiz3',
    category: QuizCategory.sns,
    routePath: kSnsQuiz3Path,
    difficulty: 3,
  ),
  const Stage(
    id: 'sns_quiz4',
    category: QuizCategory.sns,
    routePath: kSnsQuiz4Path,
    difficulty: 4,
  ),
]);

/// ステージにクリア状況を付加したクラス
class StageWithStatus {
  const StageWithStatus({
    required this.stage,
    required this.status,
    this.clearTimeMs,
    this.score,
  });

  final Stage stage;
  final StageStatus status;
  final int? clearTimeMs;
  final int? score;

  StageWithStatus copyWith({
    Stage? stage,
    StageStatus? status,
    int? clearTimeMs,
    int? score,
  }) {
    return StageWithStatus(
      stage: stage ?? this.stage,
      status: status ?? this.status,
      clearTimeMs: clearTimeMs ?? this.clearTimeMs,
      score: score ?? this.score,
    );
  }
}
