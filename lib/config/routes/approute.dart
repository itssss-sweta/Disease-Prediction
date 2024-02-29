import 'package:dis_pred/config/routes/route.dart';
import 'package:dis_pred/features/authentication/presentation/ui/loginscreen.dart';
import 'package:dis_pred/features/authentication/presentation/ui/signscreen.dart';
import 'package:dis_pred/features/authentication/presentation/ui/signupscreen.dart';
import 'package:dis_pred/features/authentication/presentation/ui/splashscreen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const SignScreen(),
          );
        }
      case Routes.splashScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        }
      case Routes.loginScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          );
        }
      // case Routes.homeScreen:
      //   {
      //     return MaterialPageRoute(
      //       builder: (context) => const SplashScreen(),
      //     );
      //   }
      case Routes.signupScreen:
        {
          return MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) => const SplashScreen(),
          );
        }
    }
  }
}
