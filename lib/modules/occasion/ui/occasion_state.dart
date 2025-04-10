import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';

import '../domain/entities/get_occasion.dart';

sealed class OccasionState {}

class OccasionInitial extends OccasionState {}

class OccasionLoading extends OccasionState {}

class OccasionSuccess extends OccasionState {
  final List<Occasion> allOccasions;
  final List<Products> filteredProducts;
  final  selectedSlug;


  OccasionSuccess(this.allOccasions,this.filteredProducts,this.selectedSlug);
}

class OccasionProductsLoaded extends OccasionState {
  final List<Products>? products;

  OccasionProductsLoaded(this.products);
}




class OccasionError extends OccasionState {
  final String message;

  OccasionError(this.message);
}
