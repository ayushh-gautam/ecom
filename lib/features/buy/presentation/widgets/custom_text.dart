// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  double? size;
  FontWeight? fontweight;
  Color? color;
  int? maxlines;

  CustomText({
    Key? key,
    this.text,
    this.size,
    this.fontweight,
    this.color,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxlines ?? 3,
      softWrap: true,
      style: TextStyle(
          fontSize: size ?? 18,
          fontWeight: fontweight ?? FontWeight.w500,
          color: color ?? Colors.black),
    );
  }
}
