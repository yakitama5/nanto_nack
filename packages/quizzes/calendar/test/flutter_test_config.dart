import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';

// ゴールデンテストのCI/プラットフォーム別寛容設定。
// OS間のフォントレンダリング差異によるCI誤検知を防ぐため、2%の寛容設定。
// CI環境（CI=true）ではプラットフォーム固有ゴールデンをスキップし、CI goldens のみで検証する。
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
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
