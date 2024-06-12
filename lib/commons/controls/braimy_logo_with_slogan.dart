import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_color.dart';

Widget braimyLogoWithSlogan() {
  return RichText(
      text: TextSpan(children: [
    TextSpan(
      text: 'Braimy',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 46.sp,
        color: AppColor.white,
      ),
    ),
    TextSpan(
      text: '.',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 46.sp,
        color: Color(0xffFFA500),
      ),
    ),
    TextSpan(
      text: '\nCrack your Exams',
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14.h,
          color: AppColor.white,
          height: 0.1),
    )
  ]));
}
