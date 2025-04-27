import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/best_seller_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';

class HomeDataResponseEntity {
  String? message;
  List<CategoryEntity>? categories;
  List<BestSellerEntity>? bestSeller;
  List<OccasionEntity>? occasions;

  HomeDataResponseEntity({
    this.message,
    this.categories,
    this.bestSeller,
    this.occasions,
  });
}
