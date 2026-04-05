import 'package:flutter/widgets.dart';
import '../../i18n/strings.g.dart' as $alarm;

/// alarmパッケージ専用の翻訳アクセサ拡張。
///
/// [s]  : ミッションテキスト・解説など読めるべき日本語テキスト（ja ロケール固定）
/// [sq] : クイズUI用のカスタム言語テキスト（xx ロケール）
extension AlarmTranslationsExtension on BuildContext {
  /// ミッションテキスト等の読める日本語テキスト
  $alarm.Translations get s => $alarm.AppLocale.ja.buildSync();

  /// クイズUI用カスタム言語テキスト（常に xx ロケール）
  $alarm.Translations get sq => $alarm.AppLocale.xx.buildSync();
}
