import 'package:json_annotation/json_annotation.dart';

part 'meta_data.g.dart';

@JsonSerializable()
class Metadata {
  Metadata({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory Metadata.fromJson(dynamic json) => _$MetadataFromJson(json);

  num? currentPage;
  num? limit;
  num? totalPages;
  num? totalItems;

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
