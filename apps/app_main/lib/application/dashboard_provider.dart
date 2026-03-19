import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/dashboard/dashboard_state.dart';
import '../infrastructure/dashboard_repository_provider.dart';
import 'get_dashboard_data_use_case.dart';

/// ダッシュボード状態の Provider
final dashboardProvider =
    AsyncNotifierProvider<DashboardNotifier, DashboardState>(
  DashboardNotifier.new,
);

/// ダッシュボード画面の状態管理 Notifier
///
/// 初期化時に [GetDashboardDataUseCase] を実行し、
/// [AsyncValue] でロード中・エラー・データありの3状態を管理する。
class DashboardNotifier extends AsyncNotifier<DashboardState> {
  @override
  Future<DashboardState> build() async {
    final repository = ref.watch(dashboardRepositoryProvider);
    final useCase = GetDashboardDataUseCase(repository);
    return useCase.execute();
  }

  /// データを再取得する（プルトゥリフレッシュ等で使用）
  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
