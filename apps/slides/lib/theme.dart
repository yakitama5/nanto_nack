import 'package:flutter/material.dart';

/// スライドの配色。
///
/// **色は必ずここを経由する。** ウィジェット側で `Color(0x...)` を直に書くと、
/// スライドごとに少しずつ違う紫や赤が混ざって統一感が崩れる。
///
/// 中身は Material Design 3 の [ColorScheme] ひとつ。種色（seed）を与えると
/// 主色・その上に載る文字色・面の色などが**互いにコントラストが取れた状態で
/// まとめて生成される**ので、個別に色を選ぶより破綻しにくい。
///
/// - **Primary**: NantoNack のブランド紫
/// - **Secondary**: 赤（注釈・パンチライン）
abstract final class SlideColors {
  /// Primary の種色。ブランドの紫。
  static const brandPurple = Color(0xFF6C4DE0);

  /// Secondary の種色。強調の赤。
  static const brandRed = Color(0xFFE0483C);

  /// 種色から配色を1つ作る。
  ///
  /// [DynamicSchemeVariant.fidelity] を指定しているのは、既定の `tonalSpot`
  /// だと彩度が大きく落ちて**ブランドの紫がくすんだ別の色になる**ため。
  /// fidelity は種色の色味をほぼそのまま主色に残す。投影では彩度が
  /// さらに落ちて見えるので、鮮やかな側に寄せておく。
  static ColorScheme _seeded(
    Color seed, [
    Brightness brightness = Brightness.light,
  ]) =>
      ColorScheme.fromSeed(
        seedColor: seed,
        brightness: brightness,
        dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
      );

  /// スライド全体の配色。
  ///
  /// [ColorScheme.fromSeed] は種色1つから Primary〜Tertiary までを
  /// まとめて決めるため、`secondary:` に赤を渡しただけでは
  /// `onSecondary` や `secondaryContainer` が紫由来のまま残り、
  /// 赤の系統が揃わない。そこで**赤だけで作ったもう1つの配色の
  /// Primary 一式を、Secondary の枠へそのまま移植する**。
  static final ColorScheme scheme = _seeded(brandPurple).copyWith(
    secondary: _red.primary,
    onSecondary: _red.onPrimary,
    secondaryContainer: _red.primaryContainer,
    onSecondaryContainer: _red.onPrimaryContainer,
  );

  static final ColorScheme _red = _seeded(brandRed);

  /// 背景。
  ///
  /// `surface`（ほぼ純白）ではなく一段沈めた面を使う。投影すると白は
  /// 光って眩しく、黒文字とのコントラストが強すぎて読みにくいため。
  static Color get background => scheme.surfaceContainerLow;

  /// 主色。見出しの強調と番号バッジに使う。
  static Color get primary => scheme.primary;

  /// 強調色。注釈の丸とパンチラインに使う。
  static Color get accent => scheme.secondary;

  /// 本文
  static Color get text => scheme.onSurface;

  /// 補足テキスト
  static Color get subText => scheme.onSurfaceVariant;

  /// [surface] の上に置いて読める文字色を返す。
  ///
  /// 面の色を**引数で受け取る**ウィジェット（注釈のバッジなど）のためのもの。
  /// 面が可変なのに文字色だけ固定すると、面の色を変えたときに文字が
  /// 読めなくなる。面から導けば、その組み合わせは起きない。
  static Color onColorOf(Color surface) =>
      ThemeData.estimateBrightnessForColor(surface) == Brightness.dark
          // 濃い面の上に置く文字。Primary / Secondary はどちらも濃い面なので
          // on 色は共通（白）。
          ? scheme.onPrimary
          : scheme.onSurface;
}

/// 全面を主色で塗るスライド（コンセプト）専用の配色。
///
/// 明るい面向けの [SlideColors] をそのまま置くと、濃い紫の上で
/// コントラストが取れない。**暗い面の上に載る前提の色**をここにまとめる。
abstract final class SlidePanelColors {
  /// 面そのものの色
  static Color get background => SlideColors.scheme.primary;

