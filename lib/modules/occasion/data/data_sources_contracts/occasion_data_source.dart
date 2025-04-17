import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import '../../../home/data/models/all_products_response/all_product_response.dart';
import '../../domain/entities/get_occasion.dart';

abstract class OccasionOnlineDataSource {
  Future<List<OccasionEntity>> getOccasion();
  Future<AllProductResponseEntity> execute();

}
