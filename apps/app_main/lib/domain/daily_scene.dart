import 'package:clock/clock.dart';
import 'package:flutter/material.dart';

/// 「今日の1枚」に使うシーンの種類。
///
/// 時間帯と日付のシード値から決定する。
/// 将来的に天気APIと連携して動的に切り替えることを想定した設計。
enum DailyScene {
  sunriseMorning, // 朝焼け（5〜8時）
  sunnyDay,       // 晴天（日中）
  cloudyDay,      // 曇り（日中、日付で変化）
  rainyDay,       // 雨（日中、日付で変化）
  sunsetEvening,  // 夕焼け（17〜20時）
  nightSky,       // 夜空（20〜5時）
}

/// シーン毎の見た目設定
@immutable
class DailySceneTheme {
  const DailySceneTheme({
    required this.gradientColors,
    required this.icon,
    required this.greeting,
    required this.onSceneColor,
    required this.iconGlowColor,
  });

  final List<Color> gradientColors;
  final IconData icon;

  /// 挨拶テキスト
  final String greeting;

  /// グラデーション上のテキスト・アイコン色
  final Color onSceneColor;

  /// アイコン背景のグロー色
  final Color iconGlowColor;

  static DailySceneTheme of(DailyScene scene) {
    return switch (scene) {
      DailyScene.sunriseMorning => const DailySceneTheme(
          gradientColors: [
            Color(0xFFFF9966),
            Color(0xFFFFCBA4),
            Color(0xFFFFF0E0),
          ],
          icon: Icons.wb_twilight_rounded,
          greeting: 'おはようございます',
          onSceneColor: Color(0xFF5D2E00),
          iconGlowColor: Color(0x33FF7043),
        ),
      DailyScene.sunnyDay => const DailySceneTheme(
          gradientColors: [
            Color(0xFF4FC3F7),
            Color(0xFF81D4FA),
            Color(0xFFE1F5FE),
          ],
          icon: Icons.wb_sunny_rounded,
          greeting: '今日もいい天気',
          onSceneColor: Color(0xFF01579B),
          iconGlowColor: Color(0x33FFD54F),
        ),
      DailyScene.cloudyDay => const DailySceneTheme(
          gradientColors: [
            Color(0xFF90A4AE),
            Color(0xFFB0BEC5),
            Color(0xFFECEFF1),
          ],
          icon: Icons.cloud_rounded,
          greeting: '曇り空の一日',
          onSceneColor: Color(0xFF263238),
          iconGlowColor: Color(0x33546E7A),
        ),
      DailyScene.rainyDay => const DailySceneTheme(
          gradientColors: [
            Color(0xFF1565C0),
            Color(0xFF42A5F5),
            Color(0xFFBBDEFB),
          ],
          icon: Icons.water_drop_rounded,
          greeting: '雨の一日',
          onSceneColor: Color(0xFF0D47A1),
          iconGlowColor: Color(0x3342A5F5),
        ),
      DailyScene.sunsetEvening => const DailySceneTheme(
          gradientColors: [
            Color(0xFFBF360C),
            Color(0xFFFF7043),
            Color(0xFFFFCC80),
          ],
          icon: Icons.nights_stay_outlined,
          greeting: 'お疲れ様でした',
          onSceneColor: Color(0xFF4E1003),
          iconGlowColor: Color(0x33FF5722),
        ),
      DailyScene.nightSky => const DailySceneTheme(
          gradientColors: [
            Color(0xFF1A237E),
            Color(0xFF283593),
            Color(0xFF3949AB),
          ],
          icon: Icons.nights_stay_rounded,
          greeting: 'お疲れ様でした',
          onSceneColor: Color(0xFFE8EAF6),
          iconGlowColor: Color(0x337986CB),
        ),
    };
  }

  /// 現在時刻と日付から今日のシーンを決定する。
  ///
  /// - 時間帯で朝/昼/夕/夜を大枠で決定
  /// - 昼は日付のシードで晴れ/曇り/雨を決定
  static DailyScene resolveFromNow() {
    final now = clock.now();
    final hour = now.hour;
    final day = now.day;

    if (hour >= 5 && hour < 8) return DailyScene.sunriseMorning;
    if (hour >= 17 && hour < 20) return DailyScene.sunsetEvening;
    if (hour >= 20 || hour < 5) return DailyScene.nightSky;

    // 昼間（8〜17時）は日付のシードで切り替え
    if (day % 5 == 0) return DailyScene.rainyDay;
    if (day % 3 == 0) return DailyScene.cloudyDay;
    return DailyScene.sunnyDay;
  }
}
