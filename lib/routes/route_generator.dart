import 'package:flutter/material.dart';
import 'package:starter_project/routes/app_routes.dart';
import 'package:starter_project/screens/auth/view/confirm/confirm_screen.dart';
import 'package:starter_project/screens/auth/view/signup/signup_screen.dart';
import 'package:starter_project/screens/initial/onboarding_screen.dart';
import '../screens/auth/view/login/login_screen.dart';
import '../screens/initial/splash_Screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case AppRoutes.signupScreen:
        return MaterialPageRoute(builder: (context) =>  SignupScreen());
      case AppRoutes.confirmScreen:
        return MaterialPageRoute(builder: (context) =>  ConfirmScreen());  
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(
      builder: ((context) => Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: const Center(
              child: Text("Page Not Available!"),
            ),
          )),
    );
  }
}
