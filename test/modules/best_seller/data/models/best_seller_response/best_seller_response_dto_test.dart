import 'package:flower_ecommerce_app_team5/modules/best_seller/data/models/best_seller_response/best_seller_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "BestSellerResponseDto Class Testing",
    () {
      setUpAll(
        () {
          print("In setUpAll funciton");
        },
      );
      test(
        "When calling convertIntoEntity() with BestSellerResponseDto with non-null values, it should return the entity form of the dto with also non-null values",
        () {
          // arrange
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

              ),
            ],
          );
          // act
          var actualResult = bestSellerResponseDto.convertIntoEntity();
          // assert
          expect(actualResult.bestSellerProducts?.length,
              bestSellerResponseDto.bestSellerProducts?.length);
          for (int i = 0; i < (actualResult.bestSellerProducts?.length ?? 0); i++) {
            actualResult.bestSellerProducts?[i].category ==
                bestSellerResponseDto.bestSellerProducts?[i].category;
            actualResult.bestSellerProducts?[i].description ==
                bestSellerResponseDto.bestSellerProducts?[i].description;
            actualResult.bestSellerProducts?[i].discount ==
                bestSellerResponseDto.bestSellerProducts?[i].discount;
            actualResult.bestSellerProducts?[i].id ==
                bestSellerResponseDto.bestSellerProducts?[i].id;
            actualResult.bestSellerProducts?[i].images ==
                bestSellerResponseDto.bestSellerProducts?[i].images;
            actualResult.bestSellerProducts?[i].imgCover ==
                bestSellerResponseDto.bestSellerProducts?[i].imgCover;
            actualResult.bestSellerProducts?[i].occasion ==
                bestSellerResponseDto.bestSellerProducts?[i].occasion;
            actualResult.bestSellerProducts?[i].price ==
                bestSellerResponseDto.bestSellerProducts?[i].price;
            actualResult.bestSellerProducts?[i].priceAfterDiscount ==
                bestSellerResponseDto.bestSellerProducts?[i].priceAfterDiscount;
            actualResult.bestSellerProducts?[i].title ==
                bestSellerResponseDto.bestSellerProducts?[i].title;
            actualResult.bestSellerProducts?[i].slug ==
                bestSellerResponseDto.bestSellerProducts?[i].slug;
            actualResult.bestSellerProducts?[i].sold ==
                bestSellerResponseDto.bestSellerProducts?[i].sold;
            actualResult.bestSellerProducts?[i].rateAvg ==
                bestSellerResponseDto.bestSellerProducts?[i].rateAvg;
            actualResult.bestSellerProducts?[i].rateCount ==
                bestSellerResponseDto.bestSellerProducts?[i].rateCount;
          }
        },
      );
    },
  );
}
