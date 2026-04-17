import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $news;

// buildSync() は呼び出しコストが低いが、同一ロケールは毎回同じ結果を返すため
// モジュールレベルでキャッシュしておき不要な再生成を避ける
final _jaTranslations = $news.AppLocale.ja.buildSync();
final _xxTranslations = $news.AppLocale.xx.buildSync();

/// ニュースパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension NewsTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $news.Translations get s => _jaTranslations;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $news.Translations get sq => _xxTranslations;
}
