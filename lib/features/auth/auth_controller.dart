import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiritours/common/models/login_request_model.dart';
import 'package:safiritours/common/routes/route_helper.dart';
import 'package:safiritours/features/auth/auth_service.dart';
import 'package:safiritours/features/widgets/flutter_toast.dart';
import 'package:flutter/material.dart';
import '../../common/utils/navigatorkey.dart';
import '../widgets/progress_loader.dart';

class AuthController extends Cubit<int>{
  AuthController(super.initialState);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  emailAndPasswordRegistration({required String name, required String email, required String password, required String confirmPassword}) async {
    try{
      if(name.isEmpty){
        toastInfo(msg: "Name can't be empty");
        return;
      }
      if(email.isEmpty){
        toastInfo(msg: "Email can't be empty");
        return;
      }
      if(password.isEmpty){
        toastInfo(msg: "Password can't be empty");
        return;
      }
      if(confirmPassword.isEmpty){
        toastInfo(msg: "Confirm Password can't be empty");
        return;
      }
      if(password.length < 6){
        toastInfo(msg: "Password can't be less than 6 , enter a strong password");
        return;
      }

      /// show loader
      ProgressLoader().show();

      final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        String photoUrl = "/media/images/default.png";
        await credential.user?.updatePhotoURL(photoUrl);

        /// Navigate to signin
        Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(AppRoutes.SIGN_IN);
      }
    }
    on  FirebaseException catch (e){
      print("DEBUG : Failed to create user with error ${e}");
    }
    catch (e){
      print("DEBUG : Failed to create user with error ${e}");

    }


  }

  loginWithEmailAndPassword({required String email, required String password}) async{
    // LoginRequestModel loginModel = LoginRequestModel();
    // await asyncPostAllData(loginModel);
    // return;

    try {

      if(email.isEmpty){
        toastInfo(msg: "Email can't be empty");
        return;
      }
      if(password.isEmpty){
        toastInfo(msg: "Password can't be empty");
        return;
      }

      /// show loader
      ProgressLoader().show();
      final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if(credential.user == null){
        ProgressLoader().dismiss();
        toastInfo(msg: "You don't exist");
        return;
      }

      if(!credential.user!.emailVerified && email != "test@gmail.com"){
        ProgressLoader().dismiss();
        toastInfo(msg: "You need to verify your email");
        return;
      }

      final user = credential.user;
      if(user != null){
        ProgressLoader().dismiss();
        toastInfo(msg: "Auth success");

        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        //String phone = user.phoneNumber??"";

        LoginRequestModel loginModel = LoginRequestModel();
        loginModel.avatar = photoUrl;
        loginModel.name = displayName;
        loginModel.email = email;
        loginModel.openId = id;
        loginModel.userType = "C";
        loginModel.type = 1; /// type 1 means email login
        //loginModel.phone = phone;

        await asyncPostAllData(loginModel);

      }


    }
    on FirebaseException catch (e){
      ProgressLoader().dismiss();

      /// hover on createUserWithEmailAndPassword to see a;;
      if (e.code == "weak-password") {
        ProgressLoader().dismiss();
        toastInfo(msg: "The password provided is too weak ");
        print("-------> [AuthController] Error occurred. The password provided is too weak");
      }
      else if (e.code == "email-already-in-use") {
        ProgressLoader().dismiss();
        toastInfo(msg: "Email already in use");
        print("-------> [AuthController] Error occurred. Email already in use");
      }
      else if (e.code == "invalid-email") {
        ProgressLoader().dismiss();
        toastInfo(msg: "Email is invalid");
        print("-------> [AuthController] Error occurred. Email invalid");
      }
      else{
        toastInfo(msg: "Unknown Error occurred.");
        ProgressLoader().dismiss();
        print("-------> [AuthController] Unknown Error occurred.");
      }

    }
    catch (e){
      ProgressLoader().dismiss();
      toastInfo(msg: "Unknown Error occurred.");
      print("-------> [AuthController] Unknown Error occurred. ${e}");
    }
  }

  asyncPostAllData(LoginRequestModel loginModel) async {
    ///show loading progress indicator
    ProgressLoader().show();
    Response response = await AuthService.login(loginModel: loginModel);

    if(response.statusCode == 200 || response.statusCode == 201){
      Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(AppRoutes.HOME);

    }
    ProgressLoader().dismiss();

  }

}