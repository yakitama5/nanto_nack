import 'package:chat/src/domain/entities/chat_contact.dart';
import 'package:quiz_core/quiz_core.dart';

enum CreateGroupStep {
  /// 連絡先リスト（グループ作成ボタン表示）
  contactList,

  /// メンバー選択
  selectMembers,

  /// グループ名入力
  nameInput,
}

class CreateGroupQuizState extends QuizStateBase {
  const CreateGroupQuizState({
    required super.status,
    required super.failureCount,
    required super.elapsedMs,
    required super.startedAt,
    required this.remainingSeconds,
    required this.step,
    required this.selectedMembers,
    required this.groupCreated,
    this.groupName = '',
  });

  final int remainingSeconds;
  final CreateGroupStep step;
  final List<ChatContact> selectedMembers;
  final bool groupCreated;
  final String groupName;

  CreateGroupQuizState copyWith({
    QuizStatus? status,
    int? failureCount,
    int? elapsedMs,
    DateTime? startedAt,
    int? remainingSeconds,
    CreateGroupStep? step,
    List<ChatContact>? selectedMembers,
    bool? groupCreated,
    String? groupName,
  }) {
    return CreateGroupQuizState(
      status: status ?? this.status,
      failureCount: failureCount ?? this.failureCount,
      elapsedMs: elapsedMs ?? this.elapsedMs,
      startedAt: startedAt ?? this.startedAt,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      step: step ?? this.step,
      selectedMembers: selectedMembers ?? this.selectedMembers,
      groupCreated: groupCreated ?? this.groupCreated,
      groupName: groupName ?? this.groupName,
    );
  }

  factory CreateGroupQuizState.initial({int timeLimitSeconds = 120}) =>
      CreateGroupQuizState(
        status: QuizStatus.idle,
        failureCount: 0,
        elapsedMs: 0,
        startedAt: null,
        remainingSeconds: timeLimitSeconds,
        step: CreateGroupStep.contactList,
        selectedMembers: const [],
        groupCreated: false,
      );
}
