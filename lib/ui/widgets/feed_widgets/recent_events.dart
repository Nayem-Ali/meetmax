import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/ui/widgets/feed_widgets/event_data.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';

import '../../../constant/app_colors.dart';

class RecentEvents extends StatelessWidget {
  RecentEvents({Key? key}) : super(key: key);
  final _postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _postController.getEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    customizedText("Recent Events", fontWeight: FontWeight.bold),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppIconPath.otherIcon,
                        scale: 3,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2,
                  color: AppColors.grayColor.withOpacity(0.4),
                ),
                Column(
                  children: snapshot.data!.map((e) {
                    return InkWell(
                      onTap: () {},
                      child: eventData(AppColors.greenColor, e.icon, e.title, e.description, e.seen),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
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
