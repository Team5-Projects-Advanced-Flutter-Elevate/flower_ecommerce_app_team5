import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/api/api_client/notifications_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NotificationsClientProvider {
  @lazySingleton
  NotificationsApiClient provideApiClient(Dio dio) {
    return NotificationsApiClient(dio);
  }
}
