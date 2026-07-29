import 'package:flutter/material.dart';

/// スライドの配色。
abstract final class SlideColors {
  /// 背景
  static const background = Color(0xFFF7F5FC);

  /// 主色（NantoNack のブランド紫）
  static const primary = Color(0xFF6C4DE0);

  /// 強調色（注釈・パンチライン）
  static const accent = Color(0xFFE0483C);

  /// 本文
  static const text = Color(0xFF1B1726);

  /// 補足テキスト
  static const subText = Color(0xFF5A5470);
}

/// スライド用のテキストスタイル。
///
/// `AppTheme`（quiz_core）の TextTheme はアプリ画面向けのサイズなので、
/// 1920x1080 に投影するスライドでは小さすぎる。投影距離を考えて
/// **明示的にサイズを決め打ちする**。こうしておくとプレビュー画像と
/// 本番の見え方が一致する。
abstract final class SlideText {
  static const _family = 'packages/quiz_core/NotoSansJP';

  /// 大見出し（スライドのタイトル）
  static const title = TextStyle(
    fontFamily: _family,
    fontSize: 60,
    height: 1.35,
    fontWeight: FontWeight.bold,
    color: SlideColors.text,
  );

  /// 中見出し・パンチライン
  static const punch = TextStyle(
    fontFamily: _family,
    fontSize: 42,
    height: 1.4,
    fontWeight: FontWeight.bold,
    color: SlideColors.accent,
  );

  /// 強調した一文
  static const lead = TextStyle(
    fontFamily: _family,
    fontSize: 34,
    height: 1.4,
    fontWeight: FontWeight.bold,
    color: SlideColors.primary,
  );

  /// 箇条書き・通常の本文
  static const body = TextStyle(
    fontFamily: _family,
    fontSize: 30,
    height: 1.5,
    color: SlideColors.text,
  );

  /// 補足
  static const caption = TextStyle(
    fontFamily: _family,
    fontSize: 24,
    height: 1.7,
    color: SlideColors.subText,
  );
}
