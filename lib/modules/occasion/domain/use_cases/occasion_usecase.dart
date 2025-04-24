import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/occasion_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/domain/repositories_contracts/ocassion_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionUseCase {
  OccasionRepo occasionRepo;
  OccasionUseCase(this.occasionRepo);
  Future<List<OccasionEntity>> getOccasion() {
    return occasionRepo.getOccasion();
  }

  Future<AllProductResponseEntity> execute() {
    return occasionRepo.execute();
  }
}
