import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system/system.dart';

import 'package:app_main/application/get_dashboard_data_use_case.dart';
import 'package:app_main/domain/dashboard/daily_tip.dart';
import 'package:app_main/infrastructure/dashboard_repository.dart';

// ─── Fake リポジトリ ──────────────────────────────────────────────────────────

class FakeDashboardRepository implements DashboardRepository {
  FakeDashboardRepository({
    this.tips = const [],
    this.history = const [],
    this.todayPlayCount = 0,
    this.premiumFlag = false,
  });

  final List<DailyTip> tips;
  final List<QuizResult> history;
  final int todayPlayCount;
  final bool premiumFlag;

  @override
  List<DailyTip> fetchRawTips() => tips;

  @override
  Future<List<QuizResult>> getQuizHistorySince(DateTime since) async =>
      history;

  @override
  Future<int> getTodayPlayCount() async => todayPlayCount;

  @override
  Future<bool> isPremium() async => premiumFlag;
}

// ─── ヘルパー ─────────────────────────────────────────────────────────────────

/// テスト全体で使用する固定日時（2026-03-20 12:00）
final _fixedNow = DateTime(2026, 3, 20, 12, 0);

QuizResult _makeResult({
  String quizId = 'test',
  DateTime? lastPlayedAt,
  int score = 500,
}) =>
    QuizResult(
      quizId: quizId,
      isCleared: true,
      score: score,
      failureCount: 0,
      lastPlayedAt: lastPlayedAt,
    );

// ─── テスト ───────────────────────────────────────────────────────────────────

void main() {
  group('GetDashboardDataUseCase', () {
    group('Tips 日替わり抽選', () {
      test('同じ日付シードなら同じ Tips が選ばれる', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          const tips = [
            DailyTip(id: 'a', title: 'A', content: ''),
            DailyTip(id: 'b', title: 'B', content: ''),
            DailyTip(id: 'c', title: 'C', content: ''),
          ];
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(tips: tips),
          );

          final result1 = await useCase.execute();
          final result2 = await useCase.execute();

          expect(result1.dailyTip.id, result2.dailyTip.id);
        });
      });

      test('Tips が空のときデフォルト Tips を返す', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(tips: const []),
          );

          final result = await useCase.execute();

          expect(result.dailyTip.id, 'default');
        });
      });

      test('Tips が1件のときその Tips を返す', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          const tips = [DailyTip(id: 'only', title: 'Only', content: 'x')];
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(tips: tips),
          );

          final result = await useCase.execute();

          expect(result.dailyTip.id, 'only');
        });
      });
    });

    group('残りプレイ数', () {
      test('未課金・今日3回プレイ済みなら残り2回', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(todayPlayCount: 3, premiumFlag: false),
          );

          final result = await useCase.execute();

          expect(result.remainingPlayCount, 2);
        });
      });

      test('未課金・5回プレイ済みなら残り0回（マイナスにならない）', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(todayPlayCount: 5, premiumFlag: false),
          );

          final result = await useCase.execute();

          expect(result.remainingPlayCount, 0);
        });
      });

      test('課金済みなら残りプレイ数は null（無制限）', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(todayPlayCount: 3, premiumFlag: true),
          );

          final result = await useCase.execute();

          expect(result.remainingPlayCount, isNull);
        });
      });
    });

    group('連続プレイ日数（ストリーク）計算', () {
      test('プレイ履歴がなければストリーク 0', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(history: const []),
          );

          final result = await useCase.execute();

          expect(result.currentStreak, 0);
        });
      });

      test('今日だけプレイしていればストリーク 1', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(
              history: [_makeResult(lastPlayedAt: _fixedNow)],
            ),
          );

          final result = await useCase.execute();

          expect(result.currentStreak, 1);
        });
      });

      test('今日含む3日連続ならストリーク 3', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(
              history: [
                _makeResult(
                  quizId: 'q1',
                  lastPlayedAt: _fixedNow.subtract(const Duration(days: 2)),
                ),
                _makeResult(
                  quizId: 'q2',
                  lastPlayedAt: _fixedNow.subtract(const Duration(days: 1)),
                ),
                _makeResult(quizId: 'q3', lastPlayedAt: _fixedNow),
              ],
            ),
          );

          final result = await useCase.execute();

          expect(result.currentStreak, 3);
        });
      });

      test('今日を含まない場合（昨日まで連続）はストリーク 0', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(
              history: [
                _makeResult(
                  lastPlayedAt: _fixedNow.subtract(const Duration(days: 1)),
                ),
              ],
            ),
          );

          final result = await useCase.execute();

          // 今日のアクティビティがないのでストリークは 0
          expect(result.currentStreak, 0);
        });
      });
    });

    group('アクティビティ履歴', () {
      test('60日分のバケットを生成する', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(history: const []),
          );

          final result = await useCase.execute();

          expect(result.activityHistory.length, 60);
        });
      });

      test('プレイ履歴がある日の clearCount が正しく集計される', () async {
        await withClock(Clock.fixed(_fixedNow), () async {
          final useCase = GetDashboardDataUseCase(
            FakeDashboardRepository(
              history: [
                _makeResult(quizId: 'q1', lastPlayedAt: _fixedNow, score: 800),
                _makeResult(quizId: 'q2', lastPlayedAt: _fixedNow, score: 600),
              ],
            ),
          );

          final result = await useCase.execute();
          final todayActivity = result.activityHistory.last;

          expect(todayActivity.clearCount, 2);
          expect(todayActivity.totalScore, 1400);
        });
      });
    });
  });
}
