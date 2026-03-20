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
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'mobile (375px)',
            child: SizedBox(
              width: 375,
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
