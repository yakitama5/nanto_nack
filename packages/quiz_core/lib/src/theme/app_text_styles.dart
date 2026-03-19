import 'package:flutter/material.dart';

/// NantoNack テキストスタイル定義
/// 「解読不能フォント」など、クイズで使う特殊スタイルを含む
abstract final class AppTextStyles {
  /// 解読不能フォント: 極細・高字間隔でほぼ読めない
  static TextStyle unreadable(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w100,
          letterSpacing: 8,
          color: Theme.of(context)
              .colorScheme
              .onSurface
              .withValues(alpha: 0.3),
          fontSize: 10,
        );
  }

  /// 極小フォント: タップ不可能に見えるほど小さい
  static TextStyle tiny(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 8,
          color: Theme.of(context)
              .colorScheme
              .onSurface
              .withValues(alpha: 0.4),
        );
  }

  /// ほぼ透明なフォント: 背景と同化している
  static TextStyle almostInvisible(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context)
              .colorScheme
              .surface
              .withValues(alpha: 0.95),
        );
  }

  /// 強調スタイル: クリア時のタイムやスコア表示用
  static TextStyle resultHighlight(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        );
  }
}
