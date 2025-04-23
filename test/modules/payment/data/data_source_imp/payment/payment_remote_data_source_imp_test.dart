import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/api/api_client/payment_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/data_source_contract/payment/payment_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/data_source_imp/payment/payment_remote_data_source_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/cash_order_response/cash_order_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/checkout_session_response/checkout_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/data/models/payment_request_parameters/payment_request_parameters.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/cash_order_response/cash_order_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/checkout_session_response/checkout_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'payment_remote_data_source_imp_test.mocks.dart';

@GenerateMocks([PaymentApiClient])
void main() {
  group(
    "PaymentRemoteDataSourceImp Testing",
    () {
      late PaymentRemoteDataSource paymentRemoteDataSource;
      late PaymentApiClient paymentApiClient;
      PaymentRequestParametersEntity parametersEntity =
          const PaymentRequestParametersEntity(
              shippingAddress: ShippingAddressEntity(
                  street: "street",
                  phone: "phone",
                  city: "city",
                  lat: "lat",
                  long: "long"));
      CashOrderResponseDto cashOrderResponseDto =
          CashOrderResponseDto(message: "success");
      DioException exception = DioException(requestOptions: RequestOptions());
      CheckoutResponseDto checkoutResponseDto =
          CheckoutResponseDto(message: "success");
      setUpAll(
        () {
          paymentApiClient = MockPaymentApiClient();
          paymentRemoteDataSource =
              PaymentRemoteDataSourceImp(paymentApiClient);
        },
      );
      test(
        "When makeCashOrder() is called, it should call makeCashOrder() of paymentApiClient and return success if the api call was success",
        () async {
          // arrange
          when(paymentApiClient.makeCashOrder(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .thenAnswer(
            (realInvocation) => Future.value(cashOrderResponseDto),
          );
          // act
          var datasourceResult = await paymentRemoteDataSource.makeCashOrder(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentApiClient.makeCashOrder(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .called(1);
          switch (datasourceResult) {
            case Success<CashOrderResponseEntity>():
              expect(datasourceResult.data,
                  cashOrderResponseDto.convertIntoEntity());
            case Error<CashOrderResponseEntity>():
              debugPrint("Impossible Case Happened");
          }
        },
      );
      test(
        "When makeCashOrder() is called, it should call makeCashOrder() of paymentApiClient and return error if the api call failed",
        () async {
          // arrange
          when(paymentApiClient.makeCashOrder(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .thenThrow(exception);
          // act
          var datasourceResult = await paymentRemoteDataSource.makeCashOrder(
              paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentApiClient.makeCashOrder(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .called(1);
          switch (datasourceResult) {
            case Success<CashOrderResponseEntity>():
              debugPrint("Impossible Case Happened");

            case Error<CashOrderResponseEntity>():
              expect(datasourceResult.error, exception);
          }
        },
      );
      test(
        "When makeCheckoutSession() is called, it should call makeCheckoutSession() of paymentApiClient and return success if the api call was success",
        () async {
          // arrange
          when(paymentApiClient.makeCheckoutSession(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .thenAnswer(
            (realInvocation) => Future.value(checkoutResponseDto),
          );
          // act
          var datasourceResult = await paymentRemoteDataSource
              .makeCheckoutSession(paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentApiClient.makeCheckoutSession(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .called(1);
          switch (datasourceResult) {
            case Success<CheckoutResponseEntity>():
              expect(datasourceResult.data,
                  checkoutResponseDto.convertIntoEntity());
            case Error<CheckoutResponseEntity>():
              debugPrint("Impossible Case Happened");
          }
        },
      );
      test(
        "When makeCheckoutSession() is called, it should call makeCheckoutSession() of paymentApiClient and return error if the api call failed",
        () async {
          // arrange
          when(paymentApiClient.makeCheckoutSession(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .thenThrow(exception);
          // act
          var datasourceResult = await paymentRemoteDataSource
              .makeCheckoutSession(paymentRequestParameters: parametersEntity);
          // assert
          verify(paymentApiClient.makeCheckoutSession(
                  PaymentRequestParametersDto.convertEntityIntoDto(
                      parametersEntity)))
              .called(1);
          switch (datasourceResult) {
            case Success<CheckoutResponseEntity>():
              debugPrint("Impossible Case Happened");

            case Error<CheckoutResponseEntity>():
              expect(datasourceResult.error,
                  exception);

          }
        },
      );
    },
  );
}
