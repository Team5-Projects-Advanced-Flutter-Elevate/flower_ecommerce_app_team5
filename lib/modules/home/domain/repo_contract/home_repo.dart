import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';

import '../../data/models/all_products_response/all_product_response.dart';
import '../entities/occasion_entity.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<CategoryEntity>?>> getAllCategories();

  Future<ApiResult<List<OccasionEntity>?>> getAllOccasions();

  Future<ApiResult<List<Products>?>> getAllProduct({String? categoryId});
}
