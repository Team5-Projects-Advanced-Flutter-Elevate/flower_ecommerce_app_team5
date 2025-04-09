import 'package:json_annotation/json_annotation.dart';

import '../common/meta_data.dart';
import 'category_dm.dart';

part 'all_categories_response.g.dart';

@JsonSerializable()
class AllCategoriesResponse {
  AllCategoriesResponse({
    this.message,
    this.metadata,
    this.categories,
  });

  factory AllCategoriesResponse.fromJson(dynamic json) =>
      _$AllCategoriesResponseFromJson(json);

  String? message;
  Metadata? metadata;
  List<CategoryDM>? categories;

  Map<String, dynamic> toJson() => _$AllCategoriesResponseToJson(this);
}
