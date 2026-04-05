import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $payment;

/// paymentパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension PaymentTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $payment.Translations get s => $payment.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $payment.Translations get sq => $payment.AppLocale.xx.buildSync();
}
