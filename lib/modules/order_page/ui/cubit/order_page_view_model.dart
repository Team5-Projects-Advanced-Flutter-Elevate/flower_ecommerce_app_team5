import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/domain/usecase/order_page.dart';
import 'package:flower_ecommerce_app_team5/modules/order_page/ui/cubit/state.dart';
import 'package:injectable/injectable.dart';

@injectable
class MyOrdersViewModelCubit extends Cubit<GetMyOrdersState> {
  MyOrdersViewModelCubit(this.orderPageUsecase) : super(GetMyOrdersInitial());
  final OrderPageUseCase orderPageUsecase;

  Future<void> _LoadMyOrders() async {
    emit(GetMyOrdersLoading());
    final data = await orderPageUsecase.getMyOrder();
    emit(GetMyOrdersSuccess(data));
    // try {
    //
    // } catch (e) {
    //   emit(GetMyOrdersError(e.toString()));
    // }
  }

  void processIntent(orderPageIntent intent) {
    switch (intent) {
      case LoadOrderPageIntent():
        _LoadMyOrders();
        break;
    }
  }
}

sealed class orderPageIntent {}

class LoadOrderPageIntent extends orderPageIntent {}
