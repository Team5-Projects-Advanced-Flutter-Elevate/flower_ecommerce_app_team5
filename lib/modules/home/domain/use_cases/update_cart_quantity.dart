import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_response_entity/cart_response_entity.dart';

@injectable
class UpdateCartQuantityUseCase {
  final HomeRepo _repo;

  UpdateCartQuantityUseCase(this._repo);

  Future<ApiResult<CartResponseEntity>> execute(
          String productId, Map<String, dynamic> quantity) =>
      _repo.updateCartQuantity(productId, quantity);
}
