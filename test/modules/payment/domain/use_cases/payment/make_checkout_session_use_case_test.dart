import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/use_cases/payment/make_checkout_session_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'make_checkout_session_use_case_test.mocks.dart';

@GenerateMocks([PaymentRepository])
void main() {
  group(
    "MakeCheckoutSessionUseCase Testing",
    () {
      late MakeCheckoutSessionUseCase makeCheckoutSessionUseCase;
      late PaymentRepository paymentRepository;
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
          paymentRepository = MockPaymentRepository();
          makeCheckoutSessionUseCase =
              MakeCheckoutSessionUseCase(paymentRepository);
        },
      );
      test(
        "When call() of MakeCheckoutSessionUseCase is called, it should call makeCheckoutSession() of PaymentRepository and return success if the call was successful",
        () async {
          // arrange
          provideDummy<ApiResult<CheckoutResponseEntity>>(
              Success(data: checkoutResponseEntity));
          when(paymentRepository.makeCheckoutSession(
                  paymentRequestParameters: paymentRequestParameters))
              .thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: checkoutResponseEntity)),
          );
          // act
          var useCaseResult = await makeCheckoutSessionUseCase.call(
              paymentRequestParameters: paymentRequestParameters);
          // assert
          verify(paymentRepository.makeCheckoutSession(
                  paymentRequestParameters: paymentRequestParameters))
              .called(1);
          switch (useCaseResult) {
            case Success<CheckoutResponseEntity>():
              expect(useCaseResult.data, checkoutResponseEntity);
            case Error<CheckoutResponseEntity>():
              debugPrint("Impossible Case Has Happened");
          }
        },
      );
      test(
        "When call() of MakeCheckoutSessionUseCase is called, it should call makeCheckoutSession() of PaymentRepository and return error if the call failed",
        () async {
          // arrange
          provideDummy<ApiResult<CheckoutResponseEntity>>(
              Error(error: dioException));
          when(paymentRepository.makeCheckoutSession(
                  paymentRequestParameters: paymentRequestParameters))
              .thenAnswer(
            (realInvocation) => Future.value(Error(error: dioException)),
          );
          // act
          var useCaseResult = await makeCheckoutSessionUseCase.call(
              paymentRequestParameters: paymentRequestParameters);
          // assert
          verify(paymentRepository.makeCheckoutSession(
                  paymentRequestParameters: paymentRequestParameters))
              .called(1);
          switch (useCaseResult) {
            case Success<CheckoutResponseEntity>():
              debugPrint("Impossible Case Has Happened");
            case Error<CheckoutResponseEntity>():
              expect(useCaseResult.error, dioException);
          }
        },
      );
    },
  );
}
