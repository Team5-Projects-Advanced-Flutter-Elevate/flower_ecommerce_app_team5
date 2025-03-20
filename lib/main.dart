import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/generate_route.dart';
import 'package:flower_ecommerce_app_team5/core/themes/app_themes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/constants/l10n_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/enums/languages_enum.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();

  LocalizationManager localizationManager = getIt.get<LocalizationManager>();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => localizationManager,
      )
    ],
    child: EasyLocalization(
        supportedLocales: [
          Locale(LanguagesEnum.en.getLanguageCode()),
          Locale(LanguagesEnum.ar.getLanguageCode())
        ],
        path: L10nConstants.jsonFilesPath,
        fallbackLocale: Locale(LanguagesEnum.en.getLanguageCode()),
        startLocale: Locale(localizationManager.currentLocale),
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: GenerateRoute.onGenerateRoute,
      onGenerateInitialRoutes: (initialRoute) =>
          GenerateRoute.onGenerateInitialRoutes(
              initialRoute: initialRoute,
              storedAuthEntity: AuthenticationResponseEntity()),
    );
  }
}
