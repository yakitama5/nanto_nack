import 'package:flutter/material.dart';

/// NantoNack 固有のカスタムカラーを ThemeExtension として定義する。
///
/// Material3 の ColorScheme に含まれない、アプリ独自の意味的カラーを管理する。
@immutable
class NantoNackThemeExtension
    extends ThemeExtension<NantoNackThemeExtension> {
  const NantoNackThemeExtension({
    required this.streakColor,
    required this.streakContainerColor,
    required this.playCountColor,
    required this.playCountContainerColor,
    required this.shoppingCategoryColor,
    required this.shoppingCategoryContainerColor,
    required this.chatCategoryColor,
    required this.chatCategoryContainerColor,
    required this.streamingCategoryColor,
    required this.streamingCategoryContainerColor,
    required this.mapCategoryColor,
    required this.mapCategoryContainerColor,
    required this.alarmCategoryColor,
    required this.alarmCategoryContainerColor,
    required this.paymentCategoryColor,
    required this.paymentCategoryContainerColor,
    required this.mailCategoryColor,
    required this.mailCategoryContainerColor,
    required this.newsCategoryColor,
    required this.newsCategoryContainerColor,
    required this.calendarCategoryColor,
    required this.calendarCategoryContainerColor,
  });

  /// 連続プレイ日数（ストリーク）のアクセントカラー
  final Color streakColor;

  /// ストリークカードの背景コンテナカラー
  final Color streakContainerColor;

  /// 残りプレイ数のアクセントカラー
  final Color playCountColor;

  /// プレイ数カードの背景コンテナカラー
  final Color playCountContainerColor;

  /// ショッピングカテゴリーのブランドカラー
  final Color shoppingCategoryColor;

  /// ショッピングカテゴリーカードの背景コンテナカラー
  final Color shoppingCategoryContainerColor;

  /// チャットカテゴリーのブランドカラー（LINE風グリーン）
  final Color chatCategoryColor;

  /// チャットカテゴリーカードの背景コンテナカラー
  final Color chatCategoryContainerColor;

  /// 動画カテゴリーのブランドカラー（YouTube風レッド）
  final Color streamingCategoryColor;

  /// 動画カテゴリーカードの背景コンテナカラー
  final Color streamingCategoryContainerColor;

  /// マップカテゴリーのブランドカラー（Google Maps風ティール）
  final Color mapCategoryColor;

  /// マップカテゴリーカードの背景コンテナカラー
  final Color mapCategoryContainerColor;

  /// アラームカテゴリーのブランドカラー（時計アプリ風オレンジ）
  final Color alarmCategoryColor;

  /// アラームカテゴリーカードの背景コンテナカラー
  final Color alarmCategoryContainerColor;

  /// 決済カテゴリーのブランドカラー（PayPay風パープル）
  final Color paymentCategoryColor;

  /// 決済カテゴリーカードの背景コンテナカラー
  final Color paymentCategoryContainerColor;

  /// メールカテゴリーのブランドカラー（Gmail風ローズ）
  final Color mailCategoryColor;

  /// メールカテゴリーカードの背景コンテナカラー
  final Color mailCategoryContainerColor;

  /// ニュースカテゴリーのブランドカラー（Yahoo!ニュース風レッド）
  final Color newsCategoryColor;

  /// ニュースカテゴリーカードの背景コンテナカラー
  final Color newsCategoryContainerColor;

  /// カレンダーカテゴリーのブランドカラー（Google Calendar風ブルー）
  final Color calendarCategoryColor;

  /// カレンダーカテゴリーカードの背景コンテナカラー
  final Color calendarCategoryContainerColor;

  /// ライトテーマ用デフォルト値
  static const light = NantoNackThemeExtension(
    streakColor: Color(0xFFE65100),
    streakContainerColor: Color(0xFFFFF3E0),
    playCountColor: Color(0xFF00695C),
    playCountContainerColor: Color(0xFFE0F2F1),
    shoppingCategoryColor: Color(0xFF1565C0),
    shoppingCategoryContainerColor: Color(0xFFE3F2FD),
    chatCategoryColor: Color(0xFF00897B),
    chatCategoryContainerColor: Color(0xFFE0F2F1),
    streamingCategoryColor: Color(0xFFC62828),
    streamingCategoryContainerColor: Color(0xFFFFEBEE),
    mapCategoryColor: Color(0xFF2E7D32),
    mapCategoryContainerColor: Color(0xFFE8F5E9),
    alarmCategoryColor: Color(0xFFF57F17),
    alarmCategoryContainerColor: Color(0xFFFFFDE7),
    paymentCategoryColor: Color(0xFF6A1B9A),
    paymentCategoryContainerColor: Color(0xFFF3E5F5),
    mailCategoryColor: Color(0xFFAD1457),
    mailCategoryContainerColor: Color(0xFFFCE4EC),
    newsCategoryColor: Color(0xFFBF360C),
    newsCategoryContainerColor: Color(0xFFFBE9E7),
    calendarCategoryColor: Color(0xFF00838F),
    calendarCategoryContainerColor: Color(0xFFE0F7FA),
  );

  /// マップのピンカラーリスト（colorSeed インデックスに対応）
  ///
  /// [MapPlace.colorSeed] の値をインデックスとして使用し、ピンカラーを取得する。
  /// 既存の意味的カラーをマッピングして再利用する。
  List<Color> get mapPinColors => [
        shoppingCategoryColor,
        mapCategoryColor,
        streamingCategoryColor,
        streakColor,
        paymentCategoryColor,
      ];

  /// ダークテーマ用デフォルト値
  static const dark = NantoNackThemeExtension(
    streakColor: Color(0xFFFFAB40),
    streakContainerColor: Color(0xFF3E2723),
    playCountColor: Color(0xFF4DB6AC),
    playCountContainerColor: Color(0xFF1B3A38),
    shoppingCategoryColor: Color(0xFF90CAF9),
    shoppingCategoryContainerColor: Color(0xFF0D2137),
    chatCategoryColor: Color(0xFF4DB6AC),
    chatCategoryContainerColor: Color(0xFF1B3A38),
    streamingCategoryColor: Color(0xFFEF9A9A),
    streamingCategoryContainerColor: Color(0xFF3B1212),
    mapCategoryColor: Color(0xFF81C784),
    mapCategoryContainerColor: Color(0xFF1B3A1E),
    alarmCategoryColor: Color(0xFFFFD54F),
    alarmCategoryContainerColor: Color(0xFF3A2E00),
    paymentCategoryColor: Color(0xFFCE93D8),
    paymentCategoryContainerColor: Color(0xFF2D0F3A),
    mailCategoryColor: Color(0xFFF48FB1),
    mailCategoryContainerColor: Color(0xFF3D0014),
    newsCategoryColor: Color(0xFFFF8A65),
    newsCategoryContainerColor: Color(0xFF3E1108),
    calendarCategoryColor: Color(0xFF4DD0E1),
    calendarCategoryContainerColor: Color(0xFF002A2E),
  );

  @override
  NantoNackThemeExtension copyWith({
    Color? streakColor,
    Color? streakContainerColor,
    Color? playCountColor,
    Color? playCountContainerColor,
    Color? shoppingCategoryColor,
    Color? shoppingCategoryContainerColor,
    Color? chatCategoryColor,
    Color? chatCategoryContainerColor,
    Color? streamingCategoryColor,
    Color? streamingCategoryContainerColor,
    Color? mapCategoryColor,
    Color? mapCategoryContainerColor,
    Color? alarmCategoryColor,
    Color? alarmCategoryContainerColor,
    Color? paymentCategoryColor,
    Color? paymentCategoryContainerColor,
    Color? mailCategoryColor,
    Color? mailCategoryContainerColor,
    Color? newsCategoryColor,
    Color? newsCategoryContainerColor,
    Color? calendarCategoryColor,
    Color? calendarCategoryContainerColor,
  }) {
    return NantoNackThemeExtension(
      streakColor: streakColor ?? this.streakColor,
      streakContainerColor: streakContainerColor ?? this.streakContainerColor,
      playCountColor: playCountColor ?? this.playCountColor,
      playCountContainerColor:
          playCountContainerColor ?? this.playCountContainerColor,
      shoppingCategoryColor:
          shoppingCategoryColor ?? this.shoppingCategoryColor,
      shoppingCategoryContainerColor:
          shoppingCategoryContainerColor ?? this.shoppingCategoryContainerColor,
      chatCategoryColor: chatCategoryColor ?? this.chatCategoryColor,
      chatCategoryContainerColor:
          chatCategoryContainerColor ?? this.chatCategoryContainerColor,
      streamingCategoryColor:
          streamingCategoryColor ?? this.streamingCategoryColor,
      streamingCategoryContainerColor: streamingCategoryContainerColor ??
          this.streamingCategoryContainerColor,
      mapCategoryColor: mapCategoryColor ?? this.mapCategoryColor,
      mapCategoryContainerColor:
          mapCategoryContainerColor ?? this.mapCategoryContainerColor,
      alarmCategoryColor: alarmCategoryColor ?? this.alarmCategoryColor,
      alarmCategoryContainerColor:
          alarmCategoryContainerColor ?? this.alarmCategoryContainerColor,
      paymentCategoryColor: paymentCategoryColor ?? this.paymentCategoryColor,
      paymentCategoryContainerColor:
          paymentCategoryContainerColor ?? this.paymentCategoryContainerColor,
      mailCategoryColor: mailCategoryColor ?? this.mailCategoryColor,
      mailCategoryContainerColor:
          mailCategoryContainerColor ?? this.mailCategoryContainerColor,
      newsCategoryColor: newsCategoryColor ?? this.newsCategoryColor,
      newsCategoryContainerColor:
          newsCategoryContainerColor ?? this.newsCategoryContainerColor,
      calendarCategoryColor:
          calendarCategoryColor ?? this.calendarCategoryColor,
      calendarCategoryContainerColor:
          calendarCategoryContainerColor ?? this.calendarCategoryContainerColor,
    );
  }

  @override
  NantoNackThemeExtension lerp(
    covariant NantoNackThemeExtension? other,
    double t,
  ) {
    if (other == null) return this;
    return NantoNackThemeExtension(
      streakColor: Color.lerp(streakColor, other.streakColor, t)!,
      streakContainerColor:
          Color.lerp(streakContainerColor, other.streakContainerColor, t)!,
      playCountColor: Color.lerp(playCountColor, other.playCountColor, t)!,
      playCountContainerColor: Color.lerp(
        playCountContainerColor,
        other.playCountContainerColor,
        t,
      )!,
      shoppingCategoryColor: Color.lerp(
        shoppingCategoryColor,
        other.shoppingCategoryColor,
        t,
      )!,
      shoppingCategoryContainerColor: Color.lerp(
        shoppingCategoryContainerColor,
        other.shoppingCategoryContainerColor,
        t,
      )!,
      chatCategoryColor:
          Color.lerp(chatCategoryColor, other.chatCategoryColor, t)!,
      chatCategoryContainerColor: Color.lerp(
        chatCategoryContainerColor,
        other.chatCategoryContainerColor,
        t,
      )!,
      streamingCategoryColor: Color.lerp(
        streamingCategoryColor,
        other.streamingCategoryColor,
        t,
      )!,
      streamingCategoryContainerColor: Color.lerp(
        streamingCategoryContainerColor,
        other.streamingCategoryContainerColor,
        t,
      )!,
      mapCategoryColor:
          Color.lerp(mapCategoryColor, other.mapCategoryColor, t)!,
      mapCategoryContainerColor: Color.lerp(
        mapCategoryContainerColor,
        other.mapCategoryContainerColor,
        t,
      )!,
      alarmCategoryColor:
          Color.lerp(alarmCategoryColor, other.alarmCategoryColor, t)!,
      alarmCategoryContainerColor: Color.lerp(
        alarmCategoryContainerColor,
        other.alarmCategoryContainerColor,
        t,
      )!,
      paymentCategoryColor:
          Color.lerp(paymentCategoryColor, other.paymentCategoryColor, t)!,
      paymentCategoryContainerColor: Color.lerp(
        paymentCategoryContainerColor,
        other.paymentCategoryContainerColor,
        t,
      )!,
      mailCategoryColor:
          Color.lerp(mailCategoryColor, other.mailCategoryColor, t)!,
      mailCategoryContainerColor: Color.lerp(
        mailCategoryContainerColor,
        other.mailCategoryContainerColor,
        t,
      )!,
      newsCategoryColor:
          Color.lerp(newsCategoryColor, other.newsCategoryColor, t)!,
      newsCategoryContainerColor: Color.lerp(
        newsCategoryContainerColor,
        other.newsCategoryContainerColor,
        t,
      )!,
      calendarCategoryColor:
          Color.lerp(calendarCategoryColor, other.calendarCategoryColor, t)!,
      calendarCategoryContainerColor: Color.lerp(
        calendarCategoryContainerColor,
        other.calendarCategoryContainerColor,
        t,
      )!,
    );
  }
}
