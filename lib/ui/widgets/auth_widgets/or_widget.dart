import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';

import '../../../constant/app_colors.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: AppColors.grayColor.withOpacity(0.2),
          height: 2,
          width: Get.width * 0.4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: customizedText("OR", fontSize: 14),
        ),
        Container(
          color: AppColors.grayColor.withOpacity(0.2),
          height: 2,
          width: Get.width * 0.4,
        ),
      ],
    );
  }
}
