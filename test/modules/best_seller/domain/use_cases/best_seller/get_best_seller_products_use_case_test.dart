import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/repositories_contracts/best_seller/best_seller_repository.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/use_cases/best_seller/get_best_seller_products_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_best_seller_products_use_case_test.mocks.dart';

@GenerateMocks([BestSellerRepository])
void main() {
  group(
    "GetBestSellerProductsUseCase Class Testing",
    () {
      late GetBestSellerProductsUseCase getBestSellerProductsUseCase;
      late BestSellerRepository bestSellerRepository;
      BestSellerResponseEntity bestSellerResponseEntity =
           const BestSellerResponseEntity(
        message: "Success",
        bestSellerProducts: [
          ProductEntity(
            id: "1",
            title: "Product 1",
            slug: "product-1",
            description: "Description of Product 1",
            imgCover: "https://example.com/img/product1.jpg",
            images:  [
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
          ProductEntity(
            id: "2",
            title: "Product 2",
            slug: "product-2",
            description: "Description of Product 2",
            imgCover: "https://example.com/img/product2.jpg",
            images:  [
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
          bestSellerRepository = MockBestSellerRepository();
          getBestSellerProductsUseCase =
              GetBestSellerProductsUseCase(bestSellerRepository);
        },
      );
      test(
        "When calling call() function of GetBestSellerProductsUseCase, it should call getBestSellerProducts() of BestSellerRepository and return the Success<BestSellerResponseEntity> if the repository function returns success too.",
        () async {
          // arrange
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Success(data: bestSellerResponseEntity));
          when(bestSellerRepository.getBestSellerProducts()).thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: bestSellerResponseEntity)),
          );
          // act
          var actualResult = await getBestSellerProductsUseCase();
          // assert
          verify(bestSellerRepository.getBestSellerProducts()).called(1);
          switch (actualResult) {
            case Success<BestSellerResponseEntity>():
              expect(actualResult.data, bestSellerResponseEntity);
            case Error<BestSellerResponseEntity>():
              debugPrint("Impossible Case Has Happened");
          }
        },
      );
      test(
        "When calling call() function of GetBestSellerProductsUseCase, it should call getBestSellerProducts() of BestSellerRepository and return the Error<BestSellerResponseEntity> if the repository function returns Error too.",
        () async {
          // arrange
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Error(error: noNetworkConnection));
          when(bestSellerRepository.getBestSellerProducts()).thenAnswer(
            (realInvocation) => Future.value(Error(error: noNetworkConnection)),
          );
          // act
          var actualResult = await getBestSellerProductsUseCase();
          // assert
          verify(bestSellerRepository.getBestSellerProducts()).called(1);
          switch (actualResult) {
            case Success<BestSellerResponseEntity>():
              debugPrint("Impossible Case Has Happened");
            case Error<BestSellerResponseEntity>():
              expect(actualResult.error, noNetworkConnection);
          }
        },
      );
    },
  );
}
