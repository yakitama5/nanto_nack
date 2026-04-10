import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import '../firebase/remote_config_service.dart';
import '../logger/app_logger.dart';
import 'system_app_state.dart';

/// Firebase Remote Config を監視し、現在のアプリ状態を判定する Provider。
///
/// Remote Config の `onConfigUpdated` ストリームを購読し、
/// 値の変更をリアルタイムにアプリ状態へ反映する。
/// 優先順位: メンテナンス > 強制アップデート > 任意アップデート > 通常
final systemConfigProvider =
    AsyncNotifierProvider<SystemConfigNotifier, SystemAppState>(
  SystemConfigNotifier.new,
);

/// [systemConfigProvider] の Notifier
class SystemConfigNotifier extends AsyncNotifier<SystemAppState> {
  @override
  Future<SystemAppState> build() async {
    appLogger.d('[SystemConfigProvider] build() start');
    // Remote Config のリアルタイム更新を購読する
    final subscription =
        FirebaseRemoteConfig.instance.onConfigUpdated.listen((_) async {
      appLogger.d('[SystemConfigProvider] onConfigUpdated fired');
      try {
        await FirebaseRemoteConfig.instance.activate();
        state = AsyncData(await _determineState());
      } catch (error, stackTrace) {
        appLogger.e(
          '[SystemConfigProvider] onConfigUpdated error',
          error: error,
          stackTrace: stackTrace,
        );
        state = AsyncError(error, stackTrace);
      }
    });
    ref.onDispose(subscription.cancel);

    final result = await _determineState();
    appLogger.d('[SystemConfigProvider] build() done → ${result.runtimeType}');
    return result;
  }

  Future<SystemAppState> _determineState() async {
    appLogger.d('[SystemConfigProvider] _determineState() start');
    final remoteConfigService = ref.read(remoteConfigServiceProvider);

    // 1. メンテナンスモードを最優先で確認
    if (remoteConfigService.maintenanceMode) {
      appLogger.i('[SystemConfigProvider] → Maintenance');
      return SystemMaintenance(message: remoteConfigService.maintenanceMessage);
    }

    // 2. バージョン比較でアップデート要否を判定
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersionStr = packageInfo.version;

    try {
      final currentVersion = Version.parse(currentVersionStr);

      final forceVersionStr = remoteConfigService.forceUpdateVersion;
      if (forceVersionStr.isNotEmpty) {
        final forceVersion = Version.parse(forceVersionStr);
        if (currentVersion < forceVersion) {
          return const SystemForceUpdate();
        }
      }

      final latestVersionStr = remoteConfigService.latestUpdateVersion;
      if (latestVersionStr.isNotEmpty) {
        final latestVersion = Version.parse(latestVersionStr);
        if (currentVersion < latestVersion) {
          return const SystemOptionalUpdate();
        }
      }
    } on Exception {
      // バージョン文字列のパース失敗時は通常状態として扱う
    }

    appLogger.d('[SystemConfigProvider] → Normal');
    return const SystemNormal();
  }
}
