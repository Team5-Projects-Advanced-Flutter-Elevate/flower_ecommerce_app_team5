import 'package:flower_ecommerce_app_team5/modules/occasion/domain/repositories_contracts/ocassion_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../home/data/models/all_products_response/all_product_response.dart';
import '../entities/get_occasion.dart';

@injectable
class OccasionUseCase {
  OccasionRepo occasionRepo;
  OccasionUseCase(this.occasionRepo);
  Future<List<Occasion>> getOccasion() {
    return occasionRepo.getOccasion();
  }

  Future<List<Products>?> execute() {
    return occasionRepo.execute();
  }
}
