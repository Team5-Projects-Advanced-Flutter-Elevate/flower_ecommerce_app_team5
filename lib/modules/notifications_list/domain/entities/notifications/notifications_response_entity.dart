class NotificationsResponseEntity {
  NotificationsResponseEntity({
    this.message,
    this.metadata,
    this.notifications,
  });

  String? message;
  MetadataEntity? metadata;
  List<NotificationEntity>? notifications;
}
class NotificationEntity {
  NotificationEntity({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? title;
  String? body;
  String? createdAt;
  String? updatedAt;
  num? v;
}
class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  num? currentPage;
  num? totalPages;
  num? limit;
  num? totalItems;
}
