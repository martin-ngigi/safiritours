import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;

  BigText({
    required this.text,
    this.color = const Color(0xff000000),
    this.size,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Roboto",
          fontSize: size ?? 22,
          fontWeight: FontWeight.w900,
          color: color
      ),
    );
  }
}
