import 'package:flutter/widgets.dart';

import '../../../i18n/strings.g.dart' as $finance;

// ビルドのたびに生成されるのを防ぐためトップレベルでキャッシュ
final _s = $finance.AppLocale.ja.buildSync();
final _sq = $finance.AppLocale.xx.buildSync();

/// financeパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension FinanceTranslationsExtension on BuildContext {
  $finance.Translations get s => _s;

  $finance.Translations get sq => _sq;
}
