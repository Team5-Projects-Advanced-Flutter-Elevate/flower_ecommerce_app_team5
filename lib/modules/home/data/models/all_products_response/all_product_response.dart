class AllProductResponse {
  String? message;
  Metadata? metadata;
  List<Products>? products;

  AllProductResponse({this.message, this.metadata, this.products});

  AllProductResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
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
}

class Products {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;
  String? id;

  Products(
      {this.sId,
      this.title,
      this.slug,
      this.description,
      this.imgCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity,
      this.category,
      this.occasion,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.discount,
      this.sold,
      this.rateAvg,
      this.rateCount,
      this.id});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'].cast<String>();
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    discount = json['discount'];
    sold = json['sold'];
    rateAvg = json['rateAvg'];
    rateCount = json['rateCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['imgCover'] = imgCover;
    data['images'] = images;
    data['price'] = price;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['quantity'] = quantity;
    data['category'] = category;
    data['occasion'] = occasion;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['discount'] = discount;
    data['sold'] = sold;
    data['rateAvg'] = rateAvg;
    data['rateCount'] = rateCount;
    data['id'] = id;
    return data;
  }
}
