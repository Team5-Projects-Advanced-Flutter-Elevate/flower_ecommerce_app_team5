import 'package:bloc/bloc.dart';
import 'package:flower_ecommerce_app_team5/modules/notification/ui/cubit/states.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/apis/api_result/api_result.dart';
import '../../domain/entity/notification_entity.dart';
import '../../domain/usecase/get_notification_list_use_case.dart';

@injectable
class NotificationsViewModelCubit extends Cubit<NotificationState> {
  NotificationsViewModelCubit(this.getNotificationListUseCase)
      : super(NotificationInitial());
  final GetNotificationListUseCase getNotificationListUseCase;

  Future<void> _handleNotificationsList() async {
    emit(NotificationLoading());
    var data = await getNotificationListUseCase.getNotifications();
    switch (data) {
      case Success<NotificationListEntity>():
        emit(NotificationSuccess(data.data));
      case Error<NotificationListEntity>():
        emit(NotificationError(data.error.toString()));
    }
  }

  void processIntent(NotificationsIntent intent) {
    switch (intent) {
      case LoadNotificationsIntent():
        _handleNotificationsList();
    }
  }
}

sealed class NotificationsIntent {}

class LoadNotificationsIntent extends NotificationsIntent {}
