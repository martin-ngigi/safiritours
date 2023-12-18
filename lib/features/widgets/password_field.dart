import 'package:flutter/material.dart';

import '../../common/values/colors.dart';

Widget password_field({
  required String hintText,
  required IconData icon,
  required TextInputType textInputType,
  required int maxLines,
  required TextEditingController controller,
  required bool enabled, ///for password purposes
  required BuildContext context,
  void Function(String value)? onTextChange,


}){
  // final appTheme = AppTheme.of(context);
  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: TextFormField(
      // onChanged: (value) => onTextChange!(value),
      onChanged: onTextChange,
      obscureText: true,
      cursorColor: AppColors.primaryColor,
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      enabled: enabled,
      style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
          fontFamily: "Roboto",
          overflow: TextOverflow.ellipsis,
        // color: color
      ),
      decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          hintStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
              color: AppColors.primaryFourthElementText
            // color: color
          ),
          labelStyle:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontFamily: "Roboto",
              overflow: TextOverflow.ellipsis,
            color: AppColors.primaryFourthElementText
            // color: color
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(color: AppColors.primaryFourthElementText)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.primaryColor)
          ),
          // suffixIcon: isObsecure ?  Icon(Icons.edit, color: Colors.black,) : Container(),

          suffixIcon: Icon(Icons.lock, color: AppColors.primaryFourthElementText),
          alignLabelWithHint: true,
          // fillColor: appTheme.isDark ? Colors.grey : Colors.white,
          // filled: true
      ),
      validator: (value){
        if(value!.isEmpty){
          return "Field can't be empty";
        }
        return null;
      },
    ),
  );
}