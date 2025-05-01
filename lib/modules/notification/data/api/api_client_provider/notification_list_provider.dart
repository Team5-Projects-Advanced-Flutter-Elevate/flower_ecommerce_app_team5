import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../api_client/notification_api_client.dart';

@module
abstract class NotificationClientProvider {
  @lazySingleton
  NotificationApiClient providerApiClient(Dio dio) {
    return NotificationApiClient(dio);
  }
}
