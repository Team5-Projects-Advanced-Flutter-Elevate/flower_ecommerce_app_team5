import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_response_entity/cart_response_entity.dart';
import '../repo_contract/home_repo.dart';

@injectable
class DeleteFromCartUseCase {
  final HomeRepo _homeRepo;

  DeleteFromCartUseCase(this._homeRepo);

  Future<ApiResult<CartResponseEntity>> execute(String id) =>
      _homeRepo.deleteFromCart(id);
}
