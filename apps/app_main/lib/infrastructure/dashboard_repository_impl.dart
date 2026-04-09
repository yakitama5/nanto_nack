import 'package:clock/clock.dart';
import 'package:system/system.dart';

import '../domain/dashboard/daily_tip.dart';
import 'dashboard_repository.dart';

/// [DashboardRepository] の具体実装
///
/// Remote Config（Tips）と Drift（プレイ履歴）を橋渡しする。
class DashboardRepositoryImpl implements DashboardRepository {
  const DashboardRepositoryImpl({
    required AppDatabase db,
    required UserStatusRepository userStatusRepository,
    required RemoteConfigService remoteConfigService,
  })  : _db = db,
        _userStatusRepository = userStatusRepository,
        _remoteConfigService = remoteConfigService;

  final AppDatabase _db;
  final UserStatusRepository _userStatusRepository;
  final RemoteConfigService _remoteConfigService;

  @override
  List<DailyTip> fetchRawTips() => _remoteConfigService.dailyTips
      .map(
        (e) => DailyTip(
          id: e.id.toString(),
          title: e.title,
          content: e.content,
        ),
      )
      .toList();

  @override
  int getDailyPlayLimit() => _remoteConfigService.dailyPlayLimit;

  @override
  bool isPlayLimitEnabled() => _remoteConfigService.isPlayLimitEnabled;

  @override
  Future<List<QuizResult>> getQuizHistorySince(DateTime since) =>
      _db.getQuizHistorySince(since);

  @override
  Future<int> getTodayPlayCount() async {
    final status = await _userStatusRepository.get();
    final today = clock.now();
    final lastReset = status.lastResetDate;

    final isToday = lastReset != null &&
        lastReset.year == today.year &&
        lastReset.month == today.month &&
        lastReset.day == today.day;

    return isToday ? status.dailyPlayCount : 0;
  }

  @override
  Future<bool> isPremium() async {
    final status = await _userStatusRepository.get();
    return status.isPremium;
  }
}
