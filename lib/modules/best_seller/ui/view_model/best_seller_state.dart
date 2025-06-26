import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';

enum BestSellerStatus { initial, loading, success, error }

class BestSellerState extends Equatable {
  final BestSellerStatus bestSellerStatus;
  final List<ProductEntity>? bestSellerProducts;
  final Object? error;

  const BestSellerState(
      {this.bestSellerStatus = BestSellerStatus.initial,
        this.bestSellerProducts,
        this.error});

  @override
  List<Object?> get props => [bestSellerStatus, bestSellerProducts, error];
// BestSellerState copyWith(
//     {BestSellerStatus? bestSellerStatus, Object? error}) {
//   return BestSellerState(
//       bestSellerStatus: bestSellerStatus ?? this.bestSellerStatus,
//       error: error ?? this.error);
// }
}
