import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../data/models/cart_response/add_to_cart_request.dart';

@injectable
class AddToCartUseCase {
  HomeRepo homeRepo;

  AddToCartUseCase({required this.homeRepo});

  Future<ApiResult<CartResponseEntity>> execute(
          AddToCartRequest addToCartRequest) =>
      homeRepo.addToCart(addToCartRequest);
}
