import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/src/theme/app_theme.dart';

void main() {
  group('AppTheme', () {
    const expectedFontFamilyFallback = [
      'packages/quiz_core/NotoSansJP',
      'sans-serif',
      'Apple Color Emoji',
      'Segoe UI Emoji',
      'Noto Color Emoji',
    ];

    test('light() has correct fontFamilyFallback', () {
      final theme = AppTheme.light();
      expect(theme.textTheme.bodyLarge?.fontFamilyFallback, expectedFontFamilyFallback);
    });

    test('dark() has correct fontFamilyFallback', () {
      final theme = AppTheme.dark();
      expect(theme.textTheme.bodyLarge?.fontFamilyFallback, expectedFontFamilyFallback);
    });
  });
}
