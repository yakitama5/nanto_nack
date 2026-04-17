import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';

// Golden テストの CI/プラットフォーム間差異を吸収する設定。
// OS 間のフォントレンダリング差異による CI の誤検知を防ぐため、
// 2% の許容値を設定する。
// CI 環境（CI=true）ではプラットフォーム固有の Golden をスキップし、
// CI Golden のみを検証する。
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final ciValue =
      Platform.environment['CI']?.toLowerCase().trim() ?? '';
  final isCI = ciValue == 'true' || ciValue == '1' || ciValue == 'yes';

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
