import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/domain/entity/address_model_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/new_address_response.dart';

abstract class NewAddressOnlineDataSource {
  Future<void> addAddress(var street,var phone,var city,var lat,var long,var name);
  Future<ApiResult<List<AddressModelEntity>>> updateAddress({required String id,required AddressEntity request});
  Future<ApiResult<List<AddressModelEntity>>> deleteAddress({required String id});
}