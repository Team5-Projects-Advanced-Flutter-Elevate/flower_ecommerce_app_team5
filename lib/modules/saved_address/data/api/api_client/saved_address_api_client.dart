import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/saved_address_response/saved_address_response_dto.dart';
part 'saved_address_api_client.g.dart';

@RestApi()
abstract class SavedAddressApiClient{

  factory SavedAddressApiClient(Dio dio)= _SavedAddressApiClient;

  @GET(ApisEndpoints.getAddresses)
  Future<SavedAddressResponseDto> getSavedAddress();

  @PATCH(ApisEndpoints.updateAddresses)
  Future<SavedAddressResponseDto> updateSavedAddress(@Path("id") String productId);

  @DELETE(ApisEndpoints.deleteAddresses)
  Future<SavedAddressResponseDto> deleteSavedAddress(@Path("id") String productId);

}

// saved_address_response_dto.dart