import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/notification/data/model/notification_response.dart';
import 'package:retrofit/retrofit.dart';
part 'notification_api_client.g.dart';

@RestApi()
abstract class NotificationApiClient {
  factory NotificationApiClient(Dio dio) = _NotificationApiClient;

  @GET(ApisEndpoints.getNotificationList)
  Future<NotificationListResponseDto> getNotifications();
}
