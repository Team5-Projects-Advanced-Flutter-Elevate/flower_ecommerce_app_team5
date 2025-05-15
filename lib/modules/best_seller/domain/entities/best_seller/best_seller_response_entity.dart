import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/core/entities/product/product_entity.dart';

class BestSellerResponseEntity extends Equatable {
  const BestSellerResponseEntity({
    this.message,
    this.bestSellerProducts,
  });

  final String? message;
  final List<ProductEntity>? bestSellerProducts;

  @override
  String toString() {
    return "$message, $bestSellerProducts, ";
  }

  @override
  List<Object?> get props => [message, bestSellerProducts];
}

