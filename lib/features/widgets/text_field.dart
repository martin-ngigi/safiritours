import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiritours/common/values/colors.dart';

Widget text_field({
  required String hintText,
  required IconData icon,
  required TextInputType textInputType,
  required int maxLines,
  required TextEditingController controller,
  required bool enabled,
  void Function(String value)? onTextChange,
}){
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: TextField(
      onChanged: (value) => onTextChange!(value),
      cursorColor: Colors.green,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      enabled: enabled,
      style: TextStyle(
          // fontSize: size ??14,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
          overflow: TextOverflow.ellipsis
        // color: color
      ),
      decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
              color: AppColors.primaryThirdElementText
            // color: color
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          hintStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
            color: AppColors.primaryThirdElementText
            // color: color
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryFourthElementText)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor)
          ),

          suffixIcon: enabled ? Icon(icon, color:AppColors.primaryFourthElementText) : null,
          alignLabelWithHint: true,
          // fillColor: Colors.grey[100],
          // filled: true
      ),
    ),
  );
}