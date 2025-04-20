import 'package:flutter/material.dart';

import '../../app/auth/screens/create_password_screen.dart';
import '../../app/auth/screens/forget_password_screen.dart';
import '../../app/auth/screens/login_screen.dart';
import '../../app/auth/screens/verify_otp_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case LoginScreenUI.route:
        return MaterialPageRoute(
          builder: (context) => const LoginScreenUI(),
        );
      case ForgetPassword.route:
        return MaterialPageRoute(
          builder: (context) => const ForgetPassword(),
        );
      case VerifyOtpScreen.route:
        return MaterialPageRoute(
          builder: (context) => const VerifyOtpScreen(),
        );
      case CreatePasswordScreen.route:
        return MaterialPageRoute(
          builder: (context) => const CreatePasswordScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
