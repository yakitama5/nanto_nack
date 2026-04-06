import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// RemoteConfig で管理するキー定数
abstract final class RemoteConfigKeys {
  /// 1日のプレイ回数制限
  static const dailyPlayLimit = 'daily_play_limit';

  /// 1日のプレイ回数制限が有効かどうか
  static const isPlayLimitEnabled = 'is_play_limit_enabled';
}

/// Firebase Remote Config のラッパーサービス
class RemoteConfigService {
  const RemoteConfigService();

  /// RemoteConfig を初期化し、最新の設定を取得・反映する
  ///
  /// Firebase の初期化後、アプリ起動時に一度だけ呼び出すこと。
  static Future<void> initialize() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults({
      RemoteConfigKeys.dailyPlayLimit: 5,
      RemoteConfigKeys.isPlayLimitEnabled: true,
    });
    await remoteConfig.fetchAndActivate();
  }

  /// 1日のプレイ回数制限を返す
  int get dailyPlayLimit =>
      FirebaseRemoteConfig.instance.getInt(RemoteConfigKeys.dailyPlayLimit);

  /// 1日のプレイ回数制限が有効かどうかを返す
  bool get isPlayLimitEnabled =>
      FirebaseRemoteConfig.instance.getBool(RemoteConfigKeys.isPlayLimitEnabled);
}

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return const RemoteConfigService();
});
