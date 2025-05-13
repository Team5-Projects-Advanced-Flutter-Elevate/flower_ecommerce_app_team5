import 'package:flower_ecommerce_app_team5/modules/order_page/data/data_source_contract/order_page.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_executor/api_executor.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entity/order_page_entity.dart';
import '../api/api_client/my_orders_api_client.dart';
import '../model/order_page_response.dart';

@Injectable(as: OrderPageOnlineDataSource)
class OrderPageOnlineDataSourceImpl implements OrderPageOnlineDataSource {
  MyOrdersApiClient _myOrdersApiClient;
  OrderPageOnlineDataSourceImpl(this._myOrdersApiClient);

  @override
  Future<GetMyOrdersEntity> getMyOrder() async {
    var result = await ApiExecutor.executeApi(
        () async => await _myOrdersApiClient.getMyOrdersData());

    switch (result) {
      case Success<GetMyOrders>():
        return result.data.toEntity();
      case Error<GetMyOrders>():
        throw Exception(result.error); // or handle it appropriately
    }
  }
}
