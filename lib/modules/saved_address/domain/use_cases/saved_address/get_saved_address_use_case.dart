import 'package:injectable/injectable.dart';
import '../../../../../../../../core/apis/api_result/api_result.dart';
import '../../entities/saved_address/saved_address_response_entity.dart';
import '../../repositories_contracts/saved_address/saved_address_repository.dart';

@injectable
class GetSavedAddressUseCase {
  SavedAddressRepository savedAddressRepository;
  GetSavedAddressUseCase(this.savedAddressRepository);
  Future<ApiResult<SavedAddressResponseEntity>> call() {
    return savedAddressRepository.getSavedAddress();
  }
}
