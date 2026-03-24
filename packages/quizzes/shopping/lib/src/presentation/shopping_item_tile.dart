import 'package:flutter/material.dart';
import 'package:quiz_core/quiz_core.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';

/// Amazon風の縦型商品カード
///
/// [highlighted] が true のとき、ヒント対象商品として強調表示し、
/// [UnreadableText] で文字化けしていたテキストを読める状態に戻す。
class ShoppingItemTile extends StatelessWidget {
  const ShoppingItemTile({
    super.key,
    required this.item,
    required this.onAddToCart,
    this.highlighted = false,
  });

  final ShoppingItem item;
  final VoidCallback onAddToCart;

  /// ヒント時にこのアイテムを強調表示し、テキストを読めるようにするか
  final bool highlighted;

  // 商品IDに基づく決定論的なダミー評価（再起動しても同じ値）
  double get _rating {
    final code = item.id.codeUnits.fold(0, (a, b) => a + b);
    return 3.5 + (code % 3) * 0.5; // 3.5, 4.0, 4.5 のいずれか
  }

  int get _reviewCount {
    final code = item.id.codeUnits.fold(0, (a, b) => a + b);
    return 50 + (code % 10) * 30;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: highlighted ? 3 : 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品画像エリア（正方形）
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color:
                    highlighted ? const Color(0xFFFFF3CD) : Colors.grey.shade50,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                border: highlighted
                    ? Border.all(color: const Color(0xFFFF9900), width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  item.imageEmoji,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            ),
          ),
          // 商品情報エリア
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 商品名: ヒント使用時のみ読める
                  UnreadableText(
                    item.name,
                    isObfuscated: !highlighted,
                    style: const TextStyle(fontSize: 12, height: 1.3),
                  ),
                  const SizedBox(height: 4),
                  // レーティング（ダミー）
                  _RatingRow(
                    rating: _rating,
                    reviewCount: _reviewCount,
                    isObfuscated: !highlighted,
                  ),
                  const SizedBox(height: 4),
                  // 価格
                  Text(
                    '¥${item.price}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Prime バッジ
                  const _PrimeBadge(),
                  const Spacer(),
                  // カートに追加ボタン（Amazon黄色）
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD814),
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Color(0xFFFFA41C)),
                        ),
                      ),
                      onPressed: onAddToCart,
                      child: const Text(
                        'カートに追加',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({
    required this.rating,
    required this.reviewCount,
    required this.isObfuscated,
  });

  final double rating;
  final int reviewCount;
  final bool isObfuscated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (i) {
          if (i < rating.floor()) {
            return const Icon(Icons.star, size: 11, color: Color(0xFFFF9900));
          }
          if (i < rating) {
            return const Icon(
              Icons.star_half,
              size: 11,
              color: Color(0xFFFF9900),
            );
          }
          return const Icon(
            Icons.star_outline,
            size: 11,
            color: Color(0xFFFF9900),
          );
        }),
        const SizedBox(width: 3),
        UnreadableText(
          '$reviewCount',
          isObfuscated: isObfuscated,
          style: const TextStyle(fontSize: 10, color: Color(0xFF007185)),
        ),
      ],
    );
  }
}

class _PrimeBadge extends StatelessWidget {
  const _PrimeBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFF00A8E1),
        borderRadius: BorderRadius.circular(2),
      ),
      child: const Text(
        'prime',
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
