import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostMediaGridView extends StatelessWidget {
  final List<String> media;
  const PostMediaGridView({Key? key,required this.media}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: media.length > 1 ? 2 : 1,
        ),
        itemCount: media.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(media[index], scale: 2,),
          );
        },
      ),
    );
  }
}
