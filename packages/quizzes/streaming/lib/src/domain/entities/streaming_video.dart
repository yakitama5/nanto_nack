/// 動画エンティティ
class StreamingVideo {
  const StreamingVideo({
    required this.id,
    required this.title,
    required this.channelName,
    required this.viewCount,
    required this.uploadedAgo,
    required this.durationSeconds,
    this.likeCount = 0,
    this.isLiked = false,
    this.isSaved = false,
    this.subtitlesEnabled = false,
    this.colorSeed = 0,
  });

  final String id;

  /// 動画タイトル（英語・カスタム言語で表示）
  final String title;

  /// チャンネル名（英語・カスタム言語で表示）
  final String channelName;

  /// 再生回数
  final int viewCount;

  /// アップロード日（英語・カスタム言語で表示）
  final String uploadedAgo;

  final int durationSeconds;
  final int likeCount;
  final bool isLiked;
  final bool isSaved;
  final bool subtitlesEnabled;

  /// サムネイル色のシード（アセット画像なし → 色で代用）
  final int colorSeed;

  StreamingVideo copyWith({
    String? id,
    String? title,
    String? channelName,
    int? viewCount,
    String? uploadedAgo,
    int? durationSeconds,
    int? likeCount,
    bool? isLiked,
    bool? isSaved,
    bool? subtitlesEnabled,
    int? colorSeed,
  }) {
    return StreamingVideo(
      id: id ?? this.id,
      title: title ?? this.title,
      channelName: channelName ?? this.channelName,
      viewCount: viewCount ?? this.viewCount,
      uploadedAgo: uploadedAgo ?? this.uploadedAgo,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      subtitlesEnabled: subtitlesEnabled ?? this.subtitlesEnabled,
      colorSeed: colorSeed ?? this.colorSeed,
    );
  }
}
