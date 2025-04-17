import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/use_cases/best_seller/get_best_seller_products_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_state.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/view_model/best_seller_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'best_seller_view_model_test.mocks.dart';

@GenerateMocks([GetBestSellerProductsUseCase])
void main() {
  group(
    "BestSellerViewModel class Testing",
    () {
      late BestSellerViewModel bestSellerViewModel;
      late GetBestSellerProductsUseCase getBestSellerProductsUseCase;
      BestSellerResponseEntity bestSellerResponseEntity =
          const  BestSellerResponseEntity(
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
          getBestSellerProductsUseCase = MockGetBestSellerProductsUseCase();
        },
      );
      setUp(
        () {
          /// Note: blocTest() function after it finishes it closes the bloc that it built, so
          /// we here creating the object from the bloc before each test that will run thus we do this
          /// in setUp() function.
          bestSellerViewModel =
              BestSellerViewModel(getBestSellerProductsUseCase);
        },
      );

      blocTest<BestSellerViewModel, BestSellerState>(
        "When calling doIntent() function of the BestSellerViewModel with the intent value GetBestSellerProducts, it should emit the correct states until it reaches the state with success status if the call of the function was success too.",
        build: () => bestSellerViewModel,
        act: (bestSellerViewModel) {
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Success(data: bestSellerResponseEntity));
          when(getBestSellerProductsUseCase.call()).thenAnswer(
            (realInvocation) =>
                Future.value(Success(data: bestSellerResponseEntity)),
          );
          bestSellerViewModel.doIntent(GetBestSellerProducts());
        },
        expect: () => [
          const BestSellerState(bestSellerStatus: BestSellerStatus.loading),
          BestSellerState(
              bestSellerStatus: BestSellerStatus.success,
              bestSellerProducts: bestSellerResponseEntity.bestSellerProducts)
        ],
      );
      blocTest<BestSellerViewModel, BestSellerState>(
        "When calling doIntent() function of the BestSellerViewModel with the intent value GetBestSellerProducts, it should emit the correct states until it reaches the state with error status if the call of the function was error too.",
        build: () => bestSellerViewModel,
        act: (bestSellerViewModel) {
          provideDummy<ApiResult<BestSellerResponseEntity>>(
              Error(error: noNetworkConnection));
          when(getBestSellerProductsUseCase.call()).thenAnswer(
            (realInvocation) => Future.value(Error(error: noNetworkConnection)),
          );
          bestSellerViewModel.doIntent(GetBestSellerProducts());
        },
        expect: () => [
          const BestSellerState(bestSellerStatus: BestSellerStatus.loading),
          BestSellerState(
              bestSellerStatus: BestSellerStatus.error,
              error: noNetworkConnection)
        ],
      );
    },
  );
}
