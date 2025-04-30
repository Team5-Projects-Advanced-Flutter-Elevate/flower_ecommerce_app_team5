import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/data/models/saved_address_response/saved_address_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/saved_address/domain/entities/saved_address/saved_address_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repositories_contracts/saved_address/saved_address_repository.dart';
import '../../data_sources_contract/saved_address/saved_address_remote_data_source.dart';

@Injectable(as: SavedAddressRepository)
class SavedAddressRepositoryImp implements SavedAddressRepository {
  SavedAddressRemoteDataSource savedAddressRemoteDataSource;
  SavedAddressRepositoryImp(this.savedAddressRemoteDataSource);
  @override
  Future<ApiResult<SavedAddressResponseEntity>> getSavedAddress(AddressEntity address) async {
    var result = await savedAddressRemoteDataSource.getSavedAddress(address);
    switch(result){
      case Success<SavedAddressResponseDto>():
        return Success(data: result.data.convertToEntity());
      case Error<SavedAddressResponseDto>():
        return Error(error: result.error);
    }
  }
}

