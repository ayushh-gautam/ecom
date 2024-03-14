import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? content;
  double? size;
  FontWeight? fontweight;
  Color? color;

  CustomText({
    super.key,
    this.content,
    this.size,
    this.fontweight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? '',
      style: TextStyle(
          fontSize: size ?? 18,
          fontWeight: fontweight ?? FontWeight.w500,
          color: color ?? Colors.black),
    );
  }
}
