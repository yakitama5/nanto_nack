import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $music;

/// musicパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MusicTranslationsExtension on BuildContext {
  $music.Translations get s => $music.AppLocale.ja.buildSync();

  $music.Translations get sq => $music.AppLocale.xx.buildSync();
}
