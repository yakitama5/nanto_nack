import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:streaming/src/domain/streaming_catalog.dart';
import 'package:streaming/src/presentation/streaming_player_screen.dart';

void main() {
  group('StreamingPlayerScreen golden tests', () {
    goldenTest(
      '動画プレイヤー画面の基本表示',
      fileName: 'streaming_player_screen',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'playing',
            child: SizedBox(
              width: 375,
              height: 667, // iPhone 8 size
              child: StreamingPlayerScreen(
                video: StreamingCatalog.featuredVideo,
                isPlaying: true,
                progressSeconds: 120,
                quizStatus: QuizStatus.playing,
                remainingSeconds: 30,
                timeLimitSeconds: 60,
                missionText: '動画を再生してください',
                onGiveUp: () {},
                overlays: const [],
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'paused_with_cc',
            child: SizedBox(
              width: 375,
              height: 667,
              child: StreamingPlayerScreen(
                video: StreamingCatalog.featuredVideo.copyWith(
                  subtitlesEnabled: true,
                ),
                isPlaying: false,
                progressSeconds: 300,
                quizStatus: QuizStatus.playing,
                remainingSeconds: 45,
                timeLimitSeconds: 60,
                missionText: '字幕をオンにしてください',
                onGiveUp: () {},
                overlays: const [],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
