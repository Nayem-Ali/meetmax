import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/data/users.dart';
import 'package:meetmax/model/post_model.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../../../model/user_model.dart';
import '../../style/app_styles.dart';

Widget commentForm(int postID) {
  final postController = Get.find<PostController>();
  final key = GlobalKey<FormState>();
  final conterntController = TextEditingController();
  return Row(
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage(AppImagePath.profileImg),
      ),
      InkWell(
        onTap: () {},
        child: Container(
          height: 40.h,
          width: Get.width * 0.7,
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.grayColor.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Form(
                  key: key,
                  child: TextFormField(
                    controller: conterntController,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 8, bottom: 10),
                        errorStyle: const TextStyle(fontSize: 0),
                        hintText: "Write a Comment",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 14,
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // const Spacer(),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    AppIconPath.documentIcon,
                    scale: 3.5,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    AppIconPath.pictureIcon,
                    scale: 3.5,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    AppIconPath.smileIcon,
                    scale: 3.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.blueColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: IconButton(
          onPressed: () async {
            if (key.currentState!.validate()) {
              User user = User.fromJson(UserData().currentUser);
              PostComment comment = PostComment(
                name: user.name,
                avatar: user.photo!,
                time: DateFormat("dd-MM-yyyy h:mm a").format(DateTime.now()),
                text: conterntController.text.trim(),
                media: [],
                like: 0,
                reply: [],
              );
              final response = await postController.addComment(comment, postID);
              if (response['status'] == "success") {
                Get.showSnackbar(AppStyles().successMessage(response["message"]));
              } else {
                Get.showSnackbar(AppStyles().failedMessage(response["message"]));
              }
            } else {
              Get.showSnackbar(AppStyles().failedMessage("Write something or attach media"));
            }
          },
          icon: Image.asset(
            AppIconPath.sendIcon,
            scale: 3,
            color: AppColors.blueColor,
          ),
        ),
      ),
    ],
  );
}
