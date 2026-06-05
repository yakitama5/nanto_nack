import 'package:flutter/widgets.dart';

import '../../../i18n/strings.g.dart' as $market;

// ビルドのたびに生成されるのを防ぐためトップレベルでキャッシュ
final _s = $market.AppLocale.ja.buildSync();
final _sq = $market.AppLocale.xx.buildSync();

/// marketパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MarketTranslationsExtension on BuildContext {
  $market.Translations get s => _s;

  $market.Translations get sq => _sq;
}
