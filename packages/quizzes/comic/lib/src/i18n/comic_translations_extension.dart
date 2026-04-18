import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $comic;

/// コミックパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
///        quiz_core の [t] / [qt] と対応する comic 版。
extension ComicTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $comic.Translations get s => $comic.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $comic.Translations get sq => $comic.AppLocale.xx.buildSync();
}
