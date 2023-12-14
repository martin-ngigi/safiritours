import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double? size;

  SmallText({
    required this.text,
    this.color = const Color(0xff9a9897),
    // this.size = 14,
    this.size,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 18,
        fontWeight: FontWeight.w300,
        fontFamily: "Roboto",
        color: color
      ),
    );
  }
}
