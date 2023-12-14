import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiritours/common/routes/route_helper.dart';

import '../../common/utils/navigatorkey.dart';
import '../../global.dart';

class SplashController extends Cubit<int>{
  SplashController(super.initialState);

  checkFirstOpen() async {
    await Future.delayed(const Duration(microseconds: 1));

    bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
    if(deviceFirstOpen){
      bool isLoggedIn = Global.storageService.getIsLoggedIn();
      if(isLoggedIn){
        /// user is logged in, take them to dashboard

      }
      else{
        /// user is not logged in, take them to SignInView
        Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);

      }
    }
    else{
      /// First time the user is opening the app, show welcome screen
      Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamedAndRemoveUntil(AppRoutes.WELCOME, (route) => false);
    }
  }
}