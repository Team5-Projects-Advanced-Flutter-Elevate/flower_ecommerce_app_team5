import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/apis/apis_endpoints/apis_endpoints.dart';
import '../../models/saved_address_dto.dart';

part 'saved_address_api_client.g.dart';

@RestApi(baseUrl: ApisEndpoints.baseUrl)
abstract class SavedAddressApiClient {
  factory SavedAddressApiClient(Dio dio, {String? baseUrl}) =
      _SavedAddressApiClient;

  @GET(ApisEndpoints.getAddresses)
  Future<SavedAddressDto> getSavedAddresses();

  @DELETE('${ApisEndpoints.deleteAddress}/{id}')
  Future<SavedAddressDto> deleteAddress(@Path('id') String addressId);
}
