import 'package:quiz_core/quiz_core.dart';

/// Quiz 3「送金する」の状態
class SendMoneyQuizState extends QuizStateBase {
  /// コンストラクタ
  const SendMoneyQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.showSendScreen,
    required this.selectedContactId,
    required this.amount,
    required this.moneySent,
    required this.remainingSeconds,
  });

  /// 初期状態を生成する
  factory SendMoneyQuizState.initial({int timeLimitSeconds = 60}) =>
      SendMoneyQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        showSendScreen: false,
        selectedContactId: null,
        amount: 0,
        moneySent: false,
        remainingSeconds: timeLimitSeconds,
      );

  /// 送金画面が表示されているか
  final bool showSendScreen;

  /// 選択中のコンタクトID
  final String? selectedContactId;

  /// 入力中の金額
  final int amount;

  /// 送金完了フラグ
  final bool moneySent;

  /// 残り時間（秒）
  final int remainingSeconds;

  /// 指定フィールドを差し替えた新インスタンスを返す
  SendMoneyQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    bool? showSendScreen,
    String? selectedContactId,
    bool clearSelectedContact = false,
    int? amount,
    bool? moneySent,
    int? remainingSeconds,
  }) {
    return SendMoneyQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      showSendScreen: showSendScreen ?? this.showSendScreen,
      selectedContactId: clearSelectedContact
          ? null
          : (selectedContactId ?? this.selectedContactId),
      amount: amount ?? this.amount,
      moneySent: moneySent ?? this.moneySent,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
