import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";

import '../../../constant/app_colors.dart';

Text customizedText(
  String content, {
  Color color = AppColors.grayColor,
  FontWeight fontWeight = FontWeight.normal,
  double fontSize = 16,
  TextOverflow overflow = TextOverflow.ellipsis,
      TextAlign textAlign = TextAlign.start
}) {
  return Text(
    content,
    style: GoogleFonts.roboto(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
    overflow: overflow,
    textAlign: textAlign,
  );
}
