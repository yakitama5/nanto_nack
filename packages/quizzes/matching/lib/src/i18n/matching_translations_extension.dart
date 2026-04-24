import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $matching;

// buildSync() は呼び出しコストが低いが、同一ロケールは毎回同じ結果を返すため
// トップレベル final で遅延初期化＆キャッシュし、2 回目以降の再生成を避ける
final _jaTranslations = $matching.AppLocale.ja.buildSync();
final _xxTranslations = $matching.AppLocale.xx.buildSync();

/// マッチングパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MatchingTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $matching.Translations get s => _jaTranslations;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $matching.Translations get sq => _xxTranslations;
}
