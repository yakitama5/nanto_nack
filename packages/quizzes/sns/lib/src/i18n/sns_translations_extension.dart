import 'package:flutter/widgets.dart';

import '../../i18n/strings.g.dart' as $sns;

final _cachedSnsJa = $sns.AppLocale.ja.buildSync();
final _cachedSnsXx = $sns.AppLocale.xx.buildSync();

/// snsパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension SnsTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $sns.Translations get s => _cachedSnsJa;

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $sns.Translations get sq => _cachedSnsXx;
}
