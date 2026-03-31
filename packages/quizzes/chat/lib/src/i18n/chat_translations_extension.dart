import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $chat;

/// チャットパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension ChatTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $chat.Translations get s => $chat.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $chat.Translations get sq => $chat.AppLocale.xx.buildSync();
}
