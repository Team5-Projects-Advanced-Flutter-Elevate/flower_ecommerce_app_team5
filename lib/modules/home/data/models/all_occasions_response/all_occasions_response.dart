import 'package:json_annotation/json_annotation.dart';

import '../common/meta_data.dart';
import 'occasion_dm.dart';

part 'all_occasions_response.g.dart';

@JsonSerializable()
class AllOccasionsResponse {
  AllOccasionsResponse({
    this.message,
    this.metadata,
    this.categories,
  });

  factory AllOccasionsResponse.fromJson(dynamic json) =>
      _$AllOccasionsResponseFromJson(json);

  String? message;
  Metadata? metadata;
  List<OccasionDM>? categories;

  Map<String, dynamic> toJson() => _$AllOccasionsResponseToJson(this);
}
