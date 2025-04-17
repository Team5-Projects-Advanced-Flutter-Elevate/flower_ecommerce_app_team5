import 'package:easy_localization/easy_localization.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/core/routing/generate_route.dart';
import 'package:flower_ecommerce_app_team5/core/themes/app_themes.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/dio/dio_service/dio_service.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/cart_layout/view_model/cart_layout_view_model.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/view_model/home_screen_view_model.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/constants/l10n_constants.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/enums/languages_enum.dart';
import 'package:flower_ecommerce_app_team5/shared_layers/localization/l10n_manager/localization_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/utilities/bloc_observer/bloc_observer.dart';
import 'modules/authentication/domain/use_cases/login/login_use_case.dart';

LoginResponseDto? storedLoginInfo;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  storedLoginInfo = await getIt.get<LoginUseCase>().getStoredLoginInfo();
  DioServiceExtension.updateDioWithToken(storedLoginInfo?.token ?? '');
  LocalizationManager localizationManager = getIt.get<LocalizationManager>();
  runApp(BlocProvider(
    create: (context) => getIt<CartCubit>(),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => localizationManager,
        ),
      ChangeNotifierProvider(
        create: (context) => getIt.get<HomeScreenViewModel>(),
      )],
      child: EasyLocalization(
          supportedLocales: [
            Locale(LanguagesEnum.en.getLanguageCode()),
            Locale(LanguagesEnum.ar.getLanguageCode())
          ],
          path: L10nConstants.jsonFilesPath,
          fallbackLocale: Locale(LanguagesEnum.en.getLanguageCode()),
          startLocale: Locale(localizationManager.currentLocale),
          child: const MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationManager>(
      builder: (context, localizationManager, child) {
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
                  initialRoute: initialRoute, loginInfo: storedLoginInfo),
          //initialRoute: DefinedRoutes.bestSellerScreenRoute,
          // home: const OcassionListScreen(),
          // onGenerateRoute: GenerateRoute.onGenerateRoute,
          // onGenerateInitialRoutes: (initialRoute) =>
          //     GenerateRoute.onGenerateInitialRoutes(
          //         initialRoute: initialRoute, loginInfo: storedLoginInfo),
        );
      },
    );
  }
}
