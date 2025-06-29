import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../api_client/saved_address_api_client.dart';

@module
abstract class SavedAddressClientProvider{

  @lazySingleton
  SavedAddressApiClient providerApiClient(Dio dio){
    return SavedAddressApiClient(dio);
  }
}
