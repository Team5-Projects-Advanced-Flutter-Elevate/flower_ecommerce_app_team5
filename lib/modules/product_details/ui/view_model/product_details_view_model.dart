import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
import 'package:flower_ecommerce_app_team5/core/widgets/cached_image.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_intent.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/view_model/product_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:palette_generator/palette_generator.dart';

@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsState> {
  ValueNotifier<int> activeIndexOfSmoothIndicatorNotifier = ValueNotifier(0);
  int scrollStep = 0;
  int _activeIndex = 0;
  double _previousPixel = 0;
  bool _scrollGoingForward = false;
  final ScrollController imageListController = ScrollController();
  late PaletteGenerator _paletteGenerator;
  List<Color> _imagesMainColor = [];

  ProductDetailsViewModel() : super(const ProductDetailsState());

  void doIntent(ProductDetailsIntent intent) {
    switch (intent) {
      case InitOnScrollListener():
        _initOnScrollListener();
        break;
      case InitScrollStep():
        _initScrollStep();
        break;
      case ChangeSmoothIndicatorActiveIndex():
        _setActiveIndexOfSmoothIndicator(intent.index);
        break;
      case JumpToImageIndex():
        _jumpToImageIndex(intent.index);
        break;
      case DisposeScrollController():
        _disposeScrollController();
        break;
      case ExtractColorPalettes():
        _extractColorPalettes(intent.imageUrls);
        break;
    }
  }

  void _extractColorPalettes(List<String> images) async {
    emit(const ProductDetailsState(
        colorPalettesStatus: ColorPalettesStatus.loading));
    for (int i = 0; i < images.length; i++) {
      try {
        _paletteGenerator = await PaletteGenerator.fromImageProvider(
            NetworkImage(images[i]),
            size: const Size(50, 30));
        print("Image$i: ${_paletteGenerator.dominantColor?.color}");
        _imagesMainColor
            .add(_paletteGenerator.dominantColor?.color ?? AppColors.white);
      } catch (e) {
        print("Error extracting colors image$i: $e");
        _imagesMainColor.add(AppColors.white);
      }
    }
    print("Colors Loaded: $_imagesMainColor");
    _setSystemStatusBarColor(_imagesMainColor.first);
    emit(ProductDetailsState(
        colorPalettesStatus: ColorPalettesStatus.loaded,
        imagesMainColor: _imagesMainColor));
  }

  void _setActiveIndexOfSmoothIndicator(int index) {
    activeIndexOfSmoothIndicatorNotifier.value = index;
    _setSystemStatusBarColor(_imagesMainColor[index]);
  }

  void _setSystemStatusBarColor([Color? newColor]) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: newColor ?? AppColors.white),
    );
  }

  void _initScrollStep() {
    if (scrollStep == 0) {
      scrollStep = imageListController.position.viewportDimension.toInt();
    }
  }

  void _initOnScrollListener() {
    imageListController.addListener(_onImageScroll);
  }

  void _onImageScroll() {
    if (imageListController.position.pixels > _previousPixel) {
      _scrollGoingForward = true;
      _previousPixel = imageListController.position.pixels;
    } else {
      _scrollGoingForward = false;
      _previousPixel = imageListController.position.pixels;
    }
    double pixelsOverViewport =
        imageListController.position.pixels / scrollStep;
    if ((pixelsOverViewport - pixelsOverViewport.toInt()) == 0 &&
        _activeIndex != pixelsOverViewport.toInt()) {
      _activeIndex = pixelsOverViewport.toInt();
      _setActiveIndexOfSmoothIndicator(_activeIndex);
    } else if (_scrollGoingForward &&
        (pixelsOverViewport - pixelsOverViewport.toInt()) > 0.5 &&
        _activeIndex != pixelsOverViewport.ceil()) {
      _activeIndex = pixelsOverViewport.ceil();
      _setActiveIndexOfSmoothIndicator(_activeIndex);
    } else if (!_scrollGoingForward &&
        (pixelsOverViewport - pixelsOverViewport.toInt()) < 0.5 &&
        _activeIndex != pixelsOverViewport.floor()) {
      _activeIndex = pixelsOverViewport.floor();
      _setActiveIndexOfSmoothIndicator(_activeIndex);
    }
  }

  void _jumpToImageIndex(int index) {
    imageListController.jumpTo((index * scrollStep).toDouble());
  }

  void _disposeScrollController() {
    imageListController.removeListener(_onImageScroll);
    imageListController.dispose();
  }
}
