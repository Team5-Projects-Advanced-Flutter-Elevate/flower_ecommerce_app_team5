import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../entities/cart_item_entity.dart';
import '../repo_contract/home_repo.dart';

@injectable
class GetCartItemsUseCase {
  final HomeRepo homeRepo;

  GetCartItemsUseCase({required this.homeRepo});

  Future<ApiResult<List<CartItemEntity>?>> execute() => homeRepo.getCartItems();
}
