import 'package:shopping/gen/assets.gen.dart';

class ShoppingItem {
  const ShoppingItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  final String id;
  final String name;
  final int price;
  final String description;
  final AssetGenImage image;

  ShoppingItem copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    AssetGenImage? image,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
