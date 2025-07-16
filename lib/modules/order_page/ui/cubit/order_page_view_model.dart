import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/entity/order_page_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/usecase/order_page.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/ui/cubit/state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyOrdersViewModelCubit extends Cubit<GetMyOrdersState> {
  MyOrdersViewModelCubit(this.orderPageUseCase) : super(GetMyOrdersInitial());
  final OrderPageUseCase orderPageUseCase;

  Future<void> _loadMyOrders() async {
    emit(GetMyOrdersLoading());
    final result = await orderPageUseCase.getMyOrder();
    switch (result) {
      case Success<GetMyOrdersEntity>():
        emit(GetMyOrdersSuccess(result.data));
      case Error<GetMyOrdersEntity>():
        emit(GetMyOrdersError(result.error));
    }
  }

  void processIntent(OrderPageIntent intent) {
    switch (intent) {
      case LoadOrderPageIntent():
        _loadMyOrders();
        break;
    }
  }
}

sealed class OrderPageIntent {}

class LoadOrderPageIntent extends OrderPageIntent {}
