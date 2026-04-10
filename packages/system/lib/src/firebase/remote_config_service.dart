import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/src/firebase/tip.dart';

/// RemoteConfig で管理するキー定数
abstract final class RemoteConfigKeys {
  /// 1日のプレイ回数制限
  static const dailyPlayLimit = 'daily_play_limit';

  /// 1日のプレイ回数制限が有効かどうか
  static const isPlayLimitEnabled = 'is_play_limit_enabled';

  /// 毎日表示する Tips（JSON 配列形式）
  static const dailyTips = 'daily_tips';

  /// メンテナンスモード（true の場合、メンテナンス画面へ強制遷移）
  static const maintenanceMode = 'maintenance_mode';

  /// メンテナンス画面に表示する説明文（未設定時はデフォルト文を表示）
  static const maintenanceMessage = 'maintenance_message';

  /// この数値未満のバージョンは、ストアへ強制誘導（例: "1.2.0"）
  static const forceUpdateVersion = 'force_update_version';

  /// この数値未満のバージョンは、任意アップデートの案内を表示
  static const latestUpdateVersion = 'latest_update_version';
}

/// [RemoteConfigKeys.dailyTips] のデフォルト値
const _defaultDailyTips = '''
[
  {
    "id": 1,
    "title": "Fの法則",
    "content": "ユーザーは画面を「F」の字になぞるようにスキャンします。重要な情報は左上に配置しましょう。"
  }
]
''';

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
      RemoteConfigKeys.dailyTips: _defaultDailyTips,
      RemoteConfigKeys.maintenanceMode: false,
      RemoteConfigKeys.maintenanceMessage: '',
      RemoteConfigKeys.forceUpdateVersion: '',
      RemoteConfigKeys.latestUpdateVersion: '',
    });
    await remoteConfig.fetchAndActivate();
  }

  /// 1日のプレイ回数制限を返す
  int get dailyPlayLimit =>
      FirebaseRemoteConfig.instance.getInt(RemoteConfigKeys.dailyPlayLimit);

  /// 1日のプレイ回数制限が有効かどうかを返す
  bool get isPlayLimitEnabled =>
      FirebaseRemoteConfig.instance.getBool(RemoteConfigKeys.isPlayLimitEnabled);

  /// メンテナンスモードかどうかを返す
  bool get maintenanceMode =>
      FirebaseRemoteConfig.instance.getBool(RemoteConfigKeys.maintenanceMode);

  /// メンテナンス画面に表示するメッセージを返す
  String get maintenanceMessage =>
      FirebaseRemoteConfig.instance.getString(RemoteConfigKeys.maintenanceMessage);

  /// 強制アップデートが必要な最低バージョン文字列を返す（未設定時は空文字）
  String get forceUpdateVersion =>
      FirebaseRemoteConfig.instance.getString(RemoteConfigKeys.forceUpdateVersion);

  /// 任意アップデートを促す最低バージョン文字列を返す（未設定時は空文字）
  String get latestUpdateVersion =>
      FirebaseRemoteConfig.instance.getString(RemoteConfigKeys.latestUpdateVersion);

  /// 毎日表示する Tips の一覧を返す
  ///
  /// JSON のパースに失敗した場合は空リストを返す。
  List<Tip> get dailyTips {
    final raw =
        FirebaseRemoteConfig.instance.getString(RemoteConfigKeys.dailyTips);
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => Tip.fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception {
      return [];
    }
  }
}

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  return const RemoteConfigService();
});
