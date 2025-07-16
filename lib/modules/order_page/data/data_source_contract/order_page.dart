import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';

abstract class OrderPageOnlineDataSource {
  Future<ApiResult<GetMyOrdersEntity>> getMyOrder();
}
