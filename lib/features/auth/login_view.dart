import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiritours/common/utils/navigatorkey.dart';
import '../../common/routes/route_helper.dart';
import '../../common/values/colors.dart';
import '../widgets/build_signin_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/password_field.dart';
import '../widgets/small_text.dart';
import '../widgets/text_field.dart';
import '../widgets/textform_field.dart';
import 'auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  late AuthController authController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initLogin();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  _initLogin(){
    authController = BlocProvider.of(NavigationService.navigatorKey.currentContext!);
  }


  @override
  Widget build(BuildContext buildContext) {
    return BlocBuilder<AuthController, int>(builder: (context, auth){
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            child: Stack(
              children: [
                /// Decoration image
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      // height: MediaQuery.of(context).size.height*5,
                      height: 260.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/login.png"),
                              fit: BoxFit.cover
                          )
                      ),
                    )
                ),
          
                /// Main content
                Positioned(
                    left: 0,
                    right: 0,
                    top: 230.h,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.r),
                            topLeft: Radius.circular(30.r),
                          ),
                          color: Colors.white
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
          
                            SmallText(
                              text: "First time you need \nto create an account",
                              color: AppColors.primaryColor,
                            ),
          
                            SizedBox(height: 20.h,),
          
                            /// Social media
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                /// Google
                                build_sign_button(
                                    buttonName: "Google",
                                    icon: "assets/icons/google.png",
                                    onTapMethod: (){
                                    },
                                    context: context,
                                    textColor: Colors.black,
                                    backgroundColor: AppColors.secondaryColor
                                ),
          
                                /// Facebook
                                build_sign_button(
                                    buttonName: "Facebook",
                                    icon: "assets/icons/facebook.png",
                                    onTapMethod: (){
          
                                    },
                                    context: context,
                                    textColor: Colors.black,
                                    backgroundColor: AppColors.secondaryColor
          
                                )
                              ],
                            ),
          
                            SizedBox(height: 20.h,),
          
                            ///email field
                            textform_field(
                                hintText: "email",
                                icon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                maxLines: 1,
                                controller: _emailcontroller,
                                enabled: true
                            ),

                            SizedBox(height: 10.h,),
          
                            ///password field
                            password_field(
                                hintText: "password",
                                // icon: Icons.remove_red_eye,
                                icon: Icons.key,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                controller: _passwordcontroller,
                                enabled: true,
                                context: context
                            ),
          
                            SizedBox(height: 20.h,),
          
                            /// Forgot password
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Text(
                                    "Forgot password ?",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                              ],
                            ),
          
                            SizedBox(height: 20.h,),
          
                            /// Login
                            custom_button(
                                buttonName: "Login",
                                onTapMethod: (){
                                  if(_formKey.currentState!.validate()){
                                    print("I am here");
                                    _formKey.currentState!.save();
                                    authController.loginWithEmailAndPassword(
                                        email: _emailcontroller.text.trim(),
                                        password: _passwordcontroller.text.trim()
                                    );
                                  }
                                },
                                context: context
                            ),
          
                            SizedBox(height: 20.h,),
          
                            RichText(
                              text: TextSpan(
                                  text: "Don\'t have an account ? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18
                                  ),
          
                                  children: [
                                    TextSpan(
                                      text: "Create",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.lightBlue,
                                          fontSize: 18
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {/// Navigate to register page
                                        Navigator.of(context).pushNamed(AppRoutes.SIGN_UP);
                                      },
          
                                    )
                                  ]
                              ),
                            )
          
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      );
    });

  }
}
