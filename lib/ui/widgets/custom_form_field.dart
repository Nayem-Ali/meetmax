import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/constant/app_strings.dart';

RxBool obscureTxt = false.obs;
String eyeOn = AppIconPath.eyeOnIcon;
String eyeOff = AppIconPath.eyeOffIcon;

TextFormField customTextField(
  controller,
  validationFunction,
  iconPath,
  hintTxt, {
  isSuffix = false,
}) {
  return TextFormField(
    controller: controller,
    validator: validationFunction,
    obscureText: obscureTxt.value,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      border: const OutlineInputBorder(),
      prefixIcon: Image.asset(iconPath, scale: 3),
      hintText: hintTxt,
      suffixIcon: isSuffix
          ? IconButton(
              onPressed: () {
                obscureTxt.value = !obscureTxt.value;
              },
              icon: Image.asset(obscureTxt.value ? eyeOn : eyeOff, scale: 3),
            )
          : const SizedBox(),
    ),
  );
}
