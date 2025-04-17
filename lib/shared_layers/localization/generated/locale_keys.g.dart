import 'package:easy_localization/easy_localization.dart';

class LocaleKeys {
  // Error Messages
  static const ok = 'ok';
  static const confirm = 'confirm';
  static const connectionTimeout = 'connectionTimeout';
  static const sendTimeout = 'sendTimeout';
  static const receiveTimeout = 'receiveTimeout';
  static const cancel = 'cancel';
  static const connectionError = 'connectionError';
  static const unknown = 'unknown';
  static const badCertificate = 'badCertificate';
  static const somethingWentWrong = 'somethingWentWrong';

  // Validation Messages
  static const pleaseEnterName = 'pleaseEnterName';
  static const pleaseEnterUserName = 'pleaseEnterUserName';
  static const userNameLength = 'userNameLength';
  static const userNameRules = 'userNameRules';
  static const pleaseEnterFirstName = 'pleaseEnterFirstName';
  static const pleaseEnterLastName = 'pleaseEnterLastName';
  static const namesRules = 'namesRules';
  static const pleaseEnterEmail = 'pleaseEnterEmail';
  static const pleaseEnterValidEmail = 'pleaseEnterValidEmail';
  static const pleaseEnterPhoneNumber = 'pleaseEnterPhoneNumber';
  static const phoneNumberRules = 'phoneNumberRules';
  static const pleaseEnterPassword = 'pleaseEnterPassword';
  static const passwordLength = 'passwordLength';
  static const uppercaseRulePassword = 'uppercaseRulePassword';
  static const lowercaseRulePassword = 'lowercaseRulePassword';
  static const digitRulePassword = 'digitRulePassword';
  static const specialCharactersRulePassword = 'specialCharactersRulePassword';
  static const pleaseConfirmPassword = 'pleaseConfirmPassword';
  static const alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const genderFemale = 'genderFemale';
  static const genderMale = 'genderMale';
  static const gender = 'gender';
  static const agreeToTerms = 'agreeToTerms';
  static const terms = 'terms';
  static const conditions = 'conditions';
  static const registeredSuccessfully = 'registeredSuccessfully';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const confirmPassword = 'confirmPassword';
  static const phoneNumber = 'phoneNumber';
  static const noMatch = 'noMatch';

  // App Sections
  static const home = 'home';
  static const categories = 'categories';
  static const cart = 'cart';
  static const profile = 'profile';
  static const login = 'login';
  static const email = 'email';
  static const password = 'password';
  static const rememberMe = 'rememberMe';
  static const forgetPassword = 'forgetPassword';
  static const dontHaveAccount = 'dontHaveAccount';
  static const signUp = 'signUp';
  static const loginSuccess = 'loginSuccess';

  // Best Seller Section
  static const addToCart = 'addToCart';
  static const bloomWithBestSeller = 'bloomWithBestSeller';
  static const noProducts = 'noProducts';
  static const search = 'search';
  static const viewAll = 'viewAll';
  static const bestSeller = 'bestSeller';
  static const occasions = 'occasions';
  static const guestLogin = 'guestLogin';
  static const checkGuest = 'checkGuest';
  static const occsionScreenTitle = 'occsionScreenTitle';
  static const occasionScreenSubTitle = 'occasionScreenSubTitle';
  static const noProductsFound = 'noProductsFound';
  static const pleaseLoginFirst = 'pleaseLoginFirst';
  static const cartEmpty = 'cartEmpty';
  static const addItemsToCart = 'addItemsToCart';
  static const items = 'items';
  static const deletedSuccessfully = 'deletedSuccessfully';
  static const subTotal = 'subTotal';
  static const deliveryFee = 'deliveryFee';
  static const total = 'total';
  static const checkout = 'checkout';
  static const addedToCartSuccessfully = 'addedToCartSuccessfully';
  static const soldOut = 'soldOut';
  static const myOrders = 'myOrders';
  static const savedAddress = 'savedAddress';
  static const notification = 'notification';
  static const language = 'language';
  static const aboutUs = 'aboutUs';
  static const termsConditions = 'termsConditions';
  static const logout = 'logout';
  static const languageKey = 'languageKey';
  static const confirmLogout = 'confirmLogout';

  // Product Details Screen
  static const egp = 'egp';
  static const status = 'status';
  static const inStock = 'inStock';
  static const notInStock = 'notInStock';
  static const pricesIncludeTax = 'pricesIncludeTax';
  static const description = 'description';
  static const information = 'information';
  static const sold = 'sold';
  static const rate = 'rate';
  static const rateCount = 'rateCount';

  // Extension methods for easier access
  static String tr(String key, {List<String>? args}) => key.tr(args: args);
  static String plural(String key, num value, {List<String>? args}) => key.plural(value, args: args);
}