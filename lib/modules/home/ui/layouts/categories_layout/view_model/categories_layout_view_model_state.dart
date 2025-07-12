part of 'categories_layout_view_model.dart';

enum Status { initial, loading, success, error }

class CategoriesLayoutViewModelState extends Equatable {
  final Status getCategoriesStatus;
  final Object? getCategoriesError;
  final List<CategoryEntity> categories;
  final Status getProductsStatus;
  final Object? getProductsError;
  final List<ProductEntity> products;


  const CategoriesLayoutViewModelState({
    this.getCategoriesStatus = Status.initial,
    this.getCategoriesError,
    this.categories = const [],
    this.products = const [],
    this.getProductsStatus = Status.initial,
    this.getProductsError,
  });

  CategoriesLayoutViewModelState copyWith({
    Status? getCategoriesStatus,
    Object? getCategoriesError,
    List<CategoryEntity>? categories,
    Status? getProductsStatus,
    Object? getProductsError,
    List<ProductEntity>? products,
  }) {
    return CategoriesLayoutViewModelState(
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getCategoriesError: getCategoriesError ?? this.getCategoriesError,
      categories: categories ?? this.categories,
      getProductsStatus: getProductsStatus ?? this.getProductsStatus,
      getProductsError: getProductsError ?? this.getProductsError,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        getCategoriesStatus,
        getCategoriesError,
        categories,
        getProductsStatus,
        getProductsError,
      ];
}
