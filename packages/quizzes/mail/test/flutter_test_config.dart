import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';

// ゴールデンテストのCI/プラットフォーム間許容差を設定する。
// OS間のフォントレンダリング差異によるCI検知漏れを防ぐため、2%の許容差を設定する。
// CI環境（CI=true）ではプラットフォーム固有のゴールデン（linux/windows/mac）を
// スキップし、CI goldens のみを検証する。
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  // CI 環境変数は "true", "1", "yes" など複数の値が使われるため、
  // 小文字・トリム後に既知の真値と照合する
  final ciValue = (Platform.environment['CI'] ?? '').trim().toLowerCase();
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
