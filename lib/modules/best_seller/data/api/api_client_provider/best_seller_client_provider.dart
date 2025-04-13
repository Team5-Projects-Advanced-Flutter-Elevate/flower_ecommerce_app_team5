import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/api/api_client/best_seller_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class BestSellerClientProvider{

  @lazySingleton
  BestSellerApiClient providerApiClient(Dio dio){
    return BestSellerApiClient(dio);
  }
}