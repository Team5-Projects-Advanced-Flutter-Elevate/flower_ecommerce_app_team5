class OccasionEntity {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  OccasionEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  @override
  String toString() {
    return '($id, $name, $slug, $image, $productsCount)';
  }
}
