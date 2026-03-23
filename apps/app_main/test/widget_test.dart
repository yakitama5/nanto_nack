import 'package:app_main/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  testWidgets('NantoNack app smoke test', (WidgetTester tester) async {
    // main.dart と同様に TranslationProvider でラップする。
    // NantoNackApp 内で TranslationProvider.of(context) を呼ぶため、
    // ProviderScope の外側に TranslationProvider が必要。
    await tester.pumpWidget(
      TranslationProvider(
        child: const ProviderScope(child: NantoNackApp()),
      ),
    );
    // GoRouter の初期ナビゲーション処理を進める
    await tester.pump();

    expect(find.text('NantoNack'), findsWidgets);
  });
}
