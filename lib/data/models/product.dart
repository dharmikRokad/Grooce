import '../../utils/constants/enums/product_type.dart';

class Product {
  const Product({
    required this.isFavorite,
    required this.isInCart,
    required this.cartCount,
    required this.id,
    required this.category,
    required this.imgRef,
    required this.name,
    required this.price,
  });

  final String? id;
  final bool? isFavorite;
  final bool? isInCart;
  final int? cartCount;
  final ProductType? category;
  final String? imgRef;
  final String? name;
  final int? price;

  factory Product.fromJson(Map<String, dynamic> json, String id) => Product(
        isFavorite: json['is_favorite'],
        isInCart: json['in_cart'],
        cartCount: json['count'],
        id: id,
        category: ProductType.fromString(json['category'] ?? ''),
        imgRef: json['imgRef'] ?? '',
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'is_favorite': isFavorite,
        'in_cart': isInCart,
        'count': cartCount,
        'category': category.toString(),
        'imgRef': imgRef,
        'name': name,
        'price': price,
      };
}
