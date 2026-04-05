import 'package:quiz_core/quiz_core.dart';

/// Quiz 1「QRコードを表示する」の状態
class ShowQrQuizState extends QuizStateBase {
  /// コンストラクタ
  const ShowQrQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.qrShown,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory ShowQrQuizState.initial({int timeLimitSeconds = 30}) =>
      ShowQrQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        qrShown: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// QRコードが表示されたか
  final bool qrShown;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  ShowQrQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? qrShown,
    int? remainingSeconds,
  }) {
    return ShowQrQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      qrShown: qrShown ?? this.qrShown,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
