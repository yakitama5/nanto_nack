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

/// [isPlayLimitReachedProvider] を watch して上限到達状態を返す拡張。
///
/// ローディング中は `true`（安全側）、エラー時は `false` を返す。
extension PlayLimitWidgetRefX on WidgetRef {
  bool get isPlayLimitReached => watch(isPlayLimitReachedProvider).when(
        data: (v) => v,
        loading: () => true,
        error: (_, __) => false,
      );
}
