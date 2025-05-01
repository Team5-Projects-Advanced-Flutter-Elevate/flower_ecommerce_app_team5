import 'package:flower_ecommerce_app_team5/modules/notification/domain/entity/notification_entity.dart';

import '../../../../core/apis/api_result/api_result.dart';

abstract class GetNotificationListOnlineDataSource {
  Future<ApiResult<NotificationListEntity>> getNotifications();
}
