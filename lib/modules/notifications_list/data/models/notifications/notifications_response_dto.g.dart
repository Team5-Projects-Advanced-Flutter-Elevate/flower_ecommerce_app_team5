// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsResponseDto _$NotificationsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    NotificationsResponseDto(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDto.fromJson(json['metadata']),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map(NotificationDto.fromJson)
          .toList(),
    );

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as num?,
    );

MetadataDto _$MetadataDtoFromJson(Map<String, dynamic> json) => MetadataDto(
      currentPage: json['currentPage'] as num?,
      totalPages: json['totalPages'] as num?,
      limit: json['limit'] as num?,
      totalItems: json['totalItems'] as num?,
    );
