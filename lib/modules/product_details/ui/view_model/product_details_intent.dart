sealed class ProductDetailsIntent {}

class InitOnScrollListener extends ProductDetailsIntent {}

class InitScrollStep extends ProductDetailsIntent {}

class DisposeScrollController extends ProductDetailsIntent {}

class ExtractColorPalettes extends ProductDetailsIntent {
  List<String> imageUrls;

  ExtractColorPalettes({required this.imageUrls});
}

class ChangeSmoothIndicatorActiveIndex extends ProductDetailsIntent {
  int index;

  ChangeSmoothIndicatorActiveIndex({required this.index});
}

class JumpToImageIndex extends ProductDetailsIntent {
  int index;

  JumpToImageIndex({required this.index});
}
