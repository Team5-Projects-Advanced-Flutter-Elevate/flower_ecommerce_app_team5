import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
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
    // TODO: implement getOccasion
    return await occasionOnlineDataSource.getOccasion();
  }

  @override
  Future<List<Products>?> execute() async {
    // TODO: implement execute
    return await occasionOnlineDataSource.execute();
  }
}
