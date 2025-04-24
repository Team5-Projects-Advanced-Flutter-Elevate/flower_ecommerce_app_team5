import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';

abstract class OccasionOnlineDataSource {
  Future<List<OccasionEntity>> getOccasion();
  Future<AllProductResponseEntity> execute();

}
