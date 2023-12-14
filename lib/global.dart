import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiritours/common/services/storage_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';
//import 'package:safiritours/firebase_options.dart';

class Global{

  static late StorageService storageService;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      name: "SafiriTours",
      options: DefaultFirebaseOptions.currentPlatform
    );

    /// print fcm token
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(" ----------> [Global] FCM token $fcmToken");

    storageService = await StorageService().init();

  }
}