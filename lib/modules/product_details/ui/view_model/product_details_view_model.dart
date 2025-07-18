import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/core/colors/app_colors.dart';
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
  ScrollController imageListController = ScrollController();
  late PaletteGenerator _paletteGenerator;
  final List<Color> imagesDominantColors = [];

  ProductDetailsViewModel() : super(const ProductDetailsState());
  void doIntent(ProductDetailsIntent intent) {
    switch (intent) {
      case InitOnScrollListener():
        _initOnScrollListener(intent.functionAddedToListener == null
            ? _onImageScroll
            : intent.functionAddedToListener!);
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
        _disposeScrollController(intent.functionDisposed == null
            ? _onImageScroll
            : intent.functionDisposed!);
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
            size: const Size(10, 20));
        imagesDominantColors
            .add(_paletteGenerator.dominantColor?.color ?? AppColors.white);
      } catch (e) {
        imagesDominantColors.add(AppColors.white);
      }
    }
    _setSystemStatusBarColor(imagesDominantColors.first);
    emit(ProductDetailsState(
        colorPalettesStatus: ColorPalettesStatus.loaded,
        imagesMainColor: imagesDominantColors));
  }

  void _setActiveIndexOfSmoothIndicator(int index) {
    activeIndexOfSmoothIndicatorNotifier.value = index;
    _setSystemStatusBarColor(imagesDominantColors[index]);
  }

  void _setSystemStatusBarColor([Color? newColor]) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (e) {
      debugPrint("Widget Flutter Binding not Initialized");
      return;
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: newColor ?? AppColors.white),
    );
  }

  void _initScrollStep() {
    if (scrollStep == 0) {
      scrollStep = imageListController.position.viewportDimension.toInt();
    }
  }

  void _initOnScrollListener(void Function() functionAddedToListener) {
    imageListController.addListener(functionAddedToListener);
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

  void _disposeScrollController(void Function() functionRemoved) {
    imageListController.removeListener(functionRemoved);
    imageListController.dispose();
  }
}
