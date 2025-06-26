import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';

class HomeDataResponseEntity {
  String? message;
  List<CategoryEntity>? categories;
  List<ProductEntity>? bestSeller;
  List<OccasionEntity>? occasions;

  HomeDataResponseEntity({
    this.message,
    this.categories,
    this.bestSeller,
    this.occasions,
  });
}
