/// 文章の代わりに置く図の部品。
///
/// 投影では**読ませるより見せる**方が速い。1枚あたりの文字数を減らすため、
/// 箇条書きにできる内容は極力ここの部品に置き換える。
///
/// 色は必ず `SlideColors` を経由すること。図が増えるほど、直に色を書くと
/// 統一感が崩れやすくなる。
library;

import 'package:flutter/material.dart';
import 'package:slides/theme.dart';

/// アイコン（または任意の図形）を主役にしたタイル。
///
/// 箇条書き1行の代わりに置く。**ラベルは一語**に絞ること。説明が要るなら
/// タイルではなく本文で書いた方が読みやすい。
class IconTile extends StatelessWidget {
  const IconTile({
    super.key,
    required this.label,
    this.icon,
    this.glyph,
    this.color,
    this.size = 150,
    this.number,
  }) : assert(
          icon != null || glyph != null,
          'icon か glyph のどちらかは要る',
        );

  /// タイルの下に添える一語
  final String label;

  /// 中に置くアイコン
  final IconData? icon;

  /// アイコンでは表せないもの（黄色い丸、タブの帯など）を描くとき用。
  /// [icon] より優先する。
  final Widget? glyph;

  /// 主色。省略時は [SlideColors.primary]
  final Color? color;

  /// タイル（正方形）の一辺
  final double size;

  /// 左上に出す番号。順番に読ませたいときだけ付ける。
  final int? number;

  @override
  Widget build(BuildContext context) {
    final c = color ?? SlideColors.primary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // 面は主色を薄く敷く。塗りつぶすと図が4つ並んだときに
                    // 画面が重くなる。
                    color: c.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(size * 0.24),
                  ),
                  child: Center(
                    child: glyph ?? Icon(icon, size: size * 0.5, color: c),
                  ),
                ),
              ),
              if (number != null)
                Positioned(left: -12, top: -12, child: NumberBadge(number!)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(label, style: SlideText.label),
      ],
    );
  }
}

/// 順番を示す丸い番号バッジ。
///
/// 「番号が付いているものは順番に読む」という約束を通しで揃えるため、
/// スライドをまたいで同じ見た目にする。
class NumberBadge extends StatelessWidget {
  const NumberBadge(this.number, {super.key, this.color, this.size = 52});

  final int number;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = color ?? SlideColors.accent;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: c, shape: BoxShape.circle),
      child: Text('$number', style: SlideText.badge(size * 0.52, c.onColor)),
    );
  }
}

/// 図の中の「→」。工程がつながっていることを、矢印だけで示す。
class FlowArrow extends StatelessWidget {
  const FlowArrow({super.key, this.size = 56});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size * 0.35),
      child: Icon(
        Icons.arrow_forward_rounded,
        size: size,
        color: SlideColors.subText,
      ),
    );
  }
}

/// 2つの選択肢の比重を、1本の帯で見せる。
///
/// 「A よりも B」を文章で書くと読ませることになるが、**帯の長さの差**なら
/// 見た瞬間に伝わる。取った方（[takenLabel]）を強調色で長く取る。
class RatioBar extends StatelessWidget {
  const RatioBar({
    super.key,
    required this.droppedLabel,
    required this.takenLabel,
    this.takenRatio = 0.72,
    this.height = 96,
  });

  /// 取らなかった方
  final String droppedLabel;

  /// 取った方
  final String takenLabel;

  /// 取った方が占める割合
  final double takenRatio;

  final double height;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(height / 2);

    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            Expanded(
              // flex は整数しか取れないので、割合を 100 分率にして渡す
              flex: ((1 - takenRatio) * 100).round(),
              child: _Segment(
                label: droppedLabel,
                background: SlideColors.scheme.surfaceContainerHighest,
                foreground: SlideColors.subText,
              ),
            ),
            Expanded(
              flex: (takenRatio * 100).round(),
              child: _Segment(
                label: takenLabel,
                background: SlideColors.accent,
                foreground: SlideColors.accent.onColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: background,
      child: Center(
        // 帯が短い側でラベルが折り返すと読みにくいので、
        // 収まらないときは折り返さずに縮める。
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              label,
              maxLines: 1,
              style: SlideText.label.copyWith(color: foreground),
            ),
          ),
        ),
      ),
    );
  }
}

/// アイコンと一語を横に並べた小さな札。行の中に図を混ぜたいときに使う。
class LabelChip extends StatelessWidget {
  const LabelChip({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = color ?? SlideColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: c),
          const SizedBox(width: 14),
          Text(label, style: SlideText.label),
        ],
      ),
    );
  }
}
