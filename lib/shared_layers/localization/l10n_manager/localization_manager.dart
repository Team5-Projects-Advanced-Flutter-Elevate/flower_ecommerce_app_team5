import 'package:flower_ecommerce_app_team5/shared_layers/localization/constants/l10n_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocalizationManager extends ChangeNotifier {
  String currentLocale;
  final SecureStorageService _secureStorage;

  LocalizationManager(this._secureStorage,
      @Named(L10nConstants.initCurrentLocal) this.currentLocale);

  void changeLocal(String languageCode, String widgetName) {
    currentLocale = languageCode;
    saveLocal(languageCode, widgetName);
    notifyListeners();
  }

  void saveLocal(String languageCode, String widgetName) {
    _secureStorage.setStringValue(
        StorageConstants.localKey, languageCode, widgetName);
  }

  Future<String?> getSavedLocal(String widgetName) async {
    var savedLocale = await _secureStorage.getStringValue(
        StorageConstants.localKey, widgetName);
    return savedLocale;
  }
}
