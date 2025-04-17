import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/profile_api_client.dart';


@module
abstract class ProfileApiClientProvider {
  @singleton
  ProfileApiClient ApiClient(Dio dio) {
    return ProfileApiClient(dio);
  }
}