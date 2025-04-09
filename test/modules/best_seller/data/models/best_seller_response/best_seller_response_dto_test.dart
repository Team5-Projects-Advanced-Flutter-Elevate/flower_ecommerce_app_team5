import 'package:flower_ecommerce_app_team5/modules/best_seller/data/models/best_seller_response/best_seller_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';
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
          // act
          var actualResult = bestSellerResponseDto.convertIntoEntity();
          // assert
          expect(actualResult.bestSeller?.length,
              bestSellerResponseDto.bestSellerProducts?.length);
          for (int i = 0; i < (actualResult.bestSeller?.length ?? 0); i++) {
            actualResult.bestSeller?[i].bestSellerId ==
                bestSellerResponseDto.bestSellerProducts?[i].bestSellerId;
            actualResult.bestSeller?[i].category ==
                bestSellerResponseDto.bestSellerProducts?[i].category;
            actualResult.bestSeller?[i].description ==
                bestSellerResponseDto.bestSellerProducts?[i].description;
            actualResult.bestSeller?[i].discount ==
                bestSellerResponseDto.bestSellerProducts?[i].discount;
            actualResult.bestSeller?[i].id ==
                bestSellerResponseDto.bestSellerProducts?[i].id;
            actualResult.bestSeller?[i].images ==
                bestSellerResponseDto.bestSellerProducts?[i].images;
            actualResult.bestSeller?[i].imgCover ==
                bestSellerResponseDto.bestSellerProducts?[i].imgCover;
            actualResult.bestSeller?[i].occasion ==
                bestSellerResponseDto.bestSellerProducts?[i].occasion;
            actualResult.bestSeller?[i].price ==
                bestSellerResponseDto.bestSellerProducts?[i].price;
            actualResult.bestSeller?[i].priceAfterDiscount ==
                bestSellerResponseDto.bestSellerProducts?[i].priceAfterDiscount;
            actualResult.bestSeller?[i].title ==
                bestSellerResponseDto.bestSellerProducts?[i].title;
            actualResult.bestSeller?[i].slug ==
                bestSellerResponseDto.bestSellerProducts?[i].slug;
            actualResult.bestSeller?[i].sold ==
                bestSellerResponseDto.bestSellerProducts?[i].sold;
            actualResult.bestSeller?[i].rateAvg ==
                bestSellerResponseDto.bestSellerProducts?[i].rateAvg;
            actualResult.bestSeller?[i].rateCount ==
                bestSellerResponseDto.bestSellerProducts?[i].rateCount;
          }
        },
      );
    },
  );
}
