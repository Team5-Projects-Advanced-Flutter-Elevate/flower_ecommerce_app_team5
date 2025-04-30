import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/saved_address_response/saved_address_response_dto.dart';
import '../../repositories_contracts/saved_address/saved_address_repository.dart';

@injectable
class GetSavedAddressUseCase {
  SavedAddressRepository savedAddressRepository;
  GetSavedAddressUseCase(this.savedAddressRepository);
  Future<ApiResult<SavedAddressResponseEntity>> call(AddressEntity address) {
    return savedAddressRepository.getSavedAddress(address);
  }
}
