import 'package:equatable/equatable.dart';

class BestSellerResponseEntity extends Equatable {
  const BestSellerResponseEntity({
    this.message,
    this.bestSellerProducts,
  });

  final String? message;
  final List<BestSellerDataEntity>? bestSellerProducts;

  @override
  String toString() {
    return "$message, $bestSellerProducts, ";
  }

  @override
  List<Object?> get props => [message, bestSellerProducts];
}

class BestSellerDataEntity extends Equatable {
  const BestSellerDataEntity({
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
    //this.createdAt,
    //this.updatedAt,
    //this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
    this.bestSellerId,
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

  //final DateTime? createdAt;
  //final DateTime? updatedAt;
  //final num? v;
  final num? discount;
  final num? sold;
  final num? rateAvg;
  final num? rateCount;
  final String? bestSellerId;

  @override
  String toString() {
    return "$id, $title, $slug, $description, $imgCover, $images, $price, $priceAfterDiscount, $quantity, $category, $occasion, $discount, $sold, $rateAvg, $rateCount, $bestSellerId, ";
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
