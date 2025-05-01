import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/repo/order_page.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderPageUsecase {
  OrderPageRepo orderPageRepo;

  OrderPageUsecase(this.orderPageRepo);

  Future<List<GetMyOrdersEntity>> getMyOrder() {
    return orderPageRepo.getMyOrder();
  }
}
