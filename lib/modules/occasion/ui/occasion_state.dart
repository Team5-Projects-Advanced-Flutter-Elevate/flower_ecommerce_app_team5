import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

sealed class OccasionState {}

class OccasionInitial extends OccasionState {}

class OccasionLoading extends OccasionState {}

class OccasionSuccess extends OccasionState {
  final List<OccasionEntity> allOccasions;
  final List<ProductEntity> filteredProducts;
  final String selectedSlug;

  OccasionSuccess(this.allOccasions, this.filteredProducts, this.selectedSlug);
}

class OccasionProductsLoaded extends OccasionState {
  final List<ProductEntity>? products;

  OccasionProductsLoaded(this.products);
}

class OccasionError extends OccasionState {
  final Object error;

  OccasionError(this.error);
}
