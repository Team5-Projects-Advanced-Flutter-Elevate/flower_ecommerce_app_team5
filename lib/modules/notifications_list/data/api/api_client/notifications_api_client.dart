import 'package:dio/dio.dart';
import 'package:flower_ecommerce_app_team5/core/apis/apis_endpoints/apis_endpoints.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/models/notifications/notifications_response_dto.dart';
import 'package:retrofit/retrofit.dart';
part 'notifications_api_client.g.dart';
@RestApi()
abstract class NotificationsApiClient {
  factory NotificationsApiClient(Dio dio) = _NotificationsApiClient;

  @GET(ApisEndpoints.getNotifications)
  Future<NotificationsResponseDto> getAllNotifications(
      {@Query('sort') String sort = '-createdAt'});
}
