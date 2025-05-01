import 'package:flower_ecommerce_app_team5/modules/notification/domain/entity/notification_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/notification/domain/repo_contract/get_notification_list.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';

@injectable
class GetNotificationListUseCase {
  GetNotificationListRepo getNotificationListRepo;

  GetNotificationListUseCase(this.getNotificationListRepo);

  Future<ApiResult<NotificationListEntity>> getNotifications() {
    return getNotificationListRepo.getNotifications();
  }
}
