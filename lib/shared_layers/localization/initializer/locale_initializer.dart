import 'package:flower_ecommerce_app_team5/shared_layers/localization/constants/l10n_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/enums/languages_enum.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/constants/storage_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/storage/contracts/flutter_secure_storage_service_contract.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocaleInitializer {
  @preResolve
  @Named(L10nConstants.initCurrentLocal)
  Future<String> initCurrentLocal(
      SecureStorageService secureStorageService) async {
    var savedLocale =
        await secureStorageService.getStringValue(StorageConstants.localeKey);
    return savedLocale ?? LanguagesEnum.en.getLanguageCode();
  }
}
