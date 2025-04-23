enum Sort {
  newProduct('New Product', 'createdAt'),
  oldProduct('Old Product', '-createdAt'),
  lowPrice('Low Price', 'priceAfterDiscount'),
  highPrice('High Price', '-priceAfterDiscount'),
  discount('Discount', 'Discount');

  const Sort(this.title, this.value);
  final String title;
  final String value;
}
