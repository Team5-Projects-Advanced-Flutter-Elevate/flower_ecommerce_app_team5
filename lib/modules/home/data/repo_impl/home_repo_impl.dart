import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/home_online_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/add_to_cart_request.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDataSource _homeDataSource;

  HomeRepoImpl(this._homeDataSource);

  @override
  Future<ApiResult<List<CategoryEntity>?>> getAllCategories() {
    return _homeDataSource.getAllCategories();
  }

  @override
  Future<ApiResult<List<OccasionEntity>?>> getAllOccasions() {
    return _homeDataSource.getAllOccasions();
  }

  @override
  Future<ApiResult<HomeDataResponseEntity>> getHomeData() {
    return _homeDataSource.getHomeData();
  }

  @override
  Future<ApiResult<AllProductResponseEntity>> getAllProduct({String? categoryId}) {
    return _homeDataSource.getAllProduct(categoryId: categoryId);
  }

  @override
  Future<ApiResult<CartResponseEntity>> getCartItems() {
    return _homeDataSource.getCartItems();
  }

  @override
  Future<ApiResult<CartResponseEntity>> addToCart(AddToCartRequest request) {
    return _homeDataSource.addToCart(request);
  }

  @override
  Future<ApiResult<CartResponseEntity>> deleteFromCart(String productId) {
    return _homeDataSource.deleteFromCart(productId);
  }
}