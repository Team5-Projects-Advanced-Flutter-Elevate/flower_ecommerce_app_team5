import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/data/data_source_contract/chechout_data_souce_contract.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo_contract/checkout_repo_contract.dart';

@Injectable(as: CheckOutRepo)
class CheckOutRepoImpl implements CheckOutRepo {
  CheckOutDataSource checkOutDataSource;

  CheckOutRepoImpl({required this.checkOutDataSource});

  @override
  Future<ApiResult<AddressResponseEntity>> getAllAddresses() {
    return checkOutDataSource.getAllAddresses();
  }
}
