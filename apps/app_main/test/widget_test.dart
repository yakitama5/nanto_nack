import 'package:app_main/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NantoNack app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: NantoNackApp()),
    );

    expect(find.text('NantoNack'), findsWidgets);
  });
}
