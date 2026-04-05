import 'package:flutter_test/flutter_test.dart';
import 'package:streaming/src/application/quiz_offline_save_use_case.dart';

void main() {
  const useCase = QuizOfflineSaveUseCase();

  group('QuizOfflineSaveUseCase', () {
    test('isClear returns true when quality is 1080p or 2160p and isDownloaded is true', () {
      expect(useCase.isClear(quality: '1080p', isDownloaded: true), isTrue);
      expect(useCase.isClear(quality: '2160p', isDownloaded: true), isTrue);
    });

    test('isClear returns false when quality is low', () {
      expect(useCase.isClear(quality: '720p', isDownloaded: true), isFalse);
      expect(useCase.isClear(quality: '360p', isDownloaded: true), isFalse);
    });

    test('isClear returns false when isDownloaded is false', () {
      expect(useCase.isClear(quality: '1080p', isDownloaded: false), isFalse);
    });
  });
}
