import 'package:flutter/material.dart';

/// TODOアプリ（Microsoft To Do風）画面のカスタムカラーを ThemeExtension として定義する。
@immutable
class TodoAppTheme extends ThemeExtension<TodoAppTheme> {
  const TodoAppTheme({
    required this.brandBlue,
    required this.onBrandColor,
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.borderColor,
    required this.itemBackground,
    required this.completedHeaderBackground,
    required this.completionBackground,
    required this.uncompletionBackground,
    required this.importantBackground,
    required this.importantColor,
    required this.insightIconColor,
  });

  /// Microsoft To Do風ブランドブルー（AppBar・アクセント）
  final Color brandBlue;

  /// ブランドカラー背景上のテキスト/アイコン色
  final Color onBrandColor;

  /// Scaffold 背景色
  final Color scaffoldBackground;

  /// AppBar 背景色
  final Color appBarBackground;

  /// プライマリテキスト色
  final Color textPrimary;

  /// セカンダリテキスト（サブテキスト・完了済みタスク）色
  final Color textSecondary;

  /// 区切り線・ボーダー色
  final Color borderColor;

  /// タスクアイテム背景色
  final Color itemBackground;

  /// 完了済みヘッダー背景色
  final Color completedHeaderBackground;

  /// 左から右スワイプ（完了）時の背景色
  final Color completionBackground;

  /// 右から左スワイプ（未完了に戻す）時の背景色
  final Color uncompletionBackground;

  /// 重要ボタン背景色
  final Color importantBackground;

  /// 重要アイコン色（星の色）
  final Color importantColor;

  /// Insight 電球アイコン色
  final Color insightIconColor;

  /// ライトテーマ用デフォルト値
  static const light = TodoAppTheme(
    brandBlue: Color(0xFF2564CF),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFFFFFFFF),
    appBarBackground: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF757575),
    borderColor: Color(0xFFE0E0E0),
    itemBackground: Color(0xFFFFFFFF),
    completedHeaderBackground: Color(0xFFF5F5F5),
    completionBackground: Color(0xFF2564CF),
    uncompletionBackground: Color(0xFFE3F2FD),
    importantBackground: Color(0xFFFFF8E1),
    importantColor: Color(0xFFF9A825),
    insightIconColor: Color(0xFFF9A825),
  );

  /// ダークテーマ用デフォルト値
  static const dark = TodoAppTheme(
    brandBlue: Color(0xFF5C9CF5),
    onBrandColor: Colors.white,
    scaffoldBackground: Color(0xFF121212),
    appBarBackground: Color(0xFF1C1C1C),
    textPrimary: Color(0xFFE0E0E0),
    textSecondary: Color(0xFF9E9E9E),
    borderColor: Color(0xFF2C2C2C),
    itemBackground: Color(0xFF1E1E1E),
    completedHeaderBackground: Color(0xFF242424),
    completionBackground: Color(0xFF1565C0),
    uncompletionBackground: Color(0xFF0D2137),
    importantBackground: Color(0xFF3A2E00),
    importantColor: Color(0xFFFFD54F),
    insightIconColor: Color(0xFFFFD814),
  );

  @override
  TodoAppTheme copyWith({
    Color? brandBlue,
    Color? onBrandColor,
    Color? scaffoldBackground,
    Color? appBarBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? borderColor,
    Color? itemBackground,
    Color? completedHeaderBackground,
    Color? completionBackground,
    Color? uncompletionBackground,
    Color? importantBackground,
    Color? importantColor,
    Color? insightIconColor,
  }) {
    return TodoAppTheme(
      brandBlue: brandBlue ?? this.brandBlue,
      onBrandColor: onBrandColor ?? this.onBrandColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      borderColor: borderColor ?? this.borderColor,
      itemBackground: itemBackground ?? this.itemBackground,
      completedHeaderBackground:
          completedHeaderBackground ?? this.completedHeaderBackground,
      completionBackground: completionBackground ?? this.completionBackground,
      uncompletionBackground:
          uncompletionBackground ?? this.uncompletionBackground,
      importantBackground: importantBackground ?? this.importantBackground,
      importantColor: importantColor ?? this.importantColor,
      insightIconColor: insightIconColor ?? this.insightIconColor,
    );
  }

  @override
  TodoAppTheme lerp(covariant TodoAppTheme? other, double t) {
    if (other == null) return this;
    return TodoAppTheme(
      brandBlue: Color.lerp(brandBlue, other.brandBlue, t)!,
      onBrandColor: Color.lerp(onBrandColor, other.onBrandColor, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      itemBackground: Color.lerp(itemBackground, other.itemBackground, t)!,
      completedHeaderBackground: Color.lerp(
        completedHeaderBackground,
        other.completedHeaderBackground,
        t,
      )!,
      completionBackground:
          Color.lerp(completionBackground, other.completionBackground, t)!,
      uncompletionBackground:
          Color.lerp(uncompletionBackground, other.uncompletionBackground, t)!,
      importantBackground:
          Color.lerp(importantBackground, other.importantBackground, t)!,
      importantColor: Color.lerp(importantColor, other.importantColor, t)!,
      insightIconColor:
          Color.lerp(insightIconColor, other.insightIconColor, t)!,
    );
  }
}