  /// 面の上に置く、最もコントラストの高い文字。山場の一語に使う。
  static Color get onBackground => SlideColors.scheme.onPrimary;

  /// 面の上の控えめな文字。[onBackground]（白）から一段落として、
  /// 山場の一語だけが浮き上がるようにする。
  ///
  /// **`onPrimaryContainer` を流用してはいけない。** あれは
  /// `primaryContainer` の上に置く前提で作られた色で、面が `primary` の
  /// ここでは組み合わせが保証されない。実際、variant を既定の `tonalSpot`
  /// に戻すとコントラスト比が 1.43 まで落ちて読めなくなる。
  /// **必ず [onBackground] を面の色へ寄せて作る**（現状 5.71）。
  static final Color onBackgroundMuted =
      Color.lerp(onBackground, background, 0.2)!;

  /// 面の上の強調色。
  ///
  /// [SlideColors.accent]（明るい面向けの濃い赤）は紫の上では沈んで
  /// 読めないため、**暗い面向けに生成した赤**を使う。同じ種色から
  /// 出しているので、赤としての系統は揃っている。
  static final Color highlight =
      SlideColors._seeded(SlideColors.brandRed, Brightness.dark).primary;
}

/// スライド用のテキストスタイル。
///
/// `AppTheme`（quiz_core）の TextTheme はアプリ画面向けのサイズなので、
/// 1920x1080 に投影するスライドでは小さすぎる。投影距離を考えて
/// **明示的にサイズを決め打ちする**。こうしておくとプレビュー画像と
/// 本番の見え方が一致する。
///
/// **スクリーン投影が前提なので、全体に大きめに振っている。**
/// このサイズで収まらない文章は、縮めるのではなく**言い切って短くする**。
/// 1枚あたりの文字数は 100 字以内が目安。
///
/// 色は [SlideColors] から取る。[ColorScheme] は実行時に生成されるため
/// `const` にはできない。呼び出し側の `const Text(...)` が外れるが、
/// スライド6枚の再構築なので描画コストは問題にならない。
abstract final class SlideText {
  static const _family = 'packages/quiz_core/NotoSansJP';

  /// 大見出し（スライドのタイトル）
  static final title = TextStyle(
    fontFamily: _family,
    fontSize: 88,
    height: 1.3,
    fontWeight: FontWeight.bold,
    color: SlideColors.text,
    decoration: TextDecoration.none,
  );

  /// 中見出し・パンチライン
  static final punch = TextStyle(
    fontFamily: _family,
    fontSize: 60,
    height: 1.35,
    fontWeight: FontWeight.bold,
    color: SlideColors.accent,
    decoration: TextDecoration.none,
  );

  /// 強調した一文
  static final lead = TextStyle(
    fontFamily: _family,
    fontSize: 48,
    height: 1.4,
    fontWeight: FontWeight.bold,
    color: SlideColors.primary,
    decoration: TextDecoration.none,
  );

  /// 箇条書き・通常の本文
  static final body = TextStyle(
    fontFamily: _family,
    fontSize: 42,
    height: 1.45,
    color: SlideColors.text,
    decoration: TextDecoration.none,
  );

  /// 補足
  static final caption = TextStyle(
    fontFamily: _family,
    fontSize: 32,
    height: 1.6,
    color: SlideColors.subText,
    decoration: TextDecoration.none,
  );

  /// 番号バッジなど、色付きの面の上に置く小さな文字。
  ///
  /// バッジは `Material` の子孫でない `Stack` 上にも描かれるため、
  /// 既定の下線が入らないよう [TextDecoration.none] を明示している。
  static TextStyle badge(double size, Color color) => TextStyle(
        fontFamily: _family,
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: TextDecoration.none,
      );
}
