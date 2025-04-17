import '../../../home/data/models/all_products_response/all_product_response.dart';
import '../../domain/entities/get_occasion.dart';

abstract class OccasionOnlineDataSource {
  Future<List<Occasion>> getOccasion();
  Future<List<Products>?> execute();

}
