import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class BestSellerResponseDto {
  BestSellerResponseDto({
    this.message,
    this.bestSellerProducts,
  });

  final String? message;

  @JsonKey(name: 'bestSeller')
  final List<BestSellerDataDto>? bestSellerProducts;

  factory BestSellerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseDtoFromJson(json);

  @override
  String toString() {
    return "$message, $bestSellerProducts, ";
  }

  BestSellerResponseEntity convertIntoEntity() {
    return BestSellerResponseEntity(
        message: message,
        bestSeller: bestSellerProducts?.map(
          (product) {
            return product.convertIntoEntity();
          },
        ).toList());
  }
}

@JsonSerializable(createToJson: false)
class BestSellerDataDto {
  BestSellerDataDto({
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
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? v;
  final num? discount;
  final num? sold;
  final num? rateAvg;
  final num? rateCount;
  final String? bestSellerId;

  factory BestSellerDataDto.fromJson(Map<String, dynamic> json) =>
      _$BestSellerDataDtoFromJson(json);

  @override
  String toString() {
    return "$id, $title, $slug, $description, $imgCover, $images, $price, $priceAfterDiscount, $quantity, $category, $occasion, $createdAt, $updatedAt, $v, $discount, $sold, $rateAvg, $rateCount, $bestSellerId, ";
  }

  BestSellerDataEntity convertIntoEntity() {
    return BestSellerDataEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      discount: discount,
      sold: sold,
      rateAvg: rateAvg,
      bestSellerId: bestSellerId,
      rateCount: rateCount,
    );
  }
}
