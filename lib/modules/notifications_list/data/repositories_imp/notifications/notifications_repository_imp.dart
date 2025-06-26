import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/data/data_sources_contract/notifications/notifications_remote_data_source.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/repositories_contracts/notifications/notifications_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotificationsRepo)
class NotificationsRepositoryImp implements NotificationsRepo {
  final NotificationsRemoteDataSource _notificationsRemoteDataSource;

  NotificationsRepositoryImp(this._notificationsRemoteDataSource);

  @override
  Future<ApiResult<NotificationsResponseEntity>> getAllNotifications(
      {String? sort}) {
    if (sort != null) {
      return _notificationsRemoteDataSource.getAllNotifications(sort: sort);
    }
    return _notificationsRemoteDataSource.getAllNotifications();
  }
}
