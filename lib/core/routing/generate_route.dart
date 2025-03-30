import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/forget_password_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/reset_code_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/reset_password_screen.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;

    switch (name) {
      // Put the Navigated Routes Her
      case DefinedRoutes.forgetPasswordScreenRoute :
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),);
      case DefinedRoutes.resetPasswordScreenRoute :
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen(),);
      case DefinedRoutes.resetCodeScreenRoute :
        return MaterialPageRoute(builder: (context) => ResetCodeScreen(),);
      default:
        return _errorRoute();
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
      {String? initialRoute,
      AuthenticationResponseEntity? storedAuthEntity,
      bool rememberMe = false}) {
    return [
      if (storedAuthEntity != null)
        MaterialPageRoute(
            builder: (context) =>
                const SizedBox() //HomeScreen(authEntity: storedAuthEntity),
            )
      else
        MaterialPageRoute(
            builder: (context) => const SizedBox() //const LoginScreen(),
            )
    ];
  }

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
