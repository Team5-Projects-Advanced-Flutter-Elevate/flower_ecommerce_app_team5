import '../../domain/entity/notification_entity.dart';

sealed class NotificationState {}

class NotificationLoading extends NotificationState {}
class NotificationInitial extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final NotificationListEntity data;

  NotificationSuccess(this.data);
}

class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);
}
