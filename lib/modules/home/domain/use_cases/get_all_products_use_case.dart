import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/all_product_response_entity.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepo _homeRepo;

  GetAllProductsUseCase(this._homeRepo);

  Future<ApiResult<AllProductResponseEntity>> execute({String? categoryId}) =>
      _homeRepo.getAllProduct(categoryId: categoryId);
}
