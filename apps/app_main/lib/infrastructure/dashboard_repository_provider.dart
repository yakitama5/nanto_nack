import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:system/system.dart';

import 'dashboard_repository.dart';

/// DashboardRepository の Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(
    db: ref.watch(appDatabaseProvider),
    userStatusRepository: ref.watch(userStatusRepositoryProvider),
  );
});
