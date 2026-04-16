import 'package:app_main/config/route_path_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('News route path constants', () {
    test('absolute paths are composed correctly from segment constants', () {
      expect(kNewsListPath, '/play/$kNewsSegment');
      expect(kNewsQuiz1Path, '$kNewsListPath/$kNewsQuiz1Segment');
      expect(kNewsQuiz2Path, '$kNewsListPath/$kNewsQuiz2Segment');
      expect(kNewsQuiz3Path, '$kNewsListPath/$kNewsQuiz3Segment');
      expect(kNewsQuiz4Path, '$kNewsListPath/$kNewsQuiz4Segment');
    });

    test('segment constants have expected values', () {
      expect(kNewsSegment, 'news');
      expect(kNewsQuiz1Segment, 'quiz1');
      expect(kNewsQuiz2Segment, 'quiz2');
      expect(kNewsQuiz3Segment, 'quiz3');
      expect(kNewsQuiz4Segment, 'quiz4');
    });
  });
}
