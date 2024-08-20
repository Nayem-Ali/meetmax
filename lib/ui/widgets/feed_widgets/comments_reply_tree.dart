import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/ui/widgets/shared_widgets/boxDecotation.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';

import '../../../constant/app_strings.dart';
import '../../../model/post_model.dart';

String getTime(String date) {
  final format = DateFormat("dd-MM-yyyy h:mm a");
  int time = format.parse(date).difference(DateTime.now()).inHours.abs();
  return time <= 24 ? "${time}h." : "${time ~/ 24}d.";
}

Widget postComment(List<PostComment> comments) {
  return Container(
    height: 150.h,
    color: AppColors.grayColor.withOpacity(0.1),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
    child: ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        PostComment postComment = comments[index];
        // print(comment.reply)
        return CommentTreeWidget(
          Comment(
            avatar: postComment.avatar,
            userName: postComment.name,
            content: postComment.text,
          ),
          postComment.reply!
              .map(
                (e) => Comment(
                  avatar: e.avatar,
                  userName: e.name,
                  content: e.text,
                ),
              )
              .toList(),
          treeThemeData: TreeThemeData(lineColor: AppColors.grayColor.withOpacity(0)),
          avatarRoot: (context, data) => PreferredSize(
            preferredSize: const Size.fromRadius(18),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(data.avatar ?? AppIconPath.logoPath),
            ),
          ),
          avatarChild: (context, data) => PreferredSize(
            preferredSize: const Size.fromRadius(12),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(data.avatar ?? AppIconPath.logoPath),
            ),
          ),
          contentChild: (context, data) {
            return commentTile(postComment, data);
          },
          contentRoot: (
            context,
            data,
          ) {
            return commentTile(postComment, data, isChild: false);
          },
        );
      },
    ),
  );
}

Widget commentTile(PostComment postComment, Comment data, {bool isChild = true}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: boxDecoration(radius: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customizedText(
                      data.userName ?? "User",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    customizedText(getTime(postComment.time),
                        fontSize: 12, color: AppColors.grayColor.withOpacity(0.7)),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AppIconPath.otherIcon,
                    scale: 3,
                  ),
                )
              ],
            ),
            if (isChild)
              Container(
                padding: const EdgeInsets.all(5),
                // margin: const EdgeInsets.all(5),
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.grayColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customizedText(
                      "Replying to ${postComment.name}",
                      color: AppColors.grayColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    customizedText(
                      postComment.text,
                      color: AppColors.grayColor.withOpacity(0.8),
                      fontSize: 12,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
            customizedText(
              "${data.content}",
              color: AppColors.grayColor,
              fontSize: 14,
              overflow: TextOverflow.visible,
            )
          ],
        ),
      ),
      DefaultTextStyle(
        style: const TextStyle(color: AppColors.grayColor),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Text("Like"),
              ),
              SizedBox(width: 20.w),
              InkWell(
                onTap: () {},
                child: const Text("Reply"),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
