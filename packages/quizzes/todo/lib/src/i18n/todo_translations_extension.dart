import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $todo;

// buildSync() は呼び出しコストが低いが、同一ロケールは毎回同じ結果を返すため
// モジュールレベルでキャッシュしておき不要な再生成を避ける
final _jaTranslations = $todo.AppLocale.ja.buildSync();
final _enTranslations = $todo.AppLocale.en.buildSync();

/// TODOパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : 解説など読めるべき日本語テキスト（ja ロケール固定）
/// [se] : クイズUI用の英語テキスト（en ロケール）。UnreadableText に渡す素材として使用。
extension TodoTranslationsExtension on BuildContext {
  /// 解説など読める日本語テキスト
  $todo.Translations get s => _jaTranslations;

  /// クイズUI用英語テキスト（常に en ロケール）。UnreadableText の入力として使用する。
  $todo.Translations get se => _enTranslations;
}
