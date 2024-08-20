import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../shared_widgets/boxDecotation.dart';
import '../shared_widgets/custom_txt_button.dart';
import '../shared_widgets/custom_txt_styles.dart';
import '../shared_widgets/custome_elevated_button.dart';
import 'my_post.dart';

class PostCreation extends StatelessWidget {
  const PostCreation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102.h,
      padding: const EdgeInsets.all(10),
      decoration: boxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(AppImagePath.profileImg),
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    const MyPost(),
                  );
                },
                child: Container(
                  height: 40.h,
                  width: Get.width * 0.80,
                  margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.grayColor.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
                    child: customizedText("What's Happening?", fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                SizedBox(
                  height: 30.h,
                  child: customTxtButton(AppIconPath.liveIcon, "Live", () {}),
                ),
                SizedBox(
                  height: 30.h,
                  child: customTxtButton(AppIconPath.pictureIcon, "Photo", () {}, scale: 4),
                ),
                SizedBox(
                  height: 30.h,
                  child: customTxtButton(AppIconPath.smileIcon, "Feelings", () {}, scale: 4),
                ),
                const Spacer(),
                Container(
                  width: 75.w,
                  height: 30.h,
                  margin: EdgeInsets.only(right: 5.w),
                  child: customElevatedButton("Post", () {}, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
