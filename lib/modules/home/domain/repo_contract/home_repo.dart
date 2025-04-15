import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';

import '../../data/models/all_products_response/all_product_response.dart';
import '../../data/models/cart_response/add_to_cart_request.dart';
import '../entities/cart_response_entity/cart_item_entity.dart';
import '../entities/home_data_response_entity.dart';
import '../entities/occasion_entity.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<CategoryEntity>?>> getAllCategories();

  Future<ApiResult<List<OccasionEntity>?>> getAllOccasions();

  Future<ApiResult<HomeDataResponseEntity>> getHomeData();

  Future<ApiResult<List<Products>?>> getAllProduct({String? categoryId});

  Future<ApiResult<CartResponseEntity>> getCartItems();

  Future<ApiResult<CartResponseEntity>> addToCart(AddToCartRequest request);

  Future<ApiResult<CartResponseEntity>> deleteFromCart(String productId);
}
