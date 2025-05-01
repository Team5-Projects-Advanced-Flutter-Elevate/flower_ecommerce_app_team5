import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';

abstract class OrderPageRepo {
  Future<List<GetMyOrdersEntity>> getMyOrder();
}
