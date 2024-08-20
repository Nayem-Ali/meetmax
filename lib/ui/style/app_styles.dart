import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/constant/app_strings.dart';

class AppStyles {
  GetSnackBar failedMessage(message) => GetSnackBar(
        message: message,
        duration: const Duration(seconds: 3),
        icon: Image.asset(AppIconPath.logoPath, scale: 3),
        backgroundColor: AppColors.redColor,
        snackPosition: SnackPosition.BOTTOM,
      );

  GetSnackBar successMessage(message) => GetSnackBar(
        message: message,
        duration: const Duration(seconds: 3),
        icon: Image.asset(AppIconPath.logoPath, scale: 3),
        backgroundColor: AppColors.greenColor,
        snackPosition: SnackPosition.BOTTOM,
      );

  progressDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Image.asset(AppIconPath.loadingIcon, height: 50),
          );
        });
  }
}
