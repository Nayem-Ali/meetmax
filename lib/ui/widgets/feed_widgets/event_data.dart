import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';

import '../../../constant/app_colors.dart';

Widget eventData(
    Color color, String iconPath, String title, String description, List<String> seen) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 8),
    decoration: BoxDecoration(
      color: AppColors.grayColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset(iconPath, scale: 2.5),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.6,
              child: Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grayColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(
              width: Get.width * 0.6,
              child: Text(
                description,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: AppColors.grayColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            if (seen.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: Get.width *0.6,
                child: const Divider(
                  height: 1,
                  color: AppColors.grayColor,
                ),
              ),
            if (seen.isNotEmpty)
              customizedText("${seen.length} seen", fontSize: 14),
              
          ],
        )
      ],
    ),
  );
}
