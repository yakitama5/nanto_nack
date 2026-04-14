import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  setUp(() {
    LocaleSettings.setLocale(AppLocale.ja);
  });

  Future<void> pumpWithNavigator(
    WidgetTester tester,
    QuizStatus status,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => QuizExitScope(
                    quizStatus: status,
                    child: const Scaffold(body: Text('クイズ画面')),
                  ),
                ),
              );
            },
            child: const Text('スタート'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('スタート'));
    await tester.pumpAndSettle();
    expect(find.text('クイズ画面'), findsOneWidget);
  }

  group('QuizExitScope', () {
    testWidgets('QuizStatus.playing のときはバック操作で確認ダイアログが表示される', (tester) async {
      await pumpWithNavigator(tester, QuizStatus.playing);

      await tester.binding.handlePopRoute();
      await tester.pump();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('QuizStatus.playing 以外のときはダイアログを表示せず即座に戻れる', (tester) async {
      await pumpWithNavigator(tester, QuizStatus.idle);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.text('スタート'), findsOneWidget);
    });
  });
}
