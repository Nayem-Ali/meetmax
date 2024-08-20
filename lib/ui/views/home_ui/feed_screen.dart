import 'package:flutter/material.dart';
import 'package:meetmax/ui/widgets/feed_widgets/birthdays.dart';
import 'package:meetmax/ui/widgets/feed_widgets/post_body.dart';
import 'package:meetmax/ui/widgets/feed_widgets/story_head.dart';

import '../../widgets/feed_widgets/add_post.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryHead(),
          const AddPost(),
          PostBody(),
          Birthday()
        ],
      ),
    );
  }
}
