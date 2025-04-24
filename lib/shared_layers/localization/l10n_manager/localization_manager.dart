import 'package:flower_ecommerce_app_team5/shared_layers/localization/constants/l10n_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  String currentLocale;
  final SecureStorageService _secureStorage;

  Future<void> Function(String newLocale)? changeLocaleOfEasyLocalization;
  LocalizationManager(this._secureStorage,
      @Named(L10nConstants.initCurrentLocal) this.currentLocale);

  /// Before Using this function don't forget to initialize the changeLocaleOfEasyLocalization attribute
  Future<void> changeLocal(String languageCode) async {
    currentLocale = languageCode;
    saveLocal(languageCode);
    if (changeLocaleOfEasyLocalization != null) {
      await changeLocaleOfEasyLocalization!(currentLocale);
    }
    // notifyListeners();
  }

  void saveLocal(String languageCode) {
    _secureStorage.setStringValue(StorageConstants.localeKey, languageCode);
  }

  Future<String?> getSavedLocal() async {
    var savedLocale =
        await _secureStorage.getStringValue(StorageConstants.localeKey);
    return savedLocale;
  }
}
