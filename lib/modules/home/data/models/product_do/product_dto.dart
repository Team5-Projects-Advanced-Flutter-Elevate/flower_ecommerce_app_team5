import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto {
  ProductDto({
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

  factory ProductDto.fromJson(dynamic json) => _$ProductDtoFromJson(json);

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

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  ProductEntity convertIntoEntity() => ProductEntity(
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
