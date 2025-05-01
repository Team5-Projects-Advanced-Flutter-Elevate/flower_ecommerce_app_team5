class NotificationListEntity {
  final String? message;
  final MetadataEntity? metadata;
  final List<NotificationEntity> notifications;

  NotificationListEntity({
    required this.message,
    required this.metadata,
    required this.notifications,
  });
}

class MetadataEntity {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  MetadataEntity({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });
}

class NotificationEntity {
  final String? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });
}
