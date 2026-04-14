import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';

// ゴールデンテストのCI/プラットフォーム間許容差を設定する。
// OS間のフォントレンダリング差異によるCI検知漏れを防ぐため、2%の許容差を設定する。
// CI環境（CI=true）ではプラットフォーム固有のゴールデン（linux/windows/mac）を
// スキップし、CI goldens のみを検証する。
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
