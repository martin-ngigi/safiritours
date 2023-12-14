import 'package:flutter/material.dart';
import 'package:safiritours/common/utils/navigatorkey.dart';
import 'package:safiritours/features/splash/splash_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late SplashController splashController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initSplash();
  }

  _initSplash(){
    splashController = BlocProvider.of<SplashController>(
        NavigationService.navigatorKey.currentContext!);
    splashController.checkFirstOpen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen"),
      ),
    );
  }
}
