import 'package:matching/src/domain/entities/match_profile.dart';

/// マッチングアプリのマスターデータカタログ
///
/// name と bio は英語で定義し、UI表示時に CustomLanguageEncoder でカスタム言語に変換する。
/// 画像には picsum.photos のシードURLを使用する。
class MatchingCatalog {
  MatchingCatalog._();

  /// 全クイズ共通のプロフィールリスト（5件）
  static List<MatchProfile> profiles() => const [
        MatchProfile(
          id: 'matching_1',
          name: 'Yuki',
          age: 24,
          bio: 'I love hiking and coffee. Looking for someone to explore the city with.',
          imageUrls: [
            'https://picsum.photos/seed/match1a/400/600',
            'https://picsum.photos/seed/match1b/400/600',
          ],
        ),
        MatchProfile(
          id: 'matching_2',
          name: 'Hana',
          age: 27,
          bio: 'Passionate about cooking and traveling. Dog lover who enjoys lazy Sundays.',
          imageUrls: [
            'https://picsum.photos/seed/match2a/400/600',
            'https://picsum.photos/seed/match2b/400/600',
            'https://picsum.photos/seed/match2c/400/600',
          ],
        ),
        MatchProfile(
          id: 'matching_3',
          name: 'Sora',
          age: 23,
          bio: 'Music is my life. Guitarist looking for someone who shares the same rhythm.',
          imageUrls: [
            'https://picsum.photos/seed/match3a/400/600',
            'https://picsum.photos/seed/match3b/400/600',
          ],
        ),
        MatchProfile(
          id: 'matching_4',
          name: 'Mia',
          age: 26,
          bio: 'Artist by day, reader by night. Searching for deep conversations and good vibes.',
          imageUrls: [
            'https://picsum.photos/seed/match4a/400/600',
            'https://picsum.photos/seed/match4b/400/600',
            'https://picsum.photos/seed/match4c/400/600',
          ],
        ),
        MatchProfile(
          id: 'matching_5',
          name: 'Rin',
          age: 25,
          bio: 'Fitness enthusiast and yoga teacher. Let us build something beautiful together.',
          imageUrls: [
            'https://picsum.photos/seed/match5a/400/600',
            'https://picsum.photos/seed/match5b/400/600',
          ],
        ),
      ];
}
