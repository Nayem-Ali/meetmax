import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/ui/widgets/feed_widgets/comment_form.dart';
import 'package:meetmax/ui/widgets/feed_widgets/comments_reply_tree.dart';
import 'package:meetmax/ui/widgets/feed_widgets/post_footer.dart';
import 'package:meetmax/ui/widgets/feed_widgets/post_header.dart';
import 'package:meetmax/ui/widgets/feed_widgets/recent_events.dart';

import '../../../constant/app_colors.dart';

import '../shared_widgets/boxDecotation.dart';
import '../shared_widgets/custom_txt_styles.dart';
import 'activity_options.dart';
import 'media_gird_view.dart';

class PostBody extends StatelessWidget {
  // final Post postData;
  PostBody({Key? key}) : super(key: key);
  final _postController = Get.find<PostController>();
  int k = 0;
  String getTime(String date) {
    final format = DateFormat("dd-MM-yyyy h:mm a");
    int time = format.parse(date).difference(DateTime.now()).inHours.abs();
    return time <= 24 ? "${time}h." : "${time ~/ 24}d.";
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
      stream: _postController.getPosts(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Column(
            children: snapshot.data!.map((postData) {
              return Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(8.0),
                decoration: boxDecoration(),
                child: Column(
                  children: [
                    postHeader(
                      postData.avatar,
                      postData.author,
                      getTime(postData.time),
                      postData.visibility,
                    ),
                    if (postData.caption!.isNotEmpty)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: customizedText(
                            postData.caption!,
                            fontSize: 14,
                            color: AppColors.grayColor.withOpacity(0.8),
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    if (postData.media!.isNotEmpty)
                      PostMediaGridView(
                        media: postData.media!,
                      ),
                    postFooter(
                      postData.likes!,
                      postData.comments!.length,
                      postData.share!,
                    ),
                    Container(color: AppColors.grayColor.withOpacity(0.5), height: 2),
                    activityOptions(postData.id),
                    Container(color: AppColors.grayColor.withOpacity(0.5), height: 2),
                    commentForm(postData.id),
                    if (postData.comments!.isNotEmpty) commentReplyTree(postData.comments!),
                    if(postData == snapshot.data!.first)
                      RecentEvents()
                  ],
                ),
              );
            }).toList(),
          );
          // return SizedBox(
          //   height: Get.height * 0.7,
          //   child: ListView.builder(
          //     // physics: NeverScrollableScrollPhysics(),
          //     itemCount: snapshot.data!.length,
          //     itemBuilder: (context, index) {
          //       Post postData = snapshot.data![index];
          //       return Container(
          //         margin: const EdgeInsets.symmetric(vertical: 10.0),
          //         padding: const EdgeInsets.all(8.0),
          //         decoration: boxDecoration(),
          //         child: Column(
          //           children: [
          //             postHeader(
          //               postData.avatar,
          //               postData.author,
          //               getTime(postData.time),
          //               postData.visibility,
          //             ),
          //             if (postData.caption!.isNotEmpty)
          //               Align(
          //                 alignment: Alignment.topLeft,
          //                 child: Padding(
          //                   padding: const EdgeInsets.only(left: 4.0),
          //                   child: customizedText(
          //                     postData.caption!,
          //                     fontSize: 14,
          //                     color: AppColors.grayColor.withOpacity(0.8),
          //                     overflow: TextOverflow.visible,
          //                     textAlign: TextAlign.justify,
          //                   ),
          //                 ),
          //               ),
          //             if (postData.media!.isNotEmpty)
          //               PostMediaGridView(
          //                 media: postData.media!,
          //               ),
          //             postFooter(
          //               postData.likes!,
          //               postData.comments!.length,
          //               postData.share!,
          //             ),
          //             Container(color: AppColors.grayColor.withOpacity(0.5), height: 2),
          //             postOptions(),
          //             Container(color: AppColors.grayColor.withOpacity(0.5), height: 2),
          //             commentOption(),
          //             if (postData.comments!.isNotEmpty) postComment(postData.comments!),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // );
        } else if (snapshot.connectionState != ConnectionState.waiting && snapshot.hasData) {
          return const Center(
            child: Text("Loading.."),
          );
        } else {
          return const Center(
            child: Text("Something went wrong"),
          );
        }
      },
    );
  }
}
