import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_gategories_reponse/all_categories_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_occasions_response/all_occasions_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_response_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/home_data_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/new_address_response/new_address_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/cart_response/add_to_cart_request.dart';

part 'home_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class HomeApiClient {
  factory HomeApiClient(Dio dio) = _HomeApiClient;

  @GET(ApisEndpoints.getCategories)
  Future<AllCategoriesResponse> getCategories();

  @GET(ApisEndpoints.getOccasions)
  Future<AllOccasionsResponse> getOccasions();

  @GET(ApisEndpoints.getHomeData)
  Future<HomeDataResponse> getHomeData();

  @GET(ApisEndpoints.getProducts)
  Future<AllProductResponse> getAllProduct(
      {@Query("category") String? categoryId,
      @Query("keyword") String? searchKey,
      @Query("sort") String? sortKey});

  @GET(ApisEndpoints.getCartItems)
  Future<CartResponse> getCartItems();

  @POST(ApisEndpoints.addToCart)
  Future<CartResponse> addToCart(@Body() AddToCartRequest addToCartRequest);

  @DELETE('api/v1/cart/{id}')
  Future<CartResponse> deleteFromCart(@Path("id") String productId);

  @PATCH(ApisEndpoints.addNewAddress)
  Future<SaveAddress> saveAddress(@Body() Map<String, dynamic> body);

  @PUT(ApisEndpoints.updateCartQuantity)
  Future<CartResponse> updateCartQuantity(
      @Path("id") String productId, @Body() Map<String, dynamic> body);
}
