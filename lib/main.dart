import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flower_ecommerce_app_team5/core/bases/base_inherited_widget.dart';
import 'package:flower_ecommerce_app_team5/core/di/injectable_initializer.dart';
import 'package:flower_ecommerce_app_team5/core/routing/generate_route.dart';
import 'package:flower_ecommerce_app_team5/core/themes/app_themes.dart';
import 'package:flower_ecommerce_app_team5/core/utilities/dio/dio_service/dio_service.dart';
import 'package:flower_ecommerce_app_team5/modules/firebase_cloud_messaging/data/apis/local_notifications_api.dart';
import 'package:flower_ecommerce_app_team5/core/validation/validation_functions.dart';
import 'package:flower_ecommerce_app_team5/firebase_options.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/firebase_cloud_messaging/data/apis/firebase_cloud_messaging_api.dart';
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
GlobalKey<NavigatorState> globalKeyNavigator = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  // // registering NavigatorState globalKey that will be given for MaterialApp()
  // getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
  //       () {
  //     return GlobalKey<NavigatorState>();
  //   },
  // );
  await getIt.get<LocalNotificationsService>().init();
  await getIt.get<FirebaseCloudMessagingAPi>().initNotifications();
  final loginUseCase = getIt.get<LoginUseCase>();
  final rememberValue = await loginUseCase.getCachedRememberValue();
  if (!rememberValue) {
    await loginUseCase.deleteLoginInfo();
    await loginUseCase.deleteCachedRememberValue();
  } else {
    storedLoginInfo = await loginUseCase.getStoredLoginInfo();
    DioServiceExtension.updateDioWithToken(storedLoginInfo?.token ?? '');
  }
  LocalizationManager localizationManager = getIt.get<LocalizationManager>();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (FlutterErrorDetails flutterErrorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(flutterErrorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(BlocProvider(
    create: (context) => getIt<CartCubit>(),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => localizationManager,
        ),
        ChangeNotifierProvider(
          create: (context) => getIt.get<HomeScreenViewModel>(),
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
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationManager>(
      builder: (context, localizationManager, child) {
        return BaseInheritedWidget(
          theme: AppThemes.lightTheme,
          screenWidth: MediaQuery.of(context).size.width,
          screenHeight: MediaQuery.of(context).size.height,
          easyLocalization: EasyLocalization.of(context)!,
          localizationManager: getIt.get<LocalizationManager>(),
          validateFunctions: ValidateFunctions.getInstance(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: globalKeyNavigator,//getIt.get<GlobalKey<NavigatorState>>(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppThemes.lightTheme,
            themeMode: ThemeMode.light,
            onGenerateRoute: GenerateRoute.onGenerateRoute,
            onGenerateInitialRoutes: (initialRoute) =>
                GenerateRoute.onGenerateInitialRoutes(
              initialRoute: initialRoute,
              loginInfo: storedLoginInfo,
            ),
          ),
        );
      },
    );
  }
}
