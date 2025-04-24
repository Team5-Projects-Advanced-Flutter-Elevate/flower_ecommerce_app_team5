part of 'search_cubit.dart';

@immutable
sealed class SearchState extends Equatable {}

final class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

final class SearchError extends SearchState {
  final Object error;
  SearchError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class SearchSuccess extends SearchState {
  final List<ProductEntity> productsList;
  SearchSuccess({required this.productsList});

  @override
  List<Object?> get props => [productsList];
}
