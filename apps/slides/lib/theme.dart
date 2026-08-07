import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

/// 面の色から、その上に置いて読める文字色を引く。
extension SlideSurfaceColor on Color {
  /// この色を面にしたときに、上に置いて読める文字色。
  ///
  /// `SlideColors.onColorOf(color)` と同じもの。図の部品は
  /// 「面の色」を引数で受け取ることが多く、そのたびに文字色を
  /// 書き分けると取り違えるため、面の色から引けるようにしている。
  Color get onColor => SlideColors.onColorOf(this);
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
///
/// ## 書体は Kiwi Maru（google_fonts）
///
/// 丸みのある字形で、やわらかい印象を出す。**フォントは同梱しておらず
/// 実行時に fonts.gstatic.com から取得する**ため、通信できない環境では
/// 無言で [_fallbackFamily]（NotoSansJP）に戻る。
///
/// **Kiwi Maru に Bold(700) は無い。** ウェイトは Light(300) /
/// Regular(400) / Medium(500) の3つだけ。`FontWeight.bold` を指定しても
/// 実際には太くならないので、見出しと本文の差は
/// **太さではなく文字サイズと色で付ける**こと。
abstract final class SlideText {
  /// フォント取得に失敗したときに効く書体。
  ///
  /// quiz_core が同梱しているので、オフラインでも必ず表示できる。
  static const _fallbackFamily = 'packages/quiz_core/NotoSansJP';

  /// 見出しに使う最も太いウェイト。Kiwi Maru の上限。
  static const _heading = FontWeight.w500;

  /// Kiwi Maru を実行時に取得するか。
  ///
  /// **プレビューテスト専用の逃げ道。** `google_fonts` は取得に失敗すると
  /// 例外を rethrow する実装なので、通信を遮断する flutter_test では
  /// 必ずテストごと落ちる。テスト側で false にすると、取得を試みずに
  /// [_fallbackFamily] で組む。
  ///
  /// **本番のコードから触らないこと。** false にすると Kiwi Maru にならない。
  @visibleForTesting
  static bool useWebFont = true;

  static TextStyle _kiwi({
    required double size,
    required double height,
    required Color color,
    FontWeight weight = FontWeight.w400,
  }) {
    final base = TextStyle(
      fontSize: size,
      height: height,
      fontWeight: weight,
      color: color,
      // Material 祖先が無い Stack 上にも描かれるため、
      // 既定の下線が入らないよう明示的に打ち消す。
      decoration: TextDecoration.none,
    );

    if (!useWebFont) return base.copyWith(fontFamily: _fallbackFamily);

    final style = GoogleFonts.kiwiMaru(textStyle: base);

    // **フォールバックは後付けしないと効かない。**
    // `GoogleFonts` は返す直前に `fontFamilyFallback` を自前の値で
    // 上書きするので、`textStyle:` 引数で渡しても捨てられる。
    //
    // 後ろに NotoSansJP を足しておかないと、フォント取得に失敗したとき
    // 既定書体（日本語グリフを持たない）に落ちて**豆腐（□）になる**。
    return style.copyWith(
      fontFamilyFallback: [...?style.fontFamilyFallback, _fallbackFamily],
    );
  }

  /// 大見出し（スライドのタイトル）
  static final title = _kiwi(
    size: 88,
    height: 1.3,
    weight: _heading,
    color: SlideColors.text,
  );

  /// 中見出し・パンチライン
  static final punch = _kiwi(
    size: 60,
    height: 1.35,
    weight: _heading,
    color: SlideColors.accent,
  );

  /// 強調した一文
  static final lead = _kiwi(
    size: 48,
    height: 1.4,
    weight: _heading,
    color: SlideColors.primary,
  );

  /// 箇条書き・通常の本文
  static final body = _kiwi(
    size: 42,
    height: 1.45,
    color: SlideColors.text,
  );

  /// 補足
  static final caption = _kiwi(
    size: 32,
    height: 1.6,
    color: SlideColors.subText,
  );

  /// アイコンに添える一語のラベル。図の中で使う。
  static final label = _kiwi(
    size: 36,
    height: 1.2,
    weight: _heading,
    color: SlideColors.text,
  );

  /// 番号バッジなど、色付きの面の上に置く小さな文字。
  static TextStyle badge(double size, Color color) =>
      _kiwi(size: size, height: 1, weight: _heading, color: color);

  /// flutter_deck 自身が描く部分（フッター・スライド番号）に渡す TextTheme。
  ///
  /// ここを省くと、スライド本体だけ Kiwi Maru でフッターは既定書体、
  /// という食い違いが出る。
  static TextTheme deckTextTheme() => ThemeData.light().textTheme.apply(
        fontFamily: caption.fontFamily,
        fontFamilyFallback: caption.fontFamilyFallback,
      );
}
