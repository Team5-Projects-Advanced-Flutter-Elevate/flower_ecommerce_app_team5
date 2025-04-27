import 'package:flower_ecommerce_app_team5/modules/home/data/models/all_products_response/all_product_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepo _homeRepo;

  GetAllProductsUseCase(this._homeRepo);


}
