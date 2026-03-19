import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  group('StageCard golden tests', () {
    goldenTest(
      'クリア済みステージのゴールデンテスト',
      fileName: 'stage_card_cleared',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'cleared',
            child: SizedBox(
              width: 400,
              child: StageCard(
                stageNumber: 1,
                title: '水を2つ買おう',
                status: StageStatus.cleared,
                clearTimeMs: 3500,
                score: 850,
              ),
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'ロック済みステージのゴールデンテスト',
      fileName: 'stage_card_locked',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'locked',
            child: SizedBox(
              width: 400,
              child: StageCard(
                stageNumber: 2,
                title: 'カートを確認しよう',
                status: StageStatus.locked,
              ),
            ),
          ),
        ],
      ),
    );

    goldenTest(
      '解放済みステージのゴールデンテスト',
      fileName: 'stage_card_available',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'available',
            child: SizedBox(
              width: 400,
              child: StageCard(
                stageNumber: 1,
                title: '水を2つ買おう',
                status: StageStatus.available,
              ),
            ),
          ),
        ],
      ),
    );
  });
}
