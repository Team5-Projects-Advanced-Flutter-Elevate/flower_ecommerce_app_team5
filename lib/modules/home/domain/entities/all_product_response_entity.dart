import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/metadata_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class AllProductResponseEntity {
  String? message;
  MetadataEntity? metadata;
  List<ProductEntity>? products;

  AllProductResponseEntity({this.message, this.metadata, this.products});
}
