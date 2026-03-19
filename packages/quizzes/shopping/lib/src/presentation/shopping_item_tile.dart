import 'package:flutter/material.dart';
import 'package:shopping/src/domain/entities/shopping_item.dart';

class ShoppingItemTile extends StatelessWidget {
  const ShoppingItemTile({
    super.key,
    required this.item,
    required this.onAddToCart,
  });

  final ShoppingItem item;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(item.imageEmoji, style: const TextStyle(fontSize: 32)),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '¥${item.price}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(60, 28),
              ),
              onPressed: onAddToCart,
              child: const Text('カートに追加'),
            ),
          ],
        ),
      ),
    );
  }
}
