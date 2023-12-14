import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiritours/common/routes/route_helper.dart';
import 'package:safiritours/features/auth/auth_controller.dart';
import 'package:safiritours/features/splash/splash_controller.dart';
import 'package:safiritours/features/welcome/welcome_controller.dart';
import 'package:safiritours/features/welcome/welcome_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/utils/navigatorkey.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SplashController>(
              create: (context) => SplashController(0)
          ),
          BlocProvider<WelcomeController>(
              create: (context) => WelcomeController(0)
          ),
          BlocProvider<AuthController>(
              create: (context) => AuthController(0)
          ),
        ],
        child: ScreenUtilInit(
          // designSize: const Size(375, 812), /// Default size
          designSize: const Size(375, 800),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,
            title: 'SafiriTours',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: AppRoutes.SPLASH,
            routes: AppRoutes().routes(),
            // home: FormValidate(),
          ),
        )
    );
  }
}
