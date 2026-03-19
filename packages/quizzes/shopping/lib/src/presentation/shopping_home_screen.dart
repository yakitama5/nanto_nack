import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingHomeScreen extends ConsumerWidget {
  const ShoppingHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ショッピング')),
      body: const Center(
        child: Text('ショッピングカテゴリ - 実装中'),
      ),
    );
  }
}
