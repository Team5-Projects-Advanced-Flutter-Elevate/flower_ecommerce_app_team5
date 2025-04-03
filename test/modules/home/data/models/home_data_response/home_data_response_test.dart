import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_gategories_reponse/category_dm.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_occasions_response/occasion_dm.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/best_seller.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/models/home_data_response/home_data_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/home_data_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home Data Response', () {
    test(
      'when call toEntity with non null values it should return HomeResponseEntity',
      () {
        // arrange
        var homeDataResponse = HomeDataResponse(
          message: 'message',
          categories: [
            CategoryDM(
              id: '1',
              name: 'name',
              image: 'image',
              slug: 'slug',
              createdAt: 'createdAt',
              updatedAt: 'updatedAt',
              productsCount: 1,
            )
          ],
          bestSeller: [
            BestSellerDM(
              id: '1',
              title: 'title',
              slug: 'slug',
              description: 'description',
              imgCover: 'imgCover',
              images: ['images'],
              price: 1,
              priceAfterDiscount: 1,
              quantity: 1,
              discount: 1,
              sold: 1,
              rateAvg: 1,
              rateCount: 1,
              createdAt: 'createdAt',
              updatedAt: 'updatedAt',
              category: 'fdsf',
              occasion: 'oococ',
              v: 2,
            )
          ],
          occasions: [
            OccasionDM(
              id: '1',
              name: 'name',
              image: 'image',
              slug: 'slug',
              createdAt: 'createdAt',
              updatedAt: 'updatedAt',
              productsCount: 1,

            )
          ],
        );
        // act
        var result = homeDataResponse.toEntity();
        // assert
        expect(result, isA<HomeDataResponseEntity>());
      },
    );

    test(
      'when call toEntity with  nullable values it should return nullable  AuthenticationResponseEntity',
      () {
        // arrange
        var homeDataResponse = HomeDataResponse();
        // act
        var result = homeDataResponse.toEntity();
        // assert
        expect(result, isA<HomeDataResponseEntity?>());
      },
    );
  });
}
