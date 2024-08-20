import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../shared_widgets/custom_txt_styles.dart';
Row postHeader(String avatar, String author, String time, String visibility) {
  return Row(
    children: [
      CircleAvatar(
        radius: 20.r,
        backgroundImage: AssetImage(avatar),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customizedText(
              author,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            customizedText(
              "$time $visibility",
              fontSize: 12,
              color: AppColors.grayColor.withOpacity(0.5)
            ),
          ],
        ),
      ),
      const Spacer(),
      IconButton(
        onPressed: () {},
        icon: Image.asset(
          AppIconPath.otherIcon,
          scale: 3,
        ),
      ),
    ],
  );
}