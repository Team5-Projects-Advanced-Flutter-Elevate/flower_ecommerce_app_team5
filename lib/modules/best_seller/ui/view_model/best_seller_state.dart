import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/domain/entities/best_seller/best_seller_entity.dart';

enum BestSellerStatus { initial, loading, success, error }

class BestSellerState extends Equatable {
  BestSellerStatus bestSellerStatus;
  List<BestSellerDataEntity>? bestSellerProducts;
  Object? error;

  BestSellerState(
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
