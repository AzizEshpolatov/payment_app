import 'package:flutter/material.dart';
import 'package:payment_app/screens/auth/login/login_screen.dart';
import 'package:payment_app/screens/local_auth/method_one/confirm_pin_screen.dart';
import 'package:payment_app/screens/local_auth/method_one/entry_pin_screen.dart';
import 'package:payment_app/screens/local_auth/method_one/set_pin_screen.dart';
import 'package:payment_app/screens/local_auth/method_two/touch_id_screen.dart';
import 'package:payment_app/screens/payment/payment.dart';
import 'package:payment_app/screens/security/security_screen.dart';
import 'package:payment_app/screens/splash/splash_screen.dart';
import 'package:payment_app/screens/tab/cart/add_cards.dart';
import 'package:payment_app/screens/tab/profile/update_user.dart';
import 'package:payment_app/screens/tab/tab_screen.dart';
import 'package:payment_app/screens/transfer/transfer_screen.dart';
import '../data/models/user_model.dart';
import 'auth/register_screen/register_screen.dart';
import 'no_internet/no_internet_screen.dart';
import 'on_boarding/on_boarding.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.tabRoute:
        return navigate(const TabScreen());

      case RouteNames.noInternetRoute:
        return navigate(NoInternetScreen(
            onInternetComeBack: settings.arguments as VoidCallback));

      case RouteNames.transferRoute:
        return navigate(const TransferScreen());

      case RouteNames.paymentRoute:
        return navigate(const PaymentScreen());

      case RouteNames.loginRoute:
        return navigate(const LoginScreen());

      case RouteNames.registerRoute:
        return navigate(const RegisterScreen());

      case RouteNames.onBoardingRoute:
        return navigate(const OnBoardingScreen());

      case RouteNames.updateUser:
        return navigate(UpdateUserScreen(
          userModel: settings.arguments as UserModel,
        ));
      case RouteNames.setPinRoute:
        return navigate(const SetPinScreen());
      case RouteNames.confirmPinRoute:
        return navigate(ConfirmPinScreen(
          pin: settings.arguments as String,
        ));
      case RouteNames.entryPinRoute:
        return navigate(const EntryPinScreen());
      case RouteNames.touchIdRoute:
        return navigate(const TouchIdScreen());

      case RouteNames.securityRoute:
        return navigate(const SecurityScreen());

      case RouteNames.addCards:
        return navigate(const AddCards());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String tabRoute = "/tab_route";
  static const String loginRoute = "/login_route";
  static const String registerRoute = "/register_route";
  static const String noInternetRoute = "/no_internet_route";
  static const String paymentRoute = "/payment_route";
  static const String transferRoute = "/transfer_route";
  static const String onBoardingRoute = "/on_boarding_route";
  static const String setPinRoute = "/setPinRoute_route";
  static const String confirmPinRoute = "/confirmPinRoute_route";
  static const String entryPinRoute = "/entryPinRoute_route";
  static const String touchIdRoute = "/touchId_route";
  static const String updateUser = "/update_user";
  static const String securityRoute = "/security";
  static const String addCards = "/addCard";
}
