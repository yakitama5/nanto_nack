import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // テスト中はgoogle_fontsのネットワーク取得を無効化する。
  // AppThemeがGoogleFonts.notoSansJpTextTheme()を使用しているため、
  // 無効化しないとネットワーク接続エラーでテストが失敗する。
  GoogleFonts.config.allowRuntimeFetching = false;
  final isCI = Platform.environment['CI'] == 'true';
  await AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      ciGoldensConfig: const CiGoldensConfig(
        diffThreshold: 0.02,
      ),
      platformGoldensConfig: PlatformGoldensConfig(
        enabled: !isCI,
        diffThreshold: 0.02,
      ),
    ),
    run: testMain,
  );
}
