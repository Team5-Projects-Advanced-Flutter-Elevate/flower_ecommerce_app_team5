import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/saved_address/saved_address_response_entity.dart';
import '../../../domain/repositories_contracts/saved_address/update_address_repository.dart';
import '../../data_sources_contract/saved_address/update_address_remote_data_source.dart';
import '../../models/saved_address_response/saved_address_response_dto.dart';

@Injectable(as: UpdateAddressRepository)
class UpdateAddressRepositoryImp implements UpdateAddressRepository {
  UpdateAddressRemoteDataSource updateAddressRemoteDataSource;
  UpdateAddressRepositoryImp(this.updateAddressRemoteDataSource);
  @override
  Future<ApiResult<SavedAddressResponseEntity>> updateAddress(String productId) async {
    var result = await updateAddressRemoteDataSource.updateAddress(productId);
    switch(result){
      case Success<SavedAddressResponseDto>():
        return Success(data: result.data.convertToEntity());
      case Error<SavedAddressResponseDto>():
        return Error(error: result.error);
    }
  }
}

