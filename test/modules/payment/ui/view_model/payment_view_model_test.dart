import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/use_cases/get_cart_items_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/use_cases/payment/make_checkout_session_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_state.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/view_model/payment_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_view_model_test.mocks.dart';

@GenerateMocks([MakeCheckoutSessionUseCase, GetCartItemsUseCase])
void main() {
  group(
    "PaymentViewModel Testing",
    () {
      late PaymentViewModel paymentViewModel;
      late MakeCheckoutSessionUseCase makeCheckoutSessionUseCase;
      late GetCartItemsUseCase getCartItemsUseCase;
      PaymentRequestParametersEntity paymentRequestParameters =
          const PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                  street: "street",
                  phone: "phone",
                  city: "city",
                  lat: "lat",
                  long: "long"));
      CheckoutResponseEntity checkoutResponseEntity =
          const CheckoutResponseEntity(message: "success");
      DioException dioException =
          DioException(requestOptions: RequestOptions());
      setUpAll(
        () {
          makeCheckoutSessionUseCase = MockMakeCheckoutSessionUseCase();
          getCartItemsUseCase = MockGetCartItemsUseCase();
        },
      );
      setUp(
        () {
          paymentViewModel =
              PaymentViewModel(makeCheckoutSessionUseCase, getCartItemsUseCase);
        },
      );
      blocTest<PaymentViewModel, PaymentState>(
        "When doIntent() function is called with the parameter MakeCheckoutSessionIntent(), it should call the function _makeCheckoutSession() and emit the right states. (Success Case)",
        build: () {
          provideDummy<ApiResult<CheckoutResponseEntity>>(
              Success(data: checkoutResponseEntity));
          when(makeCheckoutSessionUseCase.call(
                  paymentRequestParameters: paymentRequestParameters))
              .thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: checkoutResponseEntity)),
          );
          return paymentViewModel;
        },
        act: (bloc) {
          bloc.doIntent(MakeCheckoutSessionIntent(
              paymentRequestParameters: paymentRequestParameters));
        },
        expect: () => [
          const PaymentState(checkoutSessionStatus: Status.loading),
          PaymentState(
              checkoutSessionStatus: Status.success,
              checkoutResponseEntity: checkoutResponseEntity),
        ],
        verify: (bloc) {
          verify(makeCheckoutSessionUseCase.call(
                  paymentRequestParameters: paymentRequestParameters))
              .called(1);
        },
      );
      blocTest<PaymentViewModel, PaymentState>(
        "When doIntent() function is called with the parameter MakeCheckoutSessionIntent(), it should call the function _makeCheckoutSession() and emit the right states. (Error Case)",
        build: () {
          provideDummy<ApiResult<CheckoutResponseEntity>>(
              Error(error: dioException));
          when(makeCheckoutSessionUseCase.call(
                  paymentRequestParameters: paymentRequestParameters))
              .thenAnswer(
            (realInvocation) => Future.value(Error(error: dioException)),
          );
          return paymentViewModel;
        },
        act: (bloc) {
          bloc.doIntent(MakeCheckoutSessionIntent(
              paymentRequestParameters: paymentRequestParameters));
        },
        expect: () => [
          const PaymentState(checkoutSessionStatus: Status.loading),
          PaymentState(
              checkoutSessionStatus: Status.error,
              checkoutSessionsError: dioException),
        ],
        verify: (bloc) {
          verify(makeCheckoutSessionUseCase.call(
                  paymentRequestParameters: paymentRequestParameters))
              .called(1);
        },
      );
    },
  );
}
