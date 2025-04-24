import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/repo_contract/checkout_repo_contract.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_result/api_result.dart';

@injectable
class GetAllAddressesUseCase {
  CheckOutRepo repo;

  GetAllAddressesUseCase(this.repo);

  Future<ApiResult<AddressResponseEntity>> execute() => repo.getAllAddresses();
}
