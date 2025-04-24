import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/use_cases/payment/make_cash_order_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'make_cash_order_use_case_test.mocks.dart';

@GenerateMocks([PaymentRepository])
void main() {
  group(
    "MakeCashOrderUseCase Testing",
    () {
      late MakeCashOrderUseCase makeCashOrderUseCase;
      late PaymentRepository paymentRepository;
      PaymentRequestParametersEntity parametersEntity =
          const PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                  street: "street",
                  phone: "phone",
                  city: "city",
                  lat: "lat",
                  long: "long"));
      CashOrderResponseEntity cashOrderResponseEntity =
          const CashOrderResponseEntity(message: "success");
      DioException dioException =
          DioException(requestOptions: RequestOptions());
      setUpAll(
        () {
          paymentRepository = MockPaymentRepository();
          makeCashOrderUseCase = MakeCashOrderUseCase(paymentRepository);
        },
      );
      test(
        "When call() of MakeCashOrderUseCase is called, it should call makeCashOrder() of PaymentRepository and return success if the call was successful",
        () async {
          // arrange
          provideDummy<ApiResult<CashOrderResponseEntity>>(
              Success(data: cashOrderResponseEntity));
          when(paymentRepository.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: cashOrderResponseEntity)),
          );
          // act
          var useCaseResult = await makeCashOrderUseCase.call(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRepository.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (useCaseResult) {
            case Success<CashOrderResponseEntity>():
              expect(useCaseResult.data, cashOrderResponseEntity);
            case Error<CashOrderResponseEntity>():
              debugPrint("Impossible Case Has Happened");
          }
        },
      );
      test(
        "When call() of MakeCashOrderUseCase is called, it should call makeCashOrder() of PaymentRepository and return error if the call failed",
        () async {
          // arrange
          provideDummy<ApiResult<CashOrderResponseEntity>>(
              Error(error: dioException));
          when(paymentRepository.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
            (realInvocation) => Future.value(Error(error: dioException)),
          );
          // act
          var useCaseResult = await makeCashOrderUseCase.call(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRepository.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (useCaseResult) {
            case Success<CashOrderResponseEntity>():
              debugPrint("Impossible Case Has Happened");
            case Error<CashOrderResponseEntity>():
              expect(useCaseResult.error, dioException);
          }
        },
      );
    },
  );
}
