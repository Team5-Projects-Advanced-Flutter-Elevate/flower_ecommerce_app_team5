/// _id : "673e308c115992017182816d"
/// title : "Moko Chocolate Set | Esperance Rose"
/// slug : "moko-chocolate-set-or-esperance-rose"
/// description : "Indulge in the ultimate chocolate experience with the Moko Chocolate Bundle! This delightful assortment features the Moko Cranberry White Chocolate Dragee and three irresistible 41% Milk Chocolate Bars Crunchy Hazelnut, Salted Caramel, and Crunchy Pistachio Praline. Perfect for satisfying your sweet cravings or as a thoughtful gift for someone special. Enjoy premium flavors and quality with every bite. Don’t wait treat yourself or a loved one to this delectable chocolate bundle. Buy now and make every moment sweeter!"
/// imgCover : "aa6c2099-17db-4e81-85eb-2314cdaf31e8-cover_image.png"
/// images : ["081c1a80-67ae-4c5a-962b-894c9d32f6db-image_four.png","3a44160e-3a56-4aa5-91ae-b54ceb752f7d-image_one.png","c55c2f05-5d64-4086-b0be-3b383cee3fef-image_three.png","8b2708f3-4384-475e-b4e0-e7368b2a6e2f-image_two.png"]
/// price : 1200
/// priceAfterDiscount : 900
/// quantity : 33279
/// category : "673c479e1159920171827c99"
/// occasion : "673b39241159920171827b28"
/// createdAt : "2024-11-20T18:55:08.188Z"
/// updatedAt : "2025-05-08T15:33:41.100Z"
/// __v : 0
/// discount : 50
/// sold : 1055
class ProductDto {
  ProductDto({
    this.id,
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
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json["_id"],
      title: json["title"],
      slug: json["slug"],
      description: json["description"],
      imgCover: json["imgCover"],
      images:
      json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      price: json["price"],
      priceAfterDiscount: json["priceAfterDiscount"],
      quantity: json["quantity"],
      category: json["category"],
      occasion: json["occasion"],
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      v: json["__v"],
      discount: json["discount"],
      sold: json["sold"],
      rateAvg: json["rateAvg"],
      rateCount: json["rateCount"],
    );
  }

  String? id;
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
  num? v;
  num? discount;
  num? sold;
  num? rateAvg;
  num? rateCount;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (id != null) data['_id'] = id;
    if (title != null) data['title'] = title;
    if (slug != null) data['slug'] = slug;
    if (description != null) data['description'] = description;
    if (imgCover != null) data['imgCover'] = imgCover;
    if (images != null) data['images'] = images?.map((x) => x).toList();
    if (price != null) data['price'] = price;
    if (priceAfterDiscount != null) {
      data['priceAfterDiscount'] = priceAfterDiscount;
    }
    if (quantity != null) data['quantity'] = quantity;
    if (category != null) data['category'] = category;
    if (occasion != null) data['occasion'] = occasion;
    if (createdAt != null) data['createdAt'] = createdAt;
    if (updatedAt != null) data['updatedAt'] = updatedAt;
    if (v != null) data['__v'] = v;
    if (discount != null) data['discount'] = discount;
    if (sold != null) data['sold'] = sold;
    if (rateAvg != null) data['rateAvg'] = rateAvg;
    if (rateCount != null) data['rateCount'] = rateCount;
    return data;
  }

  static ProductDto convertIntoDto(ProductEntity? entity) {
    return ProductDto(
      id: entity?.id,
      title: entity?.title,
      slug: entity?.slug,
      description: entity?.description,
      imgCover: entity?.imgCover,
      images: entity?.images,
      price: entity?.price,
      priceAfterDiscount: entity?.priceAfterDiscount,
      quantity: entity?.quantity,
      category: entity?.category,
      occasion: entity?.occasion,
      createdAt: entity?.createdAt,
      updatedAt: entity?.updatedAt,
      v: entity?.v,
      discount: entity?.discount,
      sold: entity?.sold,
    );
  }

  ProductEntity convertIntoEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      discount: discount,
      sold: sold,
    );
  }
}