import 'package:flower_ecommerce_app_team5/core/apis/api_executor/api_executor.dart';
import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/api/api_client/notifications_api_client.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/data_sources_contract/notifications/notifications_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/models/notifications/notifications_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImp
    implements NotificationsRemoteDataSource {
  final NotificationsApiClient _notificationsApiClient;

  NotificationsRemoteDataSourceImp(this._notificationsApiClient);

  @override
  Future<ApiResult<NotificationsResponseEntity>> getAllNotifications(
      {String? sort}) async {
    var apiResult = await ApiExecutor.executeApi(
      () {
        if (sort != null) {
          return _notificationsApiClient.getAllNotifications(sort: sort);
        }
        return _notificationsApiClient.getAllNotifications();
      },
    );
    switch (apiResult) {
      case Success<NotificationsResponseDto>():
        return Success(data: apiResult.data.convertIntoEntity());
      case Error<NotificationsResponseDto>():
        return Error(error: apiResult.error);
    }
  }
}
