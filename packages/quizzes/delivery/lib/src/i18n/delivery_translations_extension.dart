import 'package:flutter/widgets.dart';

import '../../i18n/strings.g.dart' as $delivery;

// ビルドのたびに生成されるのを防ぐためトップレベルでキャッシュ
final _s = $delivery.AppLocale.ja.buildSync();
final _sq = $delivery.AppLocale.xx.buildSync();

/// deliveryパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension DeliveryTranslationsExtension on BuildContext {
  $delivery.Translations get s => _s;

  $delivery.Translations get sq => _sq;
}
