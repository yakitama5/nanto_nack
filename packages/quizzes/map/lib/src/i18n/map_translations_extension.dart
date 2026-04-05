import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $map;

/// mapパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension MapTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $map.Translations get s => $map.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $map.Translations get sq => $map.AppLocale.xx.buildSync();
}
