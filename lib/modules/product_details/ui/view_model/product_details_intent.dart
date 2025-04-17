sealed class ProductDetailsIntent {}

class InitOnScrollListener extends ProductDetailsIntent {
  void Function()? functionAddedToListener;

  InitOnScrollListener({this.functionAddedToListener});
}

class InitScrollStep extends ProductDetailsIntent {}

class DisposeScrollController extends ProductDetailsIntent {
  void Function()? functionDisposed;

  DisposeScrollController({this.functionDisposed});
}

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
