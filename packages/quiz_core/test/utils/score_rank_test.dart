import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_core/quiz_core.dart';

void main() {
  group('ScoreRank', () {
    group('fromScore', () {
      test('900点以上は S ランク', () {
        expect(ScoreRank.fromScore(900), ScoreRank.s);
        expect(ScoreRank.fromScore(1000), ScoreRank.s);
        expect(ScoreRank.fromScore(999), ScoreRank.s);
      });

      test('700〜899点は A ランク', () {
        expect(ScoreRank.fromScore(700), ScoreRank.a);
        expect(ScoreRank.fromScore(899), ScoreRank.a);
        expect(ScoreRank.fromScore(750), ScoreRank.a);
      });

      test('500〜699点は B ランク', () {
        expect(ScoreRank.fromScore(500), ScoreRank.b);
        expect(ScoreRank.fromScore(699), ScoreRank.b);
        expect(ScoreRank.fromScore(600), ScoreRank.b);
      });

      test('499点以下は C ランク', () {
        expect(ScoreRank.fromScore(499), ScoreRank.c);
        expect(ScoreRank.fromScore(0), ScoreRank.c);
        expect(ScoreRank.fromScore(100), ScoreRank.c);
      });
    });

    group('label', () {
      test('各ランクのラベルが大文字で返る', () {
        expect(ScoreRank.s.label, 'S');
        expect(ScoreRank.a.label, 'A');
        expect(ScoreRank.b.label, 'B');
        expect(ScoreRank.c.label, 'C');
      });
    });
  });
}
