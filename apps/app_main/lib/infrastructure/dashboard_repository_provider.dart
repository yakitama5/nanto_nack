import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'dashboard_repository.dart';
import 'dashboard_repository_impl.dart';

/// DashboardRepository の Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepositoryImpl(
    db: ref.watch(appDatabaseProvider),
    userStatusRepository: ref.watch(userStatusRepositoryProvider),
    remoteConfigService: ref.watch(remoteConfigServiceProvider),
  );
});
