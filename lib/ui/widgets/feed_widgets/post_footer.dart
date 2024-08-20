
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_colors.dart';
import '../shared_widgets/custom_txt_styles.dart';

Widget postFooter(List likes, int comments, int share) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      children: [
        SizedBox(
          width: 100.w,
          height: 20.h,
          child: ListView.builder(
            itemCount: likes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index < 3) {
                return Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grayColor,
                  ),
                  child: Center(
                    child: customizedText(
                      likes[index][0],
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.grayColor,
                  ),
                  child: customizedText(
                    "+${likes.length > 10 ? 9 : likes.length- 3}",
                    color: Colors.white,
                  ),
                );
              }
            },
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: customizedText("$comments Comments",
              fontSize: 14),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: customizedText("$share Share", fontSize: 14),
        ),
      ],
    ),
  );
}