import 'package:todo/src/domain/todo_item.dart';

/// TODOアプリのマスターデータカタログ
///
/// 全クイズ共通のタスクリストを提供する。
/// Quiz4のみ [forQuiz4] を true にすることで、
/// 『会議の準備』が isCompleted=true の初期状態になる。
class TodoCatalog {
  TodoCatalog._();

  /// 全クイズ共通のタスクリスト
  ///
  /// [forQuiz4] が true の場合、id='todo_meeting_prep' を isCompleted=true で返す。
  static List<TodoItem> items({required bool forQuiz4}) => [
        const TodoItem(
          id: 'todo_buy_milk',
          titleKey: 'buyMilk',
          order: 0,
        ),
        const TodoItem(
          id: 'todo_rent_payment',
          titleKey: 'rentPayment',
          order: 1,
        ),
        const TodoItem(
          id: 'todo_planning_doc',
          titleKey: 'planningDoc',
          order: 2,
        ),
        const TodoItem(
          id: 'todo_meeting_prep',
          titleKey: 'meetingPrep',
          order: 3,
          isCompleted: true,
        ),
        const TodoItem(
          id: 'todo_reply_email',
          titleKey: 'replyEmail',
          order: 4,
        ),
        const TodoItem(
          id: 'todo_book_dentist',
          titleKey: 'bookDentist',
          order: 5,
        ),
      ].map((item) {
        // Quiz4以外では todo_meeting_prep を未完了状態にする
        if (!forQuiz4 && item.id == 'todo_meeting_prep') {
          return item.copyWith(isCompleted: false);
        }
        return item;
      }).toList();
}
