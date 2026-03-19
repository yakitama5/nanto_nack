import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  group('StageCard', () {
    testWidgets('クリア済みステージは正しく表示される', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StageCard(
              stageNumber: 1,
              title: 'テストステージ',
              status: StageStatus.cleared,
            ),
          ),
        ),
      );

      expect(find.text('テストステージ'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('ロック済みステージはonTapが呼ばれない', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StageCard(
              stageNumber: 1,
              title: 'ロックされたステージ',
              status: StageStatus.locked,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(StageCard));
      expect(tapped, isFalse);
    });

    testWidgets('クリアタイムとスコアが表示される', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StageCard(
              stageNumber: 1,
              title: 'クリア済みステージ',
              status: StageStatus.cleared,
              clearTimeMs: 3500,
              score: 850,
            ),
          ),
        ),
      );

      expect(find.text('3.5秒'), findsOneWidget);
      expect(find.text('850点'), findsOneWidget);
    });
  });
}
