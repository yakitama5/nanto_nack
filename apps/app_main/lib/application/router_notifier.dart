import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:system/system.dart';

/// GoRouter の redirect と Riverpod を橋渡しする [ChangeNotifier]。
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<SystemAppState>>(
      systemConfigProvider,
      (prev, next) {
        appLogger.d('[RouterNotifier] systemConfigProvider changed: '
            '${_describeState(prev)} → ${_describeState(next)}');
        notifyListeners();
      },
    );
  }

  final Ref _ref;

  String _describeState(AsyncValue<SystemAppState>? v) {
    if (v == null) return 'null';
    return v.when(
      data: (s) => 'data(${s.runtimeType})',
      loading: () => 'loading',
      error: (e, _) => 'error($e)',
    );
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final systemState = _ref.read(systemConfigProvider);
    appLogger.d('[RouterNotifier.redirect] location=${state.matchedLocation} '
        'systemState=${_describeState(systemState)}');

    return systemState.when(
      data: (data) {
        final isMaintenance = data is SystemMaintenance;
        final isOnMaintenance = state.matchedLocation == '/maintenance';

        if (isMaintenance && !isOnMaintenance) {
          appLogger.i('[RouterNotifier.redirect] → /maintenance');
          return '/maintenance';
        }
        if (!isMaintenance && isOnMaintenance) {
          appLogger.i('[RouterNotifier.redirect] → /');
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
