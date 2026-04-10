import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:system/system.dart';

/// GoRouter の redirect と Riverpod を橋渡しする [ChangeNotifier]。
///
/// [systemConfigProvider] の状態変化を購読し、変化時に [notifyListeners] を呼ぶ。
/// GoRouter の [refreshListenable] に渡すことで、状態変化時にリダイレクト評価が
/// 再実行される。
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<SystemAppState>>(
      systemConfigProvider,
      (_, __) => notifyListeners(),
    );
  }

  final Ref _ref;

  /// GoRouter の redirect 関数。
  ///
  /// - メンテナンスモードの場合: `/maintenance` へリダイレクト
  /// - メンテナンス解除時: `/maintenance` から `/` へ自動復帰
  String? redirect(BuildContext context, GoRouterState state) {
    final systemState = _ref.read(systemConfigProvider);

    return systemState.when(
      data: (data) {
        final isMaintenance = data is SystemMaintenance;
        final isOnMaintenance = state.matchedLocation == '/maintenance';

        if (isMaintenance && !isOnMaintenance) {
          return '/maintenance';
        }
        if (!isMaintenance && isOnMaintenance) {
          return '/';
        }
        return null;
      },
      loading: () => null,
      error: (_, __) => null,
    );
  }
}

final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  return RouterNotifier(ref);
});
