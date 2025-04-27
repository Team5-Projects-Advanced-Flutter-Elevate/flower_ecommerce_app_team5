import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller.g.dart';

@JsonSerializable()
class BestSellerDM {
  BestSellerDM({
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
  });

  factory BestSellerDM.fromJson(dynamic json) => _$BestSellerDMFromJson(json);

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;

  Map<String, dynamic> toJson() => _$BestSellerDMToJson(this);

  BestSellerEntity toEntity() => BestSellerEntity(
        id: id,
        title: title,
        slug: slug,
        description: description,
        imgCover: imgCover,
        images: images,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        discount: discount,
        sold: sold,
        rateAvg: rateAvg,
        rateCount: rateCount,
      );
}
