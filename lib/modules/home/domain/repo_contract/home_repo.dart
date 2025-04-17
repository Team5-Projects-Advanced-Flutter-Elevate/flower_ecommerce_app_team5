import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';

import '../entities/home_data_response_entity.dart';
import '../entities/occasion_entity.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<CategoryEntity>?>> getAllCategories();

  Future<ApiResult<List<OccasionEntity>?>> getAllOccasions();

  Future<ApiResult<HomeDataResponseEntity>> getHomeData();

  Future<ApiResult<AllProductResponseEntity>> getAllProduct({String? categoryId});
}
