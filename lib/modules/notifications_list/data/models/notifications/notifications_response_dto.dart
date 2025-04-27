import 'package:flower_ecommerce_app_team5/modules/notifications_list/domain/entities/notifications/notifications_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_response_dto.g.dart';

/// message : "success"
/// metadata : {"currentPage":1,"totalPages":1,"limit":40,"totalItems":1}
/// notifications : [{"_id":"680c060f1433a666c8d55a27","title":"this is notification title5","body":"notification body...","createdAt":"2025-04-25T22:00:47.173Z","updatedAt":"2025-04-25T22:00:47.173Z","__v":0}]
@JsonSerializable(createToJson: false)
class NotificationsResponseDto {
  NotificationsResponseDto({
    this.message,
    this.metadata,
    this.notifications,
  });

  factory NotificationsResponseDto.fromJson(dynamic json) =>
      _$NotificationsResponseDtoFromJson(json);
  String? message;
  MetadataDto? metadata;
  List<NotificationDto>? notifications;

  NotificationsResponseEntity convertIntoEntity() {
    return NotificationsResponseEntity(
        message: message,
        metadata: metadata?.convertIntoEntity(),
        notifications: notifications?.map(
          (notification) {
            return notification.convertIntoEntity();
          },
        ).toList());
  }
}

/// _id : "680c060f1433a666c8d55a27"
/// title : "this is notification title5"
/// body : "notification body..."
/// createdAt : "2025-04-25T22:00:47.173Z"
/// updatedAt : "2025-04-25T22:00:47.173Z"
/// __v : 0
@JsonSerializable(createToJson: false)
class NotificationDto {
  NotificationDto({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory NotificationDto.fromJson(dynamic json) =>
      _$NotificationDtoFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  @JsonKey(name: '__v')
  num? v;

  NotificationsEntity convertIntoEntity() {
    return NotificationsEntity(
      id: id,
      title: title,
      body: body,
    );
  }
}

/// currentPage : 1
/// totalPages : 1
/// limit : 40
/// totalItems : 1
@JsonSerializable(createToJson: false)
class MetadataDto {
  MetadataDto({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  factory MetadataDto.fromJson(dynamic json) => _$MetadataDtoFromJson(json);
  num? currentPage;
  num? totalPages;
  num? limit;
  num? totalItems;

  MetadataEntity convertIntoEntity() {
    return MetadataEntity(
        currentPage: currentPage,
        totalPages: totalPages,
        limit: limit,
        totalItems: totalItems);
  }
}
