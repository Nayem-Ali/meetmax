import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_txt_styles.dart';


ElevatedButton iconLabeledButton(String buttonName, String iconPath) {
  return  ElevatedButton.icon(
    onPressed: () {},
    icon: SizedBox(
      width: 20.w,
      child: Image.asset(
        iconPath,
      ),
    ),
    label: customizedText(
      buttonName,
      fontSize: 10.sp,
    ),
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        // maximumSize: Size(20.w,40.h)
    ),
  );
}