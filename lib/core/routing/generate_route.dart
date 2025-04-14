import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view/login_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view/register_view.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/best_seller_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/home_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/layouts/profile_layout/edite_profile_layout_view.dart';
import 'package:flutter/material.dart';

import '../../modules/home/ui/layouts/profile_layout/change_password_layout_view.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    switch (name) {
      case DefinedRoutes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
        );
      case DefinedRoutes.loginScreenRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        break;
      case DefinedRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case DefinedRoutes.bestSellerScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const BestSellerScreen(),
        );
      case DefinedRoutes.editProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const EditeProfileLayoutView(),
        );
      case DefinedRoutes.changePasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordLayoutView(),
        );
      default:
        return _errorRoute();
    }
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(
      {String? initialRoute,
      LoginResponseDto? loginInfo,
      bool rememberMe = false}) {
    return [
      if (loginInfo != null)
        MaterialPageRoute(
            builder: (context) =>
                const EditeProfileLayoutView() //HomeScreen(authEntity: storedAuthEntity),
            )
      else
        MaterialPageRoute(
          builder: (context) => const LoginScreen(), //const LoginScreen(),
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
