import 'package:flutter/widgets.dart';

import '../../i18n/strings.g.dart' as $weather;

// ビルドのたびに生成されるのを防ぐためトップレベルでキャッシュ
final _s = $weather.AppLocale.ja.buildSync();
final _sq = $weather.AppLocale.xx.buildSync();

/// weatherパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension WeatherTranslationsExtension on BuildContext {
  $weather.Translations get s => _s;

  $weather.Translations get sq => _sq;
}
