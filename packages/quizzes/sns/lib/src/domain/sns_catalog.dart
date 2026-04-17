import 'entities/sns_post.dart';
import '../presentation/sns_quiz_type.dart';

/// SNSクイズのモックデータカタログ
///
/// domain層はFlutter・i18n依存不可のため、投稿テキストは固定値を使用する。
/// Presentation層の UnreadableText によりゲーム内では難読化されるため、
/// 固定テキスト（英語）でも支障ない。
abstract final class SnsCatalog {
  /// クイズタイプに応じた初期投稿リストを返す
  ///
  /// 現在は全クイズで同一のタイムラインを共有する設計。
  /// 各クイズは異なる操作（いいね・投稿・画像閲覧・検索）を同じタイムライン上で行う。
  // ignore: avoid_unused_parameters
  static List<SnsPost> initialPostsFor(SnsQuizType quizType) {
    // 全クイズタイプで同一の投稿リストを返す（意図的な設計）
    return _allPosts;
  }

  static const _allPosts = <SnsPost>[
    // Quiz1の猫写真投稿（いいね操作の対象）
    SnsPost(
      id: 'sns_quiz1_cat_post',
      userName: 'Nn Nyn',
      userId: '@nn_nyn',
      content: 'Ct pht tdy 🐱',
      imageUrl: 'cat',
      isLiked: false,
      avatarColor: 0xFF1DA1F2,
    ),
    SnsPost(
      id: 'sns_post_2',
      userName: 'Nn Wnk',
      userId: '@nn_wnk',
      content: 'Wlk rtnd 🐶',
      isLiked: false,
      avatarColor: 0xFF43A047,
    ),
    SnsPost(
      id: 'sns_post_3',
      userName: 'Nn Py',
      userId: '@nn_py',
      content: 'Py py! Enrgy 🐥',
      isLiked: false,
      avatarColor: 0xFFF9A825,
    ),
    SnsPost(
      id: 'sns_post_4',
      userName: 'Nn Us',
      userId: '@nn_us',
      content: 'Crrt tdy 🥕',
      isLiked: false,
      avatarColor: 0xFFE53935,
    ),
    SnsPost(
      id: 'sns_post_5',
      userName: 'Nn Hm',
      userId: '@nn_hm',
      content: 'Whl spng 🐹',
      isLiked: false,
      avatarColor: 0xFF8E24AA,
    ),
    SnsPost(
      id: 'sns_post_6',
      userName: 'Nn Km',
      userId: '@nn_km',
      content: 'Sn bth 🐢',
      isLiked: false,
      avatarColor: 0xFF00897B,
    ),
    SnsPost(
      id: 'sns_post_7',
      userName: 'Nn Sk',
      userId: '@nn_sk',
      content: 'Tnk cln 🐟',
      isLiked: false,
      avatarColor: 0xFF1565C0,
    ),
    SnsPost(
      id: 'sns_post_8',
      userName: 'Nn Sz',
      userId: '@nn_sz',
      content: 'Twt twt 🐦',
      isLiked: false,
      avatarColor: 0xFFD81B60,
    ),
    SnsPost(
      id: 'sns_post_9',
      userName: 'Nn Nk2',
      userId: '@nn_nk2',
      content: 'Np tm 😴',
      isLiked: false,
      avatarColor: 0xFF546E7A,
    ),
    SnsPost(
      id: 'sns_post_10',
      userName: 'Nn Km2',
      userId: '@nn_km2',
      content: 'Hny crv 🍯',
      isLiked: false,
      avatarColor: 0xFFBF360C,
    ),
  ];
}