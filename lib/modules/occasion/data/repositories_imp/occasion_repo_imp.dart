import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/data/data_sources_contracts/occasion_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/domain/repositories_contracts/ocassion_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/get_occasion.dart';

@Injectable(as: OccasionRepo)
class OccasionRepoImpl implements OccasionRepo {
  OccasionOnlineDataSource occasionOnlineDataSource;
  OccasionRepoImpl(this.occasionOnlineDataSource);
  @override
  Future<List<Occasion>> getOccasion() async {
    return await occasionOnlineDataSource.getOccasion();
  }

  @override
  Future<AllProductResponseEntity> execute() async {
    return await occasionOnlineDataSource.execute();
  }
}
