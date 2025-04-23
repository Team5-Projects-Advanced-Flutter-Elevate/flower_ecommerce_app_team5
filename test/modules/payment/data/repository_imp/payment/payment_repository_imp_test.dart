import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/data_source_contract/payment/payment_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/checkout_session_response/checkout_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/repository_imp/payment/payment_repository_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/repository_contract/payment/payment_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_repository_imp_test.mocks.dart';

@GenerateMocks([PaymentRemoteDataSource])
void main() {
  group(
    "PaymentRepositoryImp Testing",
    () {
      late PaymentRepository paymentRepository;
      late PaymentRemoteDataSource paymentRemoteDataSource;
      PaymentRequestParametersEntity parametersEntity =
          const PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                  street: "street",
                  phone: "phone",
                  city: "city",
                  lat: "lat",
                  long: "long"));
      CashOrderResponseEntity cashOrderResponseEntity =
          CashOrderResponseEntity(message: "success");
      DioException exception = DioException(requestOptions: RequestOptions());
      CheckoutResponseEntity checkoutResponseEntity =
          CheckoutResponseEntity(message: "success");
      setUpAll(
        () {
          paymentRemoteDataSource = MockPaymentRemoteDataSource();
          paymentRepository = PaymentRepositoryImp(paymentRemoteDataSource);
        },
      );
      test(
        "When makeCashOrder() called, it should call makeCashOrder() of PaymentRemoteDataSource and return success if the call was success",
        () async {
          // arrange
          provideDummy<ApiResult<CashOrderResponseEntity>>(
              Success(data: cashOrderResponseEntity));
          when(paymentRemoteDataSource.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
            (invocation) =>
                Future.value(Success(data: cashOrderResponseEntity)),
          );
          // act
          var repositoryResult = await paymentRepository.makeCashOrder(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRemoteDataSource.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (repositoryResult) {
            case Success<CashOrderResponseEntity>():
              expect(repositoryResult.data, cashOrderResponseEntity);
            case Error<CashOrderResponseEntity>():
              debugPrint("Impossible Case Happened");
          }
        },
      );
      test(
        "When makeCashOrder() called, it should call makeCashOrder() of PaymentRemoteDataSource and return error if the call failed",
        () async {
          // arrange
          provideDummy<ApiResult<CashOrderResponseEntity>>(
              Error(error: exception));
          when(paymentRemoteDataSource.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
                  (realInvocation) => Future.value(Error(error: exception)));
          // act
          var repositoryResult = await paymentRepository.makeCashOrder(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRemoteDataSource.makeCashOrder(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (repositoryResult) {
            case Success<CashOrderResponseEntity>():
              debugPrint("Impossible Case Happened");
            case Error<CashOrderResponseEntity>():
              expect(repositoryResult.error, exception);
          }
        },
      );
      test(
        "When makeCheckoutSession() called, it should call makeCheckoutSession() of PaymentRemoteDataSource and return success if the call was success",
        () async {
          // arrange
          provideDummy<ApiResult<CheckoutResponseEntity>>(
              Success(data: checkoutResponseEntity));
          when(paymentRemoteDataSource.makeCheckoutSession(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
            (invocation) => Future.value(Success(data: checkoutResponseEntity)),
          );
          // act
          var repositoryResult = await paymentRepository.makeCheckoutSession(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRemoteDataSource.makeCheckoutSession(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (repositoryResult) {
            case Success<CheckoutResponseEntity>():
              expect(repositoryResult.data, checkoutResponseEntity);

            case Error<CheckoutResponseEntity>():
              debugPrint("Impossible Case Happened");
          }
        },
      );
      test(
        "When makeCheckoutSession() called, it should call makeCheckoutSession() of PaymentRemoteDataSource and return error if the call failed",
        () async {
          // arrange
          provideDummy<ApiResult<CashOrderResponseEntity>>(
              Error(error: exception));
          when(paymentRemoteDataSource.makeCheckoutSession(
                  paymentRequestParameters: parametersEntity))
              .thenAnswer(
            (realInvocation) => Future.value(Error(error: exception)),
          );
          // act
          var repositoryResult = await paymentRepository.makeCheckoutSession(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentRemoteDataSource.makeCheckoutSession(
                  paymentRequestParameters: parametersEntity))
              .called(1);
          switch (repositoryResult) {
            case Success<CheckoutResponseEntity>():
              debugPrint("Impossible Case Happened");
            case Error<CheckoutResponseEntity>():
              expect(repositoryResult.error, exception);
          }
        },
      );
    },
  );
}
