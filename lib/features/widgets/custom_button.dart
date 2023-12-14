import 'package:flutter/material.dart';
import 'package:safiritours/common/values/colors.dart';
import 'package:safiritours/features/widgets/big_text.dart';

Widget custom_button({
  required String buttonName,
  required VoidCallback onTapMethod,
  required BuildContext context,
  Color backgroundColor = AppColors.primaryColor,
  Color textColor = Colors.white,
}){
  return GestureDetector(
    onTap: onTapMethod,
    child: Container(
      height: 50,
      // width: MediaQuery.of(context).size.width,
      width: 300,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      // margin: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: BigText(text: buttonName),
      ),
    ),
  );
}