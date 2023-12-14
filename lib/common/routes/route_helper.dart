import 'package:flutter/cupertino.dart';
import 'package:safiritours/features/auth/login_view.dart';
import 'package:safiritours/features/auth/signup_view.dart';
import 'package:safiritours/features/splash/splash_screen.dart';
import 'package:safiritours/features/welcome/welcome_view.dart';

class AppRoutes{
  static const SPLASH = "/";
  static const WELCOME = "/Welcome";
  static const SIGN_IN = "/sign_in";
  static const SIGN_UP = "/sign_up";

  Map<String, WidgetBuilder> routes(){
    return {
      SPLASH: (context) => SplashScreen(),
      WELCOME: (context) => WelcomeView(),
      SIGN_IN: (context) => LoginView(),
      SIGN_UP: (context) => SignUpView(),
    };
  }
}