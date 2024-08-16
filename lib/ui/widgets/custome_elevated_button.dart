import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';
import 'custom_txt_styles.dart';

ElevatedButton customElevatedButton(buttonName, onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: AppColors.blueColor),
    child: customizedText(
      buttonName,
      color: Colors.white,
    ),
  );
}
