import 'package:injectable/injectable.dart';
import '../../../../../../../../core/apis/api_result/api_result.dart';
import '../../../data/models/saved_address_response/saved_address_response_dto.dart';
import '../../entities/saved_address/saved_address_response_entity.dart';
import '../../repositories_contracts/saved_address/delete_address_repository.dart';

@injectable
class DeleteAddressUseCase {
  DeleteAddressRepository deleteAddressRepository;
  DeleteAddressUseCase(this.deleteAddressRepository);
  Future<ApiResult<SavedAddressResponseEntity>> call(String productId) {
    return deleteAddressRepository.deleteAddress(productId);
  }
}
