import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';

import '../entities/get_occasion.dart';

abstract class OccasionRepo {
  Future<List<Occasion>> getOccasion();
  Future<AllProductResponseEntity> execute();
}
