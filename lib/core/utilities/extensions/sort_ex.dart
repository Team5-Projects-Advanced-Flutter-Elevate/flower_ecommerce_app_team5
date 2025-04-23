enum Sort {
  newProduct('New Product', 'createdAt'),
  oldProduct('Old Product', '-createdAt'),
  lowPrice('Low Price', 'priceAfterDiscount'),
  highPrice('High Price', '-priceAfterDiscount'),
  alphaAZ('Name (A-Z)', 'title'),
  alphaZA('Name (Z-A)', '-title');

  const Sort(this.title, this.value);
  final String title;
  final String value;
}
