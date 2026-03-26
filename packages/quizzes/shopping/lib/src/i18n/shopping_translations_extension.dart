import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $shopping;

/// ショッピングパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
///        quiz_core の [t] / [qt] と対応する shopping 版。
extension ShoppingTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $shopping.Translations get s => $shopping.AppLocale.ja.translations;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $shopping.Translations get sq => $shopping.AppLocale.xx.translations;
}
