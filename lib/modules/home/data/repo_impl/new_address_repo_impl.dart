import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/data/datasource_contract/new_address.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/repo_contract/new_address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewAddressRepo)
class NewAddressRepoImpl implements NewAddressRepo {
  final NewAddressOnlineDataSource newAddressOnlineDataSource;

  NewAddressRepoImpl(this.newAddressOnlineDataSource);

  @override
  Future<ApiResult<List<AddressModelEntity>>> updateAddress({
    required String id,
    required AddressEntity request,
  }) async {
    return await newAddressOnlineDataSource.updateAddress(id: id, request: request);
  }

  @override
  Future<ApiResult<List<AddressModelEntity>>> deleteAddress({
    required String id,
  }) async {
    return await newAddressOnlineDataSource.deleteAddress(id: id);
  }

  @override
  Future<ApiResult<List<AddressModelEntity>>> getSavedAddresses() async {
    return await newAddressOnlineDataSource.getSavedAddresses();
  }
  @override
  Future<void> addAddress(var street,var phone,var city,var lat,var long,var name) async {
    await newAddressOnlineDataSource.addAddress(street,phone,city,lat,long,name);
  }
}