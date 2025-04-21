import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/use_case/get_all_addresses_use_case.dart';
import 'package:injectable/injectable.dart';
import 'check_out_state.dart';

@lazySingleton
class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.getAllAddressesUseCase) : super(CheckOutState());
  GetAllAddressesUseCase getAllAddressesUseCase;

  void doIntent(CheckOutIntent intent) {
    switch (intent) {
      case GetAllAddressesIntent():
        _getAllAddresses();
      case ChangeAddressIntent():
        _changeAddress(intent.address);
      case ChangePaymentIntent():
        _changePayment(intent.paymentMethod);
      case ChangeSwitchIntent():
        _changeSwitch(intent.val);
    }
  }

  void _changeSwitch(bool value) {
    emit(state.copyWith(
      isGift: state.selectedPaymentMethod == 'Cash on delivery' ? false : value,
    ));
  }

  void _changeAddress(String address) {
    emit(state.copyWith(
      selectedDeliveryAddress: address,
    ));
  }

  void _changePayment(String paymentMethod) {
    emit(state.copyWith(
      selectedPaymentMethod: paymentMethod,
    ));
  }

  void _getAllAddresses() async {
    emit(state.copyWith(
      status: CheckOutStatus.loading,
    ));
    var result = await getAllAddressesUseCase.execute();
    switch (result) {
      case Success<AddressResponseEntity>():
        emit(state.copyWith(
          status: CheckOutStatus.success,
          addressesResponseEntity: result.data,
        ));
      case Error<AddressResponseEntity>():
        emit(state.copyWith(
          status: CheckOutStatus.error,
          error: result.error,
        ));
    }
  }
}

sealed class CheckOutIntent {}

class GetAllAddressesIntent extends CheckOutIntent {}

class ChangeAddressIntent extends CheckOutIntent {
  final String address;

  ChangeAddressIntent({required this.address});
}

class ChangePaymentIntent extends CheckOutIntent {
  final String paymentMethod;

  ChangePaymentIntent({required this.paymentMethod});
}

class ChangeSwitchIntent extends CheckOutIntent {
  final bool val;

  ChangeSwitchIntent({required this.val});
}
