import 'package:flower_ecommerce_app_team5/core/routing/app_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view/register_view.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    switch (name) {
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
        );
      default:
        return _errorRoute();
    }
  }
  //
  // static List<Route<dynamic>> onGenerateInitialRoutes(
  //     {String? initialRoute,
  //     AuthenticationResponseEntity? storedAuthEntity,
  //     bool rememberMe = false}) {
  //   return [
  //     if (storedAuthEntity != null)
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               const SizedBox() //HomeScreen(authEntity: storedAuthEntity),
  //           )
  //     else
  //       MaterialPageRoute(
  //           builder: (context) => const RegisterView() //const LoginScreen(),
  //           )
  //   ];
  // }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Center(
          child: Container(
            color: Colors.red,
            child: const Text(
              "Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
