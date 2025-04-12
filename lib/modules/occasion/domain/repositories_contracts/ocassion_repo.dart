import '../../../home/data/models/all_products_response/all_product_response.dart';
import '../entities/get_occasion.dart';

abstract class OccasionRepo {
  Future<List<Occasion>> getOccasion();
  Future<List<Products>?> execute();
}
