import 'package:equatable/equatable.dart';
import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';

enum Status { idle, loading, success, error }

class NotificationState extends Equatable {
  final Status notificationStatus;
  final List<NotificationEntity>? notifications;
  final Object? error;

  const NotificationState(
      {this.notificationStatus = Status.idle, this.notifications, this.error});

  @override
  List<Object?> get props => [notificationStatus,notifications,error];
}
