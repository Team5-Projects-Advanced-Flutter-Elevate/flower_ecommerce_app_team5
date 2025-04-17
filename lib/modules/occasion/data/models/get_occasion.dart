import '../../domain/entities/get_occasion.dart';

class GetOccasionDTO {
  String? message;
  Metadata? metadata;
  List<Occasions>? occasions;

  GetOccasionDTO({this.message, this.metadata, this.occasions});

  GetOccasionDTO.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['occasions'] != null) {
      occasions = <Occasions>[];
      json['occasions'].forEach((v) {
        occasions!.add(Occasions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (occasions != null) {
      data['occasions'] = occasions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;

  Metadata({this.currentPage, this.limit, this.totalPages, this.totalItems});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['limit'] = limit;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    return data;
  }
}

class Occasions {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? productsCount;

  Occasions(
      {this.sId,
        this.name,
        this.slug,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.productsCount});

  Occasions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productsCount = json['productsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['productsCount'] = productsCount;
    return data;
  }

  Occasion toEntity() => Occasion(
    id: sId ?? '',
    name: name ?? '',
    slug: slug ?? '',
    image: image ?? '',
    productsCount: productsCount ?? 0,
  );
}



