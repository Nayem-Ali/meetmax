import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/ui/widgets/feed_widgets/birthdays.dart';
import 'package:meetmax/ui/widgets/feed_widgets/post_creation.dart';
import 'package:meetmax/ui/widgets/feed_widgets/post_view.dart';
import 'package:meetmax/ui/widgets/feed_widgets/story_head.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryHead(),
          const PostCreation(),
          PostView(),
          Birthday()
        ],
      ),
    );
  }
}
