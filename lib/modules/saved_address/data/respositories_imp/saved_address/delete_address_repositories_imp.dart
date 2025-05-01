import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/saved_address/saved_address_response_entity.dart';
import '../../../domain/repositories_contracts/saved_address/delete_address_repository.dart';
import '../../data_sources_contract/saved_address/delete_address_remote_data_source.dart';
import '../../models/saved_address_response/saved_address_response_dto.dart';

@Injectable(as: DeleteAddressRepository)
class DeleteAddressRepositoryImp implements DeleteAddressRepository {
  DeleteAddressRemoteDataSource deleteAddressRemoteDataSource;
  DeleteAddressRepositoryImp(this.deleteAddressRemoteDataSource);
  @override
  Future<ApiResult<SavedAddressResponseEntity>> deleteAddress(String productId) async {
    var result = await deleteAddressRemoteDataSource.deleteAddress(productId);
    switch(result){
      case Success<SavedAddressResponseDto>():
        return Success(data: result.data.convertToEntity());
      case Error<SavedAddressResponseDto>():
        return Error(error: result.error);
    }
  }
}

