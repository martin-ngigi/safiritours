import 'package:flutter/material.dart';
import 'package:safiritours/features/widgets/small_text.dart';

import '../../../common/values/colors.dart';

Widget build_sign_button({
  required String buttonName,
  required String icon,
  required VoidCallback onTapMethod,
  required BuildContext context,
  Color backgroundColor = AppColors.primaryColor,
  Color textColor = Colors.white,
}) {
  return GestureDetector(
    onTap: onTapMethod,
    child: Container(
      height: 50,
      // width: MediaQuery.of(context).size.width,
      width: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: Colors.grey.withOpacity(0.5)
          )
        ]
      ),
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(10),
            child: Image.asset(icon),
          ),

          /// buttonName
          Center(
            child: SmallText(text: buttonName, color: textColor,),
          ),
        ],
      ),
    ),
  );
}
