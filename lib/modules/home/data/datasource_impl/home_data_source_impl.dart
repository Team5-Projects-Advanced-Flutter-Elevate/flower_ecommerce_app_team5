import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/api/api_client/home_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_gategories_reponse/all_categories_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/add_to_cart_request.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/home_data_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/category_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/home_data_response_entity.dart';
import '../datasource_contract/home_online_data_source.dart';
import '../models/all_occasions_response/all_occasions_response.dart';
import '../models/cart_response/cart_response_model.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final HomeApiClient _homeApiClient;

  HomeDataSourceImpl(this._homeApiClient);

  @override
  Future<ApiResult<List<CategoryEntity>?>> getAllCategories() async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.getCategories());
    switch (result) {
      case Success<AllCategoriesResponse>():
        return Success(
          data: result.data.categories?.map((e) => e.toEntity()).toList(),
        );
      case Error<AllCategoriesResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<List<OccasionEntity>?>> getAllOccasions() async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.getOccasions());
    switch (result) {
      case Success<AllOccasionsResponse>():
        return Success(
          data: result.data.categories?.map((e) => e.toEntity()).toList(),
        );
      case Error<AllOccasionsResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<HomeDataResponseEntity>> getHomeData() async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.getHomeData());
    switch (result) {
      case Success<HomeDataResponse>():
        return Success(data: result.data.toEntity());
      case Error<HomeDataResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<AllProductResponseEntity>> getAllProduct(
      {String? categoryId}) async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.getAllProduct(categoryId: categoryId));
    switch (result) {
      case Success<AllProductResponse>():
        return Success(
          data: result.data.convertIntoEntity()
        );
      case Error<AllProductResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>> getCartItems() async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.getCartItems());
    switch (result) {
      case Success<CartResponse>():
        return Success(
          data: result.data.toEntity(),
        );
      case Error<CartResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>> addToCart(
      AddToCartRequest request) async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.addToCart(request));

    switch (result) {
      case Success<CartResponse>():
        return Success(data: result.data.toEntity());
      case Error<CartResponse>():
        return Error(error: result.error);
    }
  }

  @override
  Future<ApiResult<CartResponseEntity>> deleteFromCart(String productId) async {
    var result = await ApiExecutor.executeApi(
        () async => await _homeApiClient.deleteFromCart(productId));
    switch (result) {
      case Success<CartResponse>():
        return Success(data: result.data.toEntity());
      case Error<CartResponse>():
        return Error(error: result.error);
    }
  }
}