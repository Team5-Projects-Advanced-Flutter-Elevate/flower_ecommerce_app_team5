import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/api/api_client/best_seller_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_imp/best_seller/best_seller_remote_data_source_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/models/best_seller_response/best_seller_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_remote_data_source_imp_test.mocks.dart';

@GenerateMocks([BestSellerApiClient])
void main() {
  group(
    "BestSellerRemoteDataSourceImp class Testing",
    () {
      late BestSellerRemoteDataSource bestSellerRemoteDataSource;
      late BestSellerApiClient bestSellerApiClient;
      var bestSellerResponseDto = BestSellerResponseDto(
        message: "Success",
        bestSellerProducts: [
          BestSellerDataDto(
            id: "1",
            title: "Product 1",
            slug: "product-1",
            description: "Description of Product 1",
            imgCover: "https://example.com/img/product1.jpg",
            images: [
              "https://example.com/img/product1_1.jpg",
              "https://example.com/img/product1_2.jpg"
            ],
            price: 100.0,
            priceAfterDiscount: 80.0,
            quantity: 50,
            category: "Category 1",
            occasion: "Occasion 1",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            v: 1,
            discount: 20.0,
            sold: 10,
            rateAvg: 4.5,
            rateCount: 100,
            bestSellerId: "bs1",
          ),
          BestSellerDataDto(
            id: "2",
            title: "Product 2",
            slug: "product-2",
            description: "Description of Product 2",
            imgCover: "https://example.com/img/product2.jpg",
            images: [
              "https://example.com/img/product2_1.jpg",
              "https://example.com/img/product2_2.jpg"
            ],
            price: 200.0,
            priceAfterDiscount: 160.0,
            quantity: 30,
            category: "Category 2",
            occasion: "Occasion 2",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            v: 1,
            discount: 20.0,
            sold: 20,
            rateAvg: 4.0,
            rateCount: 50,
            bestSellerId: "bs2",
          ),
        ],
      );
      var noNetworkConnection = DioException(
        requestOptions: RequestOptions(
          path: 'https://example.com/api',
        ),
        type: DioExceptionType.connectionTimeout,
        error: const SocketException(
            'Failed host lookup: \'example.com\' (OS Error: No address associated with hostname, errno = 7)'),
      );

      setUpAll(
        () {
          bestSellerApiClient = MockBestSellerApiClient();
          bestSellerRemoteDataSource =
              BestSellerRemoteDataSourceImp(bestSellerApiClient);
        },
      );
      test(
        "When getBestSeller() is called, it should call getBestSellerProducts()of BestSellerApiClient and return success ApiResult if the api call was success ",
        () async {
          // arrange
          when(bestSellerApiClient.getBestSellerProducts()).thenAnswer(
            (realInvocation) => Future.value(bestSellerResponseDto),
          );
          // act
          var result = await bestSellerRemoteDataSource.getBestSellerProducts();
          //assert
          verify(bestSellerApiClient.getBestSellerProducts()).called(1);
          if (result is Success<BestSellerResponseEntity>) {
            expect(result.data.bestSeller?.length,
                bestSellerResponseDto.bestSellerProducts?.length);
          }
        },
      );
      test(
        "When getBestSeller() is called, it should call getBestSellerProducts()of BestSellerApiClient and return error ApiResult if the api call was failed ",
        () async {
          // arrange
          when(bestSellerApiClient.getBestSellerProducts()).thenThrow(noNetworkConnection);
          // act
          var result = await bestSellerRemoteDataSource.getBestSellerProducts();
          //assert
          verify(bestSellerApiClient.getBestSellerProducts()).called(1);
          if (result is Error<BestSellerResponseEntity>) {
            expect(result.error,
                noNetworkConnection);
          }
        },
      );
    },
  );
}
