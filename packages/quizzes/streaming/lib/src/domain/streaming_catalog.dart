import 'package:flutter/material.dart';
import 'package:streaming/src/domain/entities/streaming_video.dart';

/// 動画アプリのマスターデータカタログ
class StreamingCatalog {
  StreamingCatalog._();

  /// 動画リスト
  static const List<StreamingVideo> videos = [
    StreamingVideo(
      id: 'v1',
      title: 'Amazing Nature Documentary 4K',
      channelName: 'NatureWorld',
      viewCount: 3200000,
      uploadedAgo: '2 days ago',
      durationSeconds: 1820,
      likeCount: 45000,
      colorSeed: 0,
    ),
    StreamingVideo(
      id: 'v2',
      title: 'Learn Programming in 10 Minutes',
      channelName: 'CodeMaster',
      viewCount: 980000,
      uploadedAgo: '1 week ago',
      durationSeconds: 632,
      likeCount: 21000,
      colorSeed: 1,
    ),
    StreamingVideo(
      id: 'v3',
      title: 'Top 10 Travel Destinations 2026',
      channelName: 'TravelVlog',
      viewCount: 1500000,
      uploadedAgo: '3 days ago',
      durationSeconds: 940,
      likeCount: 33000,
      colorSeed: 2,
    ),
    StreamingVideo(
      id: 'v4',
      title: 'Cooking Easy Pasta Recipe',
      channelName: 'ChefKitchen',
      viewCount: 560000,
      uploadedAgo: '5 days ago',
      durationSeconds: 487,
      likeCount: 12000,
      colorSeed: 3,
    ),
    StreamingVideo(
      id: 'v5',
      title: 'Morning Yoga for Beginners',
      channelName: 'YogaLife',
      viewCount: 2100000,
      uploadedAgo: '2 weeks ago',
      durationSeconds: 1200,
      likeCount: 67000,
      colorSeed: 4,
    ),
  ];

  /// サムネイル用カラーパレット
  static const List<Color> thumbnailColors = [
    Color(0xFF1565C0),
    Color(0xFF2E7D32),
    Color(0xFFC62828),
    Color(0xFFE65100),
    Color(0xFF6A1B9A),
  ];

  /// 動画サムネイルのアイコン一覧
  static const List<IconData> thumbnailIcons = [
    Icons.nature,
    Icons.code,
    Icons.flight,
    Icons.restaurant,
    Icons.self_improvement,
  ];

  /// 再生中の動画（Quiz 1〜3 の対象）
  static const StreamingVideo featuredVideo = StreamingVideo(
    id: 'v1',
    title: 'Amazing Nature Documentary 4K',
    channelName: 'NatureWorld',
    viewCount: 3200000,
    uploadedAgo: '2 days ago',
    durationSeconds: 1820,
    likeCount: 45000,
    colorSeed: 0,
  );
}
