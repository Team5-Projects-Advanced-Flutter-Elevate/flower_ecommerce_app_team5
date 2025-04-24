import 'package:bloc_test/bloc_test.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_state.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:palette_generator/palette_generator.dart';
import 'product_details_view_model_test.mocks.dart';

@GenerateMocks([
  ScrollController,
  ScrollPosition,
  ValueNotifier,
  PaletteGenerator,
])
void main() {
  group(
    "ProductDetailsViewModel Tests",
    () {
      late ProductDetailsViewModel productDetailsViewModel;
      late ScrollController scrollController;
      setUp(
        () {
          scrollController = MockScrollController();
          productDetailsViewModel = ProductDetailsViewModel();
          productDetailsViewModel.imageListController = scrollController;
        },
      );
      test(
          "When calling doIntent function with InitOnScrollListener() object, it should call the addListener() function",
          () {
        // arrange

        // act
        productDetailsViewModel
            .doIntent(InitOnScrollListener(functionAddedToListener: onScroll));

        // assert
        verify(productDetailsViewModel.imageListController
                .addListener(onScroll))
            .called(1);
      });
      test(
          "When calling doIntent function with DisposeScrollController() object, it should dispose the scroll controller",
          () {
        // arrange

        // act
        productDetailsViewModel
            .doIntent(DisposeScrollController(functionDisposed: onScroll));

        // assert
        verify(productDetailsViewModel.imageListController
                .removeListener(onScroll))
            .called(1);
        verify(productDetailsViewModel.imageListController.dispose()).called(1);
      });
      test(
          "When calling doIntent function with InitScrollStep() object, it should initialize the scrollStep parameter with the correct value",
          () {
        // arrange
        ScrollPosition scrollPosition = MockScrollPosition();
        when(scrollController.position).thenAnswer(
          (realInvocation) {
            return scrollPosition;
          },
        );
        when(scrollPosition.viewportDimension).thenAnswer(
          (realInvocation) {
            return 720;
          },
        );
        // act
        productDetailsViewModel.doIntent(InitScrollStep());

        // assert
        expect(
            productDetailsViewModel.scrollStep,
            productDetailsViewModel
                .imageListController.position.viewportDimension
                .toInt());
      });
      test(
          "When calling doIntent function with JumpToImageIndex() object, it should jump to the correct page index",
          () {
        // arrange
        int index = 2;
        // act
        productDetailsViewModel.doIntent(JumpToImageIndex(index: index));

        // assert
        verify(productDetailsViewModel.imageListController.jumpTo(
                (index * productDetailsViewModel.scrollStep).toDouble()))
            .called(1);
      });
      test(
          "When calling doIntent function with ChangeSmoothIndicatorActiveIndex() object, it should change value of ValueNotifier object to the correct one",
          () {
        // arrange
        int index = 2;
        productDetailsViewModel.imagesDominantColors.addAll([
          const Color(0x000000ff),
          const Color(0x000000ff),
          const Color(0x000000ff)
        ]);
        // act
        productDetailsViewModel
            .doIntent(ChangeSmoothIndicatorActiveIndex(index: index));

        // assert
        expect(
            productDetailsViewModel.activeIndexOfSmoothIndicatorNotifier.value,
            index);
      });
      blocTest<ProductDetailsViewModel, ProductDetailsState>(
        "When calling doIntent function with ExtractColorPalettes() object, it should extract the right color from each image in images list",
        build: () => productDetailsViewModel,
        act: (bloc) {
          bloc.doIntent(ExtractColorPalettes(imageUrls: [
            "https://flower.elevateegy.com/uploads/66c36d5d-c067-46d9-b339-d81be57e0149-image_one.png",
          ]));
        },
        expect: () => [
          const ProductDetailsState(
              colorPalettesStatus: ColorPalettesStatus.loading,
              imagesMainColor: []),
        ],
      );

    },
  );
}

void onScroll() {}
