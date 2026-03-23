import 'dart:async';

import 'package:alchemist/alchemist.dart';

// ゴールデンテストのCI/プラットフォーム差異許容率を設定する。
// OS間のフォントレンダリング差異によるCIの誤検知を防ぐため、2%の許容率を設定する。
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await AlchemistConfig.runWithConfig(
    config: const AlchemistConfig(
      ciGoldensConfig: CiGoldensConfig(
        diffThreshold: 0.02,
      ),
      platformGoldensConfig: PlatformGoldensConfig(
        diffThreshold: 0.02,
      ),
    ),
    run: testMain,
  );
}
