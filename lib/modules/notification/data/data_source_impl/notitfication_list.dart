import 'dart:developer';
import 'package:flower_ecommerce_app_team5/modules/notification/data/model/notification_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_executor/api_executor.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entity/notification_entity.dart';
import '../api/api_client/notification_api_client.dart';
import '../data_source_contract/notification_list.dart';

@Injectable(as: GetNotificationListOnlineDataSource)
class GetNotificationOnlineDataSourceImpl
    implements GetNotificationListOnlineDataSource {
  NotificationApiClient notificationApiClient;

  GetNotificationOnlineDataSourceImpl(this.notificationApiClient);
  @override
  Future<ApiResult<NotificationListEntity>> getNotifications() async {
    // TODO: implement getNotifications
    var apiResult = await ApiExecutor.executeApi<NotificationListResponseDto>(
      () async {
        return notificationApiClient.getNotifications();
      },
    );
    switch (apiResult) {
      case Success<NotificationListResponseDto>():
        log("Notifications ${apiResult.data.notifications}");

        return Success(data: apiResult.data.toEntity());
      case Error<NotificationListResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
