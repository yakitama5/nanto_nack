/// オフライン保存クイズのユースケース
class QuizOfflineSaveUseCase {
  const QuizOfflineSaveUseCase();

  /// クリア判定
  /// - [quality]: 現在の画質
  /// - [isDownloaded]: ダウンロードボタンが押されたか
  bool isClear({
    required String quality,
    required bool isDownloaded,
  }) {
    // 最高画質（2160p または 1080p）かつ ダウンロード済みであること
    return (quality == '2160p' || quality == '1080p') && isDownloaded;
  }
}
