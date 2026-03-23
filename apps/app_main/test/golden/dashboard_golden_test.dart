import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

// ─── ゴールデンテスト ─────────────────────────────────────────────────────────

void main() {
  group('SkeletonDashboard golden tests', () {
    goldenTest(
      'スケルトン（ローディング）表示のゴールデンテスト',
      fileName: 'skeleton_dashboard',
      // シマーアニメーションが無限ループするため pumpAndSettle はタイムアウトする。
      // 任意フレームで静止画像を撮影するため pump を1回のみ呼ぶ。
      pumpBeforeTest: (tester) async {
        await tester.pump(const Duration(milliseconds: 300));
      },
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'mobile (375px)',
            child: SizedBox(
              width: 375,
              height: 812,
              child: MaterialApp(
                theme: AppTheme.light(),
                home: const Scaffold(
                  body: SkeletonDashboard(),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'tablet (800px)',
            child: SizedBox(
              width: 800,
              height: 1024,
              child: MaterialApp(
                theme: AppTheme.light(),
                home: const Scaffold(
                  body: SkeletonDashboard(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });

  group('NantoHeatmap golden tests', () {
    final sampleActivities = List.generate(60, (i) {
      final date = DateTime(2026, 1, 1).add(Duration(days: i));
      // 数日だけアクティビティを設定
      final clearCount = switch (i % 7) {
        0 => 3,
        2 => 1,
        4 => 2,
        _ => 0,
      };
      return (date: date, clearCount: clearCount);
    });

    goldenTest(
      'ヒートマップのゴールデンテスト',
      fileName: 'nanto_heatmap',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'with activities',
            child: SizedBox(
              width: 360,
              height: 400,
              child: MaterialApp(
                theme: AppTheme.light(),
                home: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(16),
                    child: NantoHeatmap(activities: sampleActivities),
                  ),
                ),
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'empty',
            child: SizedBox(
              width: 360,
              height: 200,
              child: MaterialApp(
                theme: AppTheme.light(),
                home: const Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(16),
                    child: NantoHeatmap(activities: []),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}
