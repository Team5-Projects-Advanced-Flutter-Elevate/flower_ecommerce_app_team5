class ApisEndpoints {
  static const String baseUrl = 'https://flower.elevateegy.com/';
  static const String loginEndpoint = 'api/v1/auth/signin';
  static const String register = 'api/v1/auth/signup';
  static const String bestSellerEndpoint = 'api/v1/best-seller';
  static const String getCategories = 'api/v1/categories';
  static const String getOccasions = 'api/v1/occasions';
  static const String getProducts = 'api/v1/products';
  static const String occasion = 'api/v1/occasions';
  static const String getHomeData = 'api/v1/home';
  static const String getCartItems = 'api/v1/cart';
  static const String addToCart = 'api/v1/cart';
  static const String deleteFromCart = 'api/v1/cart/{id}';
  static const String uploadProfileImage = 'api/v1/auth/upload-photo';
  static const String editProfile = 'api/v1/auth/editProfile';
  static const String changePassword = 'api/v1/auth/change-password';
  static const String addNewAddress='api/v1/addresses';
}
