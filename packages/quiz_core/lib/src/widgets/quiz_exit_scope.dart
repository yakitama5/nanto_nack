import 'package:flutter/material.dart';
import 'package:quiz_core/i18n/strings.g.dart';
import 'package:quiz_core/src/entities/quiz_state.dart';

/// プレイ中にバック操作が行われた際に退出確認ダイアログを表示する PopScope ラッパー。
///
/// [quizStatus] が [QuizStatus.playing] の間はシステムバック・スワイプを補足し、
/// 確認ダイアログを経由してのみ画面を閉じられるようにする。
///
/// ### 標準的な使い方
/// ```dart
/// QuizExitScope(
///   quizStatus: quizStatus,
///   child: Scaffold(...),
/// )
/// ```
///
/// ### カスタム `canPop` が必要な場合
/// [showConfirmDialog] を直接呼び出して独自の [PopScope] と組み合わせる。
/// ```dart
/// PopScope(
///   canPop: customCondition,
///   onPopInvokedWithResult: (didPop, _) async {
///     if (didPop) return;
///     final confirmed = await QuizExitScope.showConfirmDialog(context);
///     if (confirmed == true && context.mounted) Navigator.of(context).pop();
///   },
///   child: child,
/// )
/// ```
class QuizExitScope extends StatelessWidget {
  const QuizExitScope({
    super.key,
    required this.quizStatus,
    required this.child,
  });

  final QuizStatus quizStatus;
  final Widget child;

  /// 退出確認ダイアログを表示し、ユーザーの選択（true: 終了 / false: 続ける）を返す。
  ///
  /// ダイアログテキストは [quiz_core] の翻訳リソースを使用する。
  static Future<bool?> showConfirmDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.quiz.exitDialogTitle),
        content: Text(t.quiz.exitDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.quiz.exitDialogContinue),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(t.quiz.exitDialogExit),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: quizStatus != QuizStatus.playing,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final confirmed = await showConfirmDialog(context);
        if (confirmed == true && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: child,
    );
  }
}
