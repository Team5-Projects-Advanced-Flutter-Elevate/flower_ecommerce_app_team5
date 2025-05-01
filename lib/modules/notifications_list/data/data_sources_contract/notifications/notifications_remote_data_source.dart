import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';

abstract interface class NotificationsRemoteDataSource {
  Future<ApiResult<NotificationsResponseEntity>> getAllNotifications(
      {String? sort});
}
