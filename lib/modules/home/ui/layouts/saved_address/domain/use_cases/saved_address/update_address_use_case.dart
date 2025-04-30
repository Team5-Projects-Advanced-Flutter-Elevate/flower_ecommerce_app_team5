import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/repositories_contracts/saved_address/update_address_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/saved_address_response/saved_address_response_dto.dart';

@injectable
class UpdateAddressUseCase {
  UpdateAddressRepository updateAddressRepository;
  UpdateAddressUseCase(this.updateAddressRepository);
  Future<ApiResult<SavedAddressResponseEntity>> call(AddressEntity address,String productId) {
    return updateAddressRepository.updateAddress(address,productId);
  }
}