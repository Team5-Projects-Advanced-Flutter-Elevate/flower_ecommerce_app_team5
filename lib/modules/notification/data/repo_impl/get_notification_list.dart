import 'package:flower_ecommerce_app_team5/modules/notification/data/data_source_contract/notification_list.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entity/notification_entity.dart';
import '../../domain/repo_contract/get_notification_list.dart';

@Injectable(as: GetNotificationListRepo)
class GetNotificationListRepoImpl implements GetNotificationListRepo {
  GetNotificationListOnlineDataSource getNotificationListOnlineDataSource;

  GetNotificationListRepoImpl(this.getNotificationListOnlineDataSource);
  @override
  Future<ApiResult<NotificationListEntity>> getNotifications() {
    // TODO: implement getNotifications
    return getNotificationListOnlineDataSource.getNotifications();
  }
}
