import 'package:logger/logger.dart';

/// アプリ全体で共有する Logger インスタンス。
///
/// 出力フォーマット・ログレベルの変更はここだけで行う。
/// 各ファイルでは `import 'package:system/system.dart'` の後、
/// `appLogger.d(...)` のように使用すること。
final appLogger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
  ),
);
