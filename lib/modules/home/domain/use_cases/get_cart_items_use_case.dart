import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../repo_contract/home_repo.dart';

@injectable
class GetCartItemsUseCase {
  final HomeRepo homeRepo;

  GetCartItemsUseCase({required this.homeRepo});

  Future<ApiResult<CartResponseEntity>> execute() => homeRepo.getCartItems();
}
