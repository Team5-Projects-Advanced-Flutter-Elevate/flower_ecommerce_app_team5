import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/data/model/order_page_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';

part 'my_orders_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class MyOrdersApiClient {
  factory MyOrdersApiClient(Dio dio) = _MyOrdersApiClient;

  @GET(ApisEndpoints.getMyOrders)
  Future<GetMyOrders> getMyOrdersData();
}
