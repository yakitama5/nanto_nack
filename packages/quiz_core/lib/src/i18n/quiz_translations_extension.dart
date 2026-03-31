import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart';

/// クイズ中に使用するダミー言語（xx ロケール）のトランスレーションを返す拡張。
///
/// クイズ画面内の UI テキストには [qt] を使用し、
/// ミッションテキストや結果オーバーレイなどのシステム UI には [t] を使用する。
extension QuizTranslationsExtension on BuildContext {
  Translations get qt => AppLocale.xx.translations;
}
