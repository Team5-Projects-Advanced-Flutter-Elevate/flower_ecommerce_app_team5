import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../all_gategories_reponse/category_dm.dart';
import '../all_occasions_response/occasion_dm.dart';
import '../product_do/product_dto.dart';

part 'home_data_response.g.dart';

@JsonSerializable()
class HomeDataResponse {
  HomeDataResponse({
    this.message,
    this.categories,
    this.bestSeller,
    this.occasions,
  });

  factory HomeDataResponse.fromJson(dynamic json) =>
      _$HomeDataResponseFromJson(json);

  String? message;
  List<CategoryDM>? categories;
  List<ProductDto>? bestSeller;
  List<OccasionDM>? occasions;

  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);

  HomeDataResponseEntity toEntity() => HomeDataResponseEntity(
        message: message,
        categories: categories?.map((e) => e.toEntity()).toList(),
        bestSeller: bestSeller?.map((e) => e.convertIntoEntity()).toList(),
        occasions: occasions?.map((e) => e.toEntity()).toList(),
      );
}
