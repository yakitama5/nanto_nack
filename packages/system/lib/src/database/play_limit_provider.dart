import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/src/database/user_status_repository_provider.dart';
import 'package:system/src/firebase/remote_config_service.dart';

/// 本日のプレイ回数制限に達しているかどうかを返す Provider。
///
/// autoDispose により、誰も watch しない間は破棄されるため、
/// クイズ終了後にリザルト画面が表示されるタイミングで常に最新値を取得できる。
final isPlayLimitReachedProvider = FutureProvider.autoDispose<bool>((ref) async {
  final remoteConfig = ref.read(remoteConfigServiceProvider);
  if (!remoteConfig.isPlayLimitEnabled) return false;
  final repo = ref.read(userStatusRepositoryProvider);
  return repo.isLimitReached(dailyLimit: remoteConfig.dailyPlayLimit);
});
