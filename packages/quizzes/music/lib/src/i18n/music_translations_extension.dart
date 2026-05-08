import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $music;

final _s = $music.AppLocale.ja.buildSync();
final _sq = $music.AppLocale.xx.buildSync();

/// musicパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MusicTranslationsExtension on BuildContext {
  $music.Translations get s => _s;

  $music.Translations get sq => _sq;
}
