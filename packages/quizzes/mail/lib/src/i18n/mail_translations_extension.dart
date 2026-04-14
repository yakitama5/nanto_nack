import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $mail;

/// メールパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MailTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $mail.Translations get s => $mail.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $mail.Translations get sq => $mail.AppLocale.xx.buildSync();
}
