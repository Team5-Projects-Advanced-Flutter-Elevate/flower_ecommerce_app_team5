import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/use_case/get_all_addresses_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import '../../../payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import '../../../payment/domain/use_cases/payment/make_cash_order_use_case.dart';
import '../../../payment/domain/use_cases/payment/make_checkout_session_use_case.dart';
import 'check_out_state.dart';

@injectable
class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(
    this.getAllAddressesUseCase,
    this.makeCashOrderUseCase,
    this.makeCheckoutSessionUseCase,
  ) : super(CheckOutState());
  GetAllAddressesUseCase getAllAddressesUseCase;
  MakeCashOrderUseCase makeCashOrderUseCase;
  MakeCheckoutSessionUseCase makeCheckoutSessionUseCase;

  void doIntent(CheckOutIntent intent) {
    switch (intent) {
      case GetAllAddressesIntent():
        _getAllAddresses();
      case ChangeAddressIntent():
        _changeAddress(intent.address, intent.addressModelEntity);
      case ChangePaymentIntent():
        _changePayment(intent.paymentMethod);
      case ChangeSwitchIntent():
        _changeSwitch(intent.val);
      case MakeCashOnDeliveryIntent():
        _cashOnDelivery(intent.paymentRequestParameters);
      case MakeOnlinePaymentIntent():
        _onlinePayment(intent.paymentRequestParameters);
    }
  }

  void _changeSwitch(bool value) {
    emit(state.copyWith(
      isGift: state.selectedPaymentMethod == SelectedPaymentMethod.cod
          ? false
          : value,
    ));
  }

  void _changeAddress(String address, AddressModelEntity addressModelEntity) {
    emit(state.copyWith(
      selectedDeliveryAddress: address,
      addressModelEntityOfSelectedAddress: addressModelEntity,
    ));
  }

  void _changePayment(String paymentMethod) {
    emit(state.copyWith(
      selectedPaymentMethod: paymentMethod == 'Cash on delivery'
          ? SelectedPaymentMethod.cod
          : SelectedPaymentMethod.online,
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
          addressModelEntityOfSelectedAddress: result.data.addresses?[0],
        ));
        log(state.addressModelEntityOfSelectedAddress.toString());
      case Error<AddressResponseEntity>():
        emit(state.copyWith(
          status: CheckOutStatus.error,
          error: result.error,
        ));
    }
  }

  void _cashOnDelivery(
    PaymentRequestParametersEntity paymentRequestParameters,
  ) async {
    emit(state.copyWith(
      makeCashOnDeliveryStatus: MakeCashOnDeliveryStatus.loading,
    ));
    var result = await makeCashOrderUseCase.call(
        paymentRequestParameters: paymentRequestParameters);
    switch (result) {
      case Success<CashOrderResponseEntity>():
        emit(state.copyWith(
          makeCashOnDeliveryStatus: MakeCashOnDeliveryStatus.success,
        ));
      case Error<CashOrderResponseEntity>():
        emit(state.copyWith(
          makeCashOnDeliveryStatus: MakeCashOnDeliveryStatus.error,
          error: result.error,
        ));
    }
  }

  void _onlinePayment(
    PaymentRequestParametersEntity paymentRequestParameters,
  ) async {
    emit(state.copyWith(makeCreditCardStatus: MakeCreditCardStatus.loading));
    var result = await makeCheckoutSessionUseCase.call(
      paymentRequestParameters: paymentRequestParameters,
    );
    switch (result) {
      case Success<CheckoutResponseEntity>():
        emit(state.copyWith(
          makeCreditCardStatus: MakeCreditCardStatus.success,
        ));
      case Error<CheckoutResponseEntity>():
        emit(state.copyWith(
          makeCreditCardStatus: MakeCreditCardStatus.error,
          error: result.error,
        ));
    }
  }
}

sealed class CheckOutIntent {}

class GetAllAddressesIntent extends CheckOutIntent {}

class ChangeAddressIntent extends CheckOutIntent {
  final String address;
  final AddressModelEntity addressModelEntity;

  ChangeAddressIntent({
    required this.address,
    required this.addressModelEntity,
  });
}

class ChangePaymentIntent extends CheckOutIntent {
  final String paymentMethod;

  ChangePaymentIntent({required this.paymentMethod});
}

class ChangeSwitchIntent extends CheckOutIntent {
  final bool val;

  ChangeSwitchIntent({required this.val});
}

class MakeCashOnDeliveryIntent extends CheckOutIntent {
  final PaymentRequestParametersEntity paymentRequestParameters;

  MakeCashOnDeliveryIntent({required this.paymentRequestParameters});
}

class MakeOnlinePaymentIntent extends CheckOutIntent {
  final PaymentRequestParametersEntity paymentRequestParameters;

  MakeOnlinePaymentIntent({required this.paymentRequestParameters});
}
