import '../../../../core/apis/api_result/api_result.dart';
import '../entity/notification_entity.dart';

abstract class GetNotificationListRepo {
  Future<ApiResult<NotificationListEntity>> getNotifications();
}
