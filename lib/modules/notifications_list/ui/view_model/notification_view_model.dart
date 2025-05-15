import 'package:flower_ecommerce_app_team5/core/apis/api_result/api_result.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/use_cases/notifications/get_all_notifications_use_case.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/ui/view_model/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationViewModel extends Cubit<NotificationState> {
  final GetAllNotificationsUseCase _getAllNotificationsUseCase;

  NotificationViewModel(this._getAllNotificationsUseCase)
      : super(const NotificationState());

  void getAllNotifications() async {
    debugPrint("inside GetAllNotifications");
    emit(const NotificationState(notificationStatus: Status.loading));
    var useCaseResult = await _getAllNotificationsUseCase.call();
    debugPrint("After useCaseResult");
    switch (useCaseResult) {
      case Success<NotificationsResponseEntity>():
        debugPrint("Emitting Success");
        emit(NotificationState(
            notificationStatus: Status.success,
            notifications: useCaseResult.data.notifications));
        debugPrint("State is ${state.notificationStatus}");
      case Error<NotificationsResponseEntity>():
        emit(NotificationState(
            notificationStatus: Status.error, error: useCaseResult.error));
    }
  }
}
