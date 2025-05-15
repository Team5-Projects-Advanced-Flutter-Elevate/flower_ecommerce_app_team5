import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  const ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.rateAvg,
    this.rateCount,
    this.productId,
    this.sold,
    this.bestSellerId
  });

  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final num? price;
  final num? priceAfterDiscount;
  final num? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final num? v;
  final num? discount;
  final num? sold;
  final num? rateAvg;
  final num? rateCount;
  final String? productId;
  final String? bestSellerId;

  @override
  String toString() {
    return 'Product{'
        'rateAvg: $rateAvg, '
        'rateCount: $rateCount, '
        'id: $id, '
        'title: $title, '
        'slug: $slug, '
        'description: $description'
        'imgCover: $imgCover, '
        'images: $images, '
        'price: $price, '
        'priceAfterDiscount: $priceAfterDiscount, '
        'quantity: $quantity, '
        'category: $category, '
        'occasion: $occasion, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'v: $v, '
        'sold: $sold, '
        'discount: $discount, '
        'productId: $productId'
        '}';
  }

  @override
  List<Object?> get props => [
    id,
    title,
    slug,
    description,
    imgCover,
    images,
    price,
    priceAfterDiscount,
    quantity,
    category,
    occasion,
    discount,
    sold,
    rateAvg,
    rateCount,
    bestSellerId
  ];
}
