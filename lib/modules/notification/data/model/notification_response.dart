import '../../domain/entity/notification_entity.dart';

class NotificationListResponseDto {
  NotificationListResponseDto({
    required this.message,
    required this.metadata,
    required this.notifications,
  });

  final String? message;
  final Metadata? metadata;
  final List<Notification> notifications;

  factory NotificationListResponseDto.fromJson(Map<String, dynamic> json) {
    return NotificationListResponseDto(
      message: json["message"],
      metadata:
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      notifications: json["notifications"] == null
          ? []
          : List<Notification>.from(
              json["notifications"]!.map((x) => Notification.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "metadata": metadata?.toJson(),
        "notifications": notifications.map((x) => x.toJson()).toList(),
      };

  NotificationListEntity toEntity() => NotificationListEntity(
        message: message,
        metadata: metadata?.toEntity(),
        notifications: notifications.map((n) => n.toEntity()).toList(),
      );
}

class Metadata {
  Metadata({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      currentPage: json["currentPage"],
      totalPages: json["totalPages"],
      limit: json["limit"],
      totalItems: json["totalItems"],
    );
  }

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "totalPages": totalPages,
        "limit": limit,
        "totalItems": totalItems,
      };

  MetadataEntity toEntity() => MetadataEntity(
        currentPage: currentPage,
        totalPages: totalPages,
        limit: limit,
        totalItems: totalItems,
      );
}

class Notification {
  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json["_id"],
      title: json["title"],
      body: json["body"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "body": body,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  NotificationEntity toEntity() => NotificationEntity(
        id: id,
        title: title,
        body: body,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}
