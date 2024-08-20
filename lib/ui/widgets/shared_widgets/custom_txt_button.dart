import 'package:flutter/material.dart';

import 'custom_txt_styles.dart';

TextButton customTxtButton(String iconPath, String buttonName, Function() onPressed,
    {double scale = 3}) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: Image.asset(
      iconPath,
      scale: scale,
    ),
    label: customizedText(
      buttonName,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 5)),
  );
}
