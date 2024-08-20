import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/ui/style/app_styles.dart';

import '../../../constant/app_strings.dart';
import '../shared_widgets/custom_txt_button.dart';

Widget activityOptions(int postID) {
  final postController = Get.find<PostController>();
  RxBool like = false.obs;
  RxBool share = false.obs;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(() => Container(
            height: 35.h,
            color: like.value ? AppColors.blueColor.withOpacity(0.2) : Colors.transparent,
            child: customTxtButton(AppIconPath.heartIcon, "Like", () async {
              final response = await postController.addLike(postID);
              if (response['status'] == "success") {
                like.value = true;
                Get.showSnackbar(AppStyles().successMessage(response["message"]));
              } else {
                Get.showSnackbar(AppStyles().failedMessage(response["message"]));
              }
            }),
          )),
      SizedBox(
        height: 35.h,
        child: customTxtButton(
          AppIconPath.commentIcon,
          "Comments",
          () {},
        ),
      ),
      Obx(
        () => Container(
          height: 35.h,
          color: share.value ? AppColors.blueColor.withOpacity(0.2) : Colors.transparent,
          child: customTxtButton(
            AppIconPath.shareIcon,
            "Share",
            () async {
              final response = await postController.addShare(postID);
              if (response['status'] == "success") {
                share.value = true;
                Get.showSnackbar(AppStyles().successMessage(response["message"]));
              } else {
                Get.showSnackbar(AppStyles().failedMessage(response["message"]));
              }
            },
          ),
        ),
      ),
    ],
  );
}
