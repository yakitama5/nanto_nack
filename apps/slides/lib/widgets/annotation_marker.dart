import 'package:flutter/material.dart';
import 'package:slides/theme.dart';
import 'package:slides/widgets/app_screen.dart';

/// 画面上の「手がかり」を囲む注釈の対象。
///
/// 矩形は [kDeviceSize]（390x844）の座標系で持つ。`ShoppingApp` は
/// カートアイコンや下部タブに GlobalKey を差し込む口を持たないため、
/// **アプリ本体に手を入れずに済むよう実測した固定座標**を使っている。
///
/// 計測は **[DeviceFrame] に入れた状態で行うこと**。端末枠の 6px の枠線が
/// 中身を内側へ押し込むので、`ShoppingApp` を単独で描いて測ると全体が
/// ズレる。値は `annotation_target_test.dart` が実レイアウトと突き合わせて
/// 検証しており、アプリ側の UI が変われば正しい値を出して落ちる。
class AnnotationTarget {
  const AnnotationTarget(this.rect);

  final Rect rect;

  /// カートのアイコン（AppBar 右上）
  static const cart = AnnotationTarget(Rect.fromLTWH(332, 10, 48, 48));

  /// 価格表示（商品タイル）
  static const price = AnnotationTarget(Rect.fromLTWH(26, 607, 36, 21));

  /// カートに追加する黄色い丸ボタン
  static const addButton = AnnotationTarget(Rect.fromLTWH(147, 634, 32, 32));

  /// 下部タブ
  static const bottomNav = AnnotationTarget(Rect.fromLTWH(6, 781, 378, 57));
}

/// [AnnotationTarget] を楕円で囲み、番号バッジを添えて描く。
///
/// 説明文はスライド左側の番号付きリストが担うので、ここでは番号だけを出す。
/// 端末の外に出ないよう、楕円もバッジも [kDeviceSize] 内にクランプする。
class AnnotationMarker extends StatelessWidget {
  const AnnotationMarker({
    super.key,
    required this.target,
    required this.number,
    required this.visible,
    required this.color,
  });

  final AnnotationTarget target;
  final int number;
  final bool visible;
  final Color color;

  static const _padding = 10.0;
  static const _badgeSize = 26.0;
  static const _margin = 4.0;

  /// バッジと楕円のすき間
  static const _gap = 2.0;

  /// 枠内に収まるよう矩形を平行移動する（拡大縮小はしないので歪まない）
  Rect _clamped(Rect r) {
    var dx = 0.0;
    var dy = 0.0;
    if (r.left < _margin) dx = _margin - r.left;
    if (r.right > kDeviceSize.width - _margin) {
      dx = kDeviceSize.width - _margin - r.right;
    }
    if (r.top < _margin) dy = _margin - r.top;
    if (r.bottom > kDeviceSize.height - _margin) {
      dy = kDeviceSize.height - _margin - r.bottom;
    }
    return r.shift(Offset(dx, dy));
  }

  /// バッジを置く位置。**楕円の完全に外側**に置く。
  ///
  /// 楕円の角に半分重ねると、対象が画面の端にあるとき枠内へ押し戻された結果
  /// 対象そのものの上に乗ってしまう（価格の ¥ がバッジで隠れていた）。
  /// 左 → 右 → 真上 の順に、余地がある方へ逃がす。
  Offset _badgeOffset(Rect r) {
    final top = r.top.clamp(_margin, kDeviceSize.height - _badgeSize - _margin);

    final left = r.left - _badgeSize - _gap;
    if (left >= _margin) return Offset(left, top);

    final right = r.right + _gap;
    if (right + _badgeSize <= kDeviceSize.width - _margin) {
      return Offset(right, top);
    }

    // 左右どちらにも余地が無い（下部タブのような横長の対象）
    return Offset(
      r.left.clamp(_margin, kDeviceSize.width - _badgeSize - _margin),
      (r.top - _badgeSize - _gap)
          .clamp(_margin, kDeviceSize.height - _badgeSize - _margin),
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = _clamped(target.rect.inflate(_padding));
    final badge = _badgeOffset(r);

    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: Stack(
          children: [
            Positioned.fromRect(
              rect: r,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(r.width / 2, r.height / 2),
                  ),
                  border: Border.all(color: color, width: 3),
                ),
              ),
            ),
            Positioned(
              left: badge.dx,
              top: badge.dy,
              child: _Badge(number: number, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.number, required this.color});

  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AnnotationMarker._badgeSize,
      height: AnnotationMarker._badgeSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        // 白い縁は配色ではなく**分離のため**。端末のスクリーンショットの
        // 上に直接置くので、縁が無いと下地の色に溶ける。
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Text(
        '$number',
        // 文字色は [color] から導く。バッジの面の色は呼び出し側から渡ってくるので、
        // ここで固定すると面の色を変えたときに読めなくなる。
        style: SlideText.badge(14, color.onColor),
      ),
    );
  }
}
