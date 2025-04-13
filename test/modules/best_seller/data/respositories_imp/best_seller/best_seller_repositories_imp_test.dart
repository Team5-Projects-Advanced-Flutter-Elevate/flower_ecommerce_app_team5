import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/data_sources_contract/best_seller/best_seller_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/data/respositories_imp/best_seller/best_seller_repositories_imp.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_repositories_imp_test.mocks.dart';

@GenerateMocks([BestSellerRemoteDataSource])
void main() {
  group(
    "BestSellerRepositoryImp class Testing",
    () {
      late BestSellerRepository bestSellerRepository;
      late BestSellerRemoteDataSource bestSellerRemoteDataSource;
      BestSellerResponseEntity bestSellerResponseEntity =
          BestSellerResponseEntity(
        message: "Success",
        bestSellerProducts: [
          BestSellerDataEntity(
            id: "1",
            title: "Product 1",
            slug: "product-1",
            description: "Description of Product 1",
            imgCover: "https://example.com/img/product1.jpg",
            images: const [
              "https://example.com/img/product1_1.jpg",
              "https://example.com/img/product1_2.jpg"
            ],
            price: 100.0,
            priceAfterDiscount: 80.0,
            quantity: 50,
            category: "Category 1",
            occasion: "Occasion 1",
            discount: 20.0,
            sold: 10,
            rateAvg: 4.5,
            rateCount: 100,
            bestSellerId: "bs1",
          ),
          BestSellerDataEntity(
            id: "2",
            title: "Product 2",
            slug: "product-2",
            description: "Description of Product 2",
            imgCover: "https://example.com/img/product2.jpg",
            images: const [
              "https://example.com/img/product2_1.jpg",
              "https://example.com/img/product2_2.jpg"
            ],
            price: 200.0,
            priceAfterDiscount: 160.0,
            quantity: 30,
            category: "Category 2",
            occasion: "Occasion 2",
            discount: 20.0,
            sold: 20,
            rateAvg: 4.0,
            rateCount: 50,
            bestSellerId: "bs2",
          ),
        ],
      );
      DioException noNetworkConnection = DioException(
        requestOptions: RequestOptions(
          path: 'https://example.com/api',
        ),
        type: DioExceptionType.connectionTimeout,
        error: const SocketException(
            'Failed host lookup: \'example.com\' (OS Error: No address associated with hostname, errno = 7)'),
      );
      setUpAll(
        () {
          bestSellerRemoteDataSource = MockBestSellerRemoteDataSource();
          bestSellerRepository =
              BestSellerRepositoryImp(bestSellerRemoteDataSource);
        },
      );
      test(
        'When calling getBestSellerProducts(), it should call getBestSellerProducts() of remoteDataSource and return success<BestSellerResponseEntity> if the remoteDataSourceFunction returns success too.',
        () async {
          // arrange
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Success(data: bestSellerResponseEntity));
          when(bestSellerRemoteDataSource.getBestSellerProducts()).thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: bestSellerResponseEntity)),
          );
          // act
          var actualResult = await bestSellerRepository.getBestSellerProducts();
          // assert
          verify(bestSellerRemoteDataSource.getBestSellerProducts()).called(1);
          switch (actualResult) {
            case Success<BestSellerResponseEntity>():
              expect(actualResult.data, bestSellerResponseEntity);

            case Error<BestSellerResponseEntity>():
              debugPrint("Not Possible Case Happened");
          }
        },
      );
      test(
        'When calling getBestSellerProducts(), it should call getBestSellerProducts() of remoteDataSource and return Error<BestSellerResponseEntity> if the remoteDataSourceFunction returns error too.',
        () async {
          // arrange
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Error(error: noNetworkConnection));
          when(bestSellerRemoteDataSource.getBestSellerProducts()).thenAnswer(
            (realInvocation) => Future.value(Error(error: noNetworkConnection)),
          );
          // act
          var actualResult = await bestSellerRepository.getBestSellerProducts();
          // assert
          verify(bestSellerRemoteDataSource.getBestSellerProducts()).called(1);
          switch (actualResult) {
            case Success<BestSellerResponseEntity>():
              debugPrint("Not Possible Case Happened");

            case Error<BestSellerResponseEntity>():
              expect(actualResult.error, noNetworkConnection);
          }
        },
      );
    },
  );
}
