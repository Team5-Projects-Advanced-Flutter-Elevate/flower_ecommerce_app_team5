import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/repositories_contracts/notifications/notifications_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllNotificationsUseCase {
  final NotificationsRepo _notificationsRepo;

  GetAllNotificationsUseCase(this._notificationsRepo);

  Future<ApiResult<NotificationsResponseEntity>> call({String? sort}) {
    if (sort != null) return _notificationsRepo.getAllNotifications(sort: sort);
    return _notificationsRepo.getAllNotifications();
  }
}
