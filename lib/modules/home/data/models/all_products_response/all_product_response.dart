import 'package:flower_ecommerce_app_team5/modules/home/data/models/product_do/product_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/all_product_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/metadata_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';

class AllProductResponse {
  String? message;
  Metadata? metadata;
  List<ProductDto>? products;

  AllProductResponse({this.message, this.metadata, this.products});

  AllProductResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['products'] != null) {
      products = <ProductDto>[];
      json['products'].forEach((v) {
        products!.add(ProductDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  AllProductResponseEntity convertIntoEntity() {
    return AllProductResponseEntity(
      message: message,
      metadata: metadata?.convertIntoEntity(),
      products: products
          ?.map<ProductEntity>((product) => product.convertIntoEntity())
          .toList(),
    );
  }
}

class Metadata {
  num? currentPage;
  num? totalPages;
  num? limit;
  num? totalItems;

  Metadata({this.currentPage, this.totalPages, this.limit, this.totalItems});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    limit = json['limit'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['limit'] = limit;
    data['totalItems'] = totalItems;
    return data;
  }

  MetadataEntity convertIntoEntity() {
    return MetadataEntity(
        currentPage: currentPage,
        totalPages: totalPages,
        limit: limit,
        totalItems: totalItems);
  }
}

