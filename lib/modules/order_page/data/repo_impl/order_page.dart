import 'package:flower_ecommerce_app_team5/modules/order_page/data/data_source_contract/order_page.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/repo/order_page.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/order_page_entity.dart';

@Injectable(as: OrderPageRepo)
class OrderPageRepoImpl implements OrderPageRepo {
  OrderPageOnlineDataSource orderPageOnlineDataSource;
  OrderPageRepoImpl(this.orderPageOnlineDataSource);

  @override
  Future<List<GetMyOrdersEntity>> getMyOrder() {
    // TODO: implement getMyOrder
    return orderPageOnlineDataSource.getMyOrder();
  }
}
