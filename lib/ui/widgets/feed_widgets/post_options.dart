

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_strings.dart';
import '../shared_widgets/custom_txt_button.dart';

Widget postOptions(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 35.h,
        child: customTxtButton(AppIconPath.heartIcon, "Like", () {}),
      ),
      SizedBox(
        height: 35.h,
        child: customTxtButton(
          AppIconPath.commentIcon,
          "Comments",
              () {},
        ),
      ),
      SizedBox(
        height: 35.h,
        child: customTxtButton(
          AppIconPath.shareIcon,
          "Share",
              () {},
        ),
      ),
    ],
  );
}