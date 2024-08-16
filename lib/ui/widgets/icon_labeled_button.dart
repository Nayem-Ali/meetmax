import 'package:flutter/material.dart';

import '../../constant/app_strings.dart';
import 'custom_txt_styles.dart';


ElevatedButton iconLabeledButton(String buttonName, String iconPath) {
  return  ElevatedButton.icon(
    onPressed: () {},
    icon: SizedBox(
      width: 20,
      child: Image.asset(
        iconPath,
      ),
    ),
    label: customizedText(
      buttonName,
      fontSize: 14,
    ),
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(120,40)
    ),
  );
}