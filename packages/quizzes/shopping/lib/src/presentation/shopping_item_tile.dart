import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';
import 'package:shopping/src/i18n/shopping_translations_extension.dart';

/// Amazon風EC商品カード（お気に入り＆数量ステッパー統合版）
///
/// [highlighted] が true のとき、ヒント対象商品として強調表示し、
/// テキストを読める状態（リアルテキスト）に戻す。
///
/// お気に入り状態はカードローカルで管理する（クイズ結果には影響しない）。
class ShoppingItemTile extends StatefulWidget {
  const ShoppingItemTile({
    super.key,
    required this.item,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.highlighted = false,
  });

  final ShoppingItem item;

  /// カート内の現在の数量（0 = 未追加）
  final int quantity;

  /// 数量を1増やす
  final VoidCallback onIncrement;

  /// 数量を1減らす（0になるとカートから削除）
  final VoidCallback onDecrement;

  /// ヒント時にこのアイテムを強調表示し、テキストを読めるようにするか
  final bool highlighted;

  @override
  State<ShoppingItemTile> createState() => _ShoppingItemTileState();
}

class _ShoppingItemTileState extends State<ShoppingItemTile>
    with SingleTickerProviderStateMixin {
  bool _isFavorite = false;
  late final AnimationController _blinkController;

  @override
  void initState() {
    super.initState();
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    if (widget.highlighted) {
      _blinkController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(ShoppingItemTile old) {
    super.didUpdateWidget(old);
    if (widget.highlighted != old.highlighted) {
      if (widget.highlighted) {
        _blinkController.repeat(reverse: true);
      } else {
        _blinkController.stop();
        _blinkController.reset();
      }
    }
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return Card(
      color: ext.surfaceColor,
      elevation: widget.highlighted ? 3 : 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. お気に入りボタン付き画像エリア（正方形）
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _blinkController,
                  builder: (_, child) {
                    final bg = widget.highlighted
                        ? Color.lerp(
                            ext.itemImageBackground,
                            ext.itemHighlightBackground,
                            _blinkController.value,
                          )!
                        : ext.itemImageBackground;
                    return Container(
                      decoration: BoxDecoration(color: bg),
                      alignment: Alignment.center,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    widget.item.imagePath,
                    package: 'shopping',
                    fit: BoxFit.contain,
                  ),
                ),
                // 右上のアニメーション付きお気に入りボタン
                Positioned(
                  top: 4,
                  right: 4,
                  child: _FavoriteButton(
                    isFavorite: _isFavorite,
                    onToggle: () =>
                        setState(() => _isFavorite = !_isFavorite),
                  ),
                ),
              ],
            ),
          ),
          // 2. 情報エリア
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品名（ヒント時のみ読める）
                UnreadableText(
                  context.sqCatalogItemName(widget.item.id),
                  isObfuscated: !widget.highlighted,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, height: 1.3),
                ),
                const SizedBox(height: 4),
                // 価格
                UnreadableText(
                  '¥${widget.item.price}',
                  isObfuscated: !widget.highlighted,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                // 右下の数量コントロール
                Align(
                  alignment: Alignment.centerRight,
                  child: _QuantityController(
                    quantity: widget.quantity,
                    onIncrement: widget.onIncrement,
                    onDecrement: widget.onDecrement,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── お気に入りボタン（アニメーション付き） ──────────────────────────

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    required this.isFavorite,
    required this.onToggle,
  });

  final bool isFavorite;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: ext.favoriteButtonBackground,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: LikeButton(
          size: 20,
          isLiked: isFavorite,
          onTap: (isLiked) async {
            onToggle();
            return !isLiked;
          },
          likeBuilder: (isLiked) => Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : ext.searchIconColor,
            size: 20,
          ),
          circleColor: const CircleColor(
            start: Color(0xFFFF69B4),
            end: Color(0xFFFF0080),
          ),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: Color(0xFFFF69B4),
            dotSecondaryColor: Color(0xFFFF8FB6),
          ),
          likeCountAnimationType: LikeCountAnimationType.none,
        ),
      ),
    );
  }
}

// ─── 数量コントロール（ステッパー） ─────────────────────────────────

class _QuantityController extends StatelessWidget {
  const _QuantityController({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final ext = Theme.of(context).extension<ShoppingAppTheme>()!;
    // 数量が 0 のとき：カートへの追加ボタン
    if (quantity == 0) {
      return SizedBox(
        width: 32,
        height: 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ext.addToCartButtonColor,
            foregroundColor: ext.cartButtonForeground,
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            elevation: 0,
          ),
          onPressed: onIncrement,
          child: const Icon(Icons.add_shopping_cart, size: 16),
        ),
      );
    }

    // 数量が 1 以上のとき：ステッパー UI
    return Container(
      height: 28,
      decoration: BoxDecoration(
        color: ext.addToCartButtonColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ext.orangeAccentBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove, size: 14, color: ext.cartButtonForeground),
              onPressed: onDecrement,
            ),
          ),
          UnreadableText(
            '$quantity',
            isObfuscated: true,
            animateOnObfuscate: false,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: ext.cartButtonForeground,
            ),
          ),
          SizedBox(
            width: 28,
            height: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add, size: 14, color: ext.cartButtonForeground),
              onPressed: onIncrement,
            ),
          ),
        ],
      ),
    );
  }
}
