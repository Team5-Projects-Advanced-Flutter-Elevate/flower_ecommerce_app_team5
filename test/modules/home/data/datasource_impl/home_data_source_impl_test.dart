import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/api/api_client/home_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/home_online_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_impl/home_data_source_impl.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/add_to_cart_request.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/cart_response/cart_response_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/home_data_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_data_source_impl_test.mocks.dart';

@GenerateMocks([HomeApiClient])
void main() {
  late MockHomeApiClient mockHomeApiClient;
  late HomeDataSource homeDataSourceImpl;
  setUpAll(() {
    mockHomeApiClient = MockHomeApiClient();
    homeDataSourceImpl = HomeDataSourceImpl(mockHomeApiClient);
  });
  group('home data source', () {
    group('get home data', () {
      test('get home data success ', () async {
        // arrange
        when(mockHomeApiClient.getHomeData())
            .thenAnswer((_) async => HomeDataResponse());
        // act
        var result = await homeDataSourceImpl.getHomeData();
        // assert
        expect(result, isA<Success<HomeDataResponseEntity>>());
      });
      test('get home data error ', () async {
        // arrange
        when(mockHomeApiClient.getHomeData())
            .thenThrow((_) async => HomeDataResponse());
        // act
        var result = await homeDataSourceImpl.getHomeData();
        // assert
        expect(result, isA<Error<HomeDataResponseEntity>>());
      });
    });

    group('get cart items', () {
      test('get cart items success ', () async {
        // arrange
        when(mockHomeApiClient.getCartItems())
            .thenAnswer((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.getCartItems();
        // assert
        expect(result, isA<Success<CartResponseEntity>>());
      });
      test('get cart items error ', () async {
        // arrange
        when(mockHomeApiClient.getCartItems())
            .thenThrow((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.getCartItems();
        // assert
        expect(result, isA<Error<CartResponseEntity>>());
      });
    });

    group('add to cart', () {
      late AddToCartRequest addToCartRequest;
      setUp(() {
        addToCartRequest = AddToCartRequest();
      });
      test('add to cart success ', () async {
        // arrange
        when(mockHomeApiClient.addToCart(addToCartRequest))
            .thenAnswer((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.addToCart(addToCartRequest);
        // assert
        expect(result, isA<Success<CartResponseEntity>>());
      });
      test('add to cart error ', () async {
        // arrange
        when(mockHomeApiClient.addToCart(addToCartRequest))
            .thenThrow((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.addToCart(addToCartRequest);
        // assert
        expect(result, isA<Error<CartResponseEntity>>());
      });
    });

    group('delete from cart', () {
      test('delete from cart success ', () async {
        // arrange
        when(mockHomeApiClient.deleteFromCart(any))
            .thenAnswer((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.deleteFromCart('');
        // assert
        expect(result, isA<Success<CartResponseEntity>>());
      });
      test('delete from cart  error ', () async {
        // arrange
        when(mockHomeApiClient.deleteFromCart(any))
            .thenThrow((_) async => CartResponse());
        // act
        var result = await homeDataSourceImpl.deleteFromCart('');
        // assert
        expect(result, isA<Error<CartResponseEntity>>());
      });
    });
  });
}
