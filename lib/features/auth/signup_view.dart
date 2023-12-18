import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:safiritours/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safiritours/features/auth/auth_controller.dart';
import '../../common/routes/route_helper.dart';
import '../../common/utils/navigatorkey.dart';
import '../widgets/build_signin_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/password_field.dart';
import '../widgets/small_text.dart';
import '../widgets/text_field.dart';
import '../widgets/textform_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  late AuthController authController;
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initSignUp();
  }

  _initSignUp(){
    authController = BlocProvider.of(NavigationService.navigatorKey.currentContext!);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {

    return BlocBuilder<AuthController, int>(builder: (state, context){
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
                      width: MediaQuery.of(buildContext).size.width,
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
                                    context: buildContext,
                                    textColor: Colors.black,
                                    backgroundColor: AppColors.secondaryColor
                                ),

                                /// Facebook
                                build_sign_button(
                                    buttonName: "Facebook",
                                    icon: "assets/icons/facebook.png",
                                    onTapMethod: (){

                                    },
                                    context: buildContext,
                                    textColor: Colors.black,
                                    backgroundColor: AppColors.secondaryColor

                                )
                              ],
                            ),
                            SizedBox(height: 10.h,),

                            ///name field
                            textform_field(
                                hintText: "name",
                                icon: Icons.person,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                controller: _nameController,
                                enabled: true
                            ),

                            SizedBox(height: 10.h,),

                            ///email field
                            textform_field(
                                hintText: "email",
                                icon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                maxLines: 1,
                                controller: _emailController,
                                enabled: true
                            ),

                            SizedBox(height: 10.h,),

                            ///password field
                            password_field(
                                hintText: "Password",
                                // icon: Icons.remove_red_eye,
                                icon: Icons.key,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                controller: _passwordController,
                                enabled: true,
                                context: buildContext
                            ),

                            SizedBox(height: 10.h,),

                            ///rePassword field
                            password_field(
                              hintText: "Retype password",
                              // icon: Icons.remove_red_eye,
                              icon: Icons.key,
                              textInputType: TextInputType.text,
                              maxLines: 1,
                              controller: _rePasswordController,
                              enabled: true,
                              context: buildContext

                            ),

                            SizedBox(height: 20.h,),

                            /// Register
                            custom_button(
                                buttonName: "Register",
                                onTapMethod: (){
                                  if(_formKey.currentState!.validate()){
                                    print("I am here");
                                    // If the form is valid, save the input value
                                    _formKey.currentState!.save();

                                    authController.emailAndPasswordRegistration(
                                        name: _nameController.text.trim(),
                                        email: _emailController.text.toLowerCase().trim(),
                                        password: _passwordController.text.trim(),
                                        confirmPassword: _rePasswordController.text.trim()
                                    );

                                    return;
                                  }

                                },
                                context: buildContext
                            ),

                            SizedBox(height: 20.h,),

                            RichText(
                              text: TextSpan(
                                  text: "Already have an account ? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18
                                  ),

                                  children: [
                                    TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.lightBlue,
                                          fontSize: 18
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {/// Navigate to register page
                                        Navigator.of(buildContext).pushNamed(AppRoutes.SIGN_IN);

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
