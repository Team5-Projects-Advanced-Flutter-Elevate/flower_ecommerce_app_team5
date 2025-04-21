import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view/register_view.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view/login_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/best_seller_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/edit_profile_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/home_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/ui/occasion_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/check_out/ui/check_out_view.dart';
import '../../modules/edit_profile/ui/change_password_screen.dart';

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

      case DefinedRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case DefinedRoutes.bestSellerScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const BestSellerScreen(),
        );
      case DefinedRoutes.occasionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const OccasionListScreen(),
        );
      case DefinedRoutes.productDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) =>
              ProductDetailsScreen(productEntity: args as ProductEntity),
        );
      case DefinedRoutes.editProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case DefinedRoutes.changePasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen(),
        );

      case DefinedRoutes.checkOut:
        return MaterialPageRoute(
          builder: (context) => CheckOutView(
            cartResponseEntity: args as CartResponseEntity,
          ),
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
             const  HomeScreen()//HomeScreen(authEntity: storedAuthEntity),
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
