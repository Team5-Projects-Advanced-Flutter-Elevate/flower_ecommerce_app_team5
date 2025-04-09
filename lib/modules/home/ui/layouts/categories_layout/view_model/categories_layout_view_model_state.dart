part of 'categories_layout_view_model.dart';

sealed class CategoriesLayoutViewModelState extends Equatable {
  const CategoriesLayoutViewModelState();
}

final class CategoriesLayoutViewModelInitial
    extends CategoriesLayoutViewModelState {
  @override
  List<Object> get props => [];
}

final class CategoriesLayoutViewModelLoading
    extends CategoriesLayoutViewModelState {
  @override
  List<Object> get props => [];
}

final class CategoriesLayoutViewModelSuccess
    extends CategoriesLayoutViewModelState {
  @override
  List<Object> get props => [];
}

final class CategoriesLayoutViewModelError
    extends CategoriesLayoutViewModelState {
  final Object error;

  const CategoriesLayoutViewModelError({required this.error});
  @override
  List<Object> get props => [error];
}

final class CategoriesViewModelTabBarChanged
    extends CategoriesLayoutViewModelState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
