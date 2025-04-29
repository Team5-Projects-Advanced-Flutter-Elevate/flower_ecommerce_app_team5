import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/forget_password_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/reset_code_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/forget_password/view/reset_password_screen.dart';
import 'package:flower_ecommerce_app_team5/core/routing/defined_routes.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/data/models/login/login_response_dto.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/login/view/login_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/authentication/ui/register/view/register_view.dart';
import 'package:flower_ecommerce_app_team5/modules/best_seller/ui/best_seller_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/check_out/ui/widgets/track_order_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/firebase_cloud_messaging/ui/on_notification_opened_app.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/cart_response_entity/cart_response_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/edit_profile/ui/edit_profile_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/home/domain/entities/product_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/home/ui/home_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/occasion/ui/occasion_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/domain/entities/payment_request_parameters/payment_request_parameter_entity.dart';
import 'package:flower_ecommerce_app_team5/modules/payment/ui/checkout_session_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/product_details/ui/product_details_screen.dart';
import 'package:flower_ecommerce_app_team5/modules/search/search_screen.dart';
import 'package:flutter/material.dart';
import '../../modules/check_out/ui/check_out_view.dart';
import '../../modules/edit_profile/ui/change_password_screen.dart';
import '../../modules/home/ui/layouts/add_new_address/new_address_screen.dart';

class GenerateRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    var name = settings.name;
    switch (name) {
      // Put the Navigated Routes Her
      case DefinedRoutes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
        );
      case DefinedRoutes.resetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
        );
      case DefinedRoutes.resetCodeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ResetCodeScreen(),
        );
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
        return MaterialPageRoute<bool>(
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
      case DefinedRoutes.trackOrder:
        return MaterialPageRoute(
            builder: (context) => const TrackOrderScreen());
      case DefinedRoutes.addNewAddress:
        return MaterialPageRoute(
          builder: (context) => const NewAddressScreen(),
        );
      case DefinedRoutes.searchScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case DefinedRoutes.checkoutSessionScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CheckoutSessionScreen(
            paymentRequestParameters: args as PaymentRequestParametersEntity,
          ),
        );
      case DefinedRoutes.onNotificationOpenedApp:
        return MaterialPageRoute(
          builder: (context) => OnNotificationOpenedApp(
            notification: args as RemoteNotification,
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
                const HomeScreen() //HomeScreen(authEntity: storedAuthEntity),
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
