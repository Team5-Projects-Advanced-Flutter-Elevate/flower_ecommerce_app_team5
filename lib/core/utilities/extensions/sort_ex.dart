enum Sort {
  newProduct('الاحدث', 'New ', 'createdAt'),
  oldProduct('الاقدم', 'Old ', '-createdAt'),
  lowPrice('الاعلي سعرا', 'Low Price', 'priceAfterDiscount'),
  highPrice('الاقل سعرا', 'High Price', '-priceAfterDiscount'),
  alphaAZ('الابجديه تصاعدي', 'Name (A-Z)', 'title'),
  alphaZA('الابجديه تنازلي', 'Name (Z-A)', '-title');

  const Sort(this.titleA, this.title, this.value);
  final String titleA;
  final String title;
  final String value;
}
