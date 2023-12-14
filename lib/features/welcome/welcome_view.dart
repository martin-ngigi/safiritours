import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiritours/common/routes/route_helper.dart';
import 'package:safiritours/common/values/colors.dart';
import 'package:safiritours/common/values/constants.dart';
import 'package:safiritours/features/welcome/welcome_controller.dart';
import 'package:safiritours/features/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:safiritours/global.dart';

import '../../common/utils/navigatorkey.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  PageController pageController = PageController(initialPage: 0);
  late WelcomeController welcomeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    welcomeController = BlocProvider.of<WelcomeController>(
        NavigationService.navigatorKey.currentContext!);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeController, int>(
            builder: (context, state){
              return Container(
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    /// PageView will enable horizontal scroll
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        /// assign page index
                        //welcomeController.page = index;
                        welcomeController.updatePage(index);
                        //BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents()); /// This will update
                      },
                      children: [
                        /// first page
                        _page(1,
                            context,
                            "Next",
                            "Canvas of Adventure",
                            "In the journey of travel, every mile is a brushstroke on the canvas of your adventure, painting memories that last a lifetime.",
                            "assets/images/welcome/welcome1.png",
                        ),

                        /// second page
                        _page(2,
                            context,
                            "Next",
                            "Dance of the Traveler's Heart",
                            "Traveling is a love affair with life, where every step is a dance, and every destination is a new partner in the rhythm of your journey.",
                            "assets/images/welcome/welcome2.png",
                        ),

                        /// third page
                        _page(3,
                            context,
                            "Next",
                            "Human Connection Chronicles",
                            "The beauty of travel lies not just in the places you visit, but in the people you meet and the stories that unfold, turning a mere journey into a tapestry of human connection.",
                            "assets/images/welcome/welcome3.png",
                        ),

                        /// fourth page
                        _page(4,
                            context,
                            "Next",
                            "Wanderlust Echo",
                            "Wanderlust is the echo of your spirit calling you to explore, to wander into the realms where the soul feels most alive, and the heart beats to the rhythm of the world.",
                            "assets/images/welcome/welcome4.png",
                        ),
                      ],
                    ),


                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _page(int index,
      BuildContext context,
      String buttonName,
      String title,
      String subTitle,
      String imagePath,
      ){
    return Container(
      /// Background Image
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(
          //   Colors.black.withOpacity(0.5), // Adjust opacity as needed
          //   BlendMode.dstATop,
          // ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ///title text
            Container(
              child: Text(
                title,
                style: TextStyle(
                    // color: AppColors.primaryText,
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),

            SizedBox(height: 10.h,),

            /// sub-title
            Container(
              width: 375.w,
              child: Text(
                subTitle,
                style: TextStyle(
                    // color: AppColors.primarySecondaryElementText,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),

            SizedBox(height: 10.h,),

            /// Dots indicator
            DotsIndicator(
              position: welcomeController.page,
              dotsCount: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              decorator: DotsDecorator(
                  color: AppColors.primaryThirdElementText,
                  activeColor: AppColors.primaryColor,
                  size: Size.square(8),
                  activeSize: Size(25, 8),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
            ),

            /// Next button
            custom_button(
                buttonName: buttonName,
                onTapMethod: (){
                  /// within 0-3 index
                  if(index < 4){
                    /// animation
                    pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate
                    );

                  }
                  else{
                    /// save the value to true
                    Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
                    print("------> [Welcome]. Is Device first open ? ${Global.storageService.getDeviceFirstOpen()}");

                    /// navigate to SIGN_IN page
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
                  }
                },
                context: context
            ),

            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
