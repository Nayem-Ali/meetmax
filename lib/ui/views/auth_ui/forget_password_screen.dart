import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/constant/app_regex.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/ui/route/app_route.dart';
import 'package:meetmax/ui/widgets/auth_app_bar.dart';
import 'package:meetmax/ui/widgets/custom_form_field.dart';
import 'package:meetmax/ui/widgets/custome_elevated_button.dart';

import '../../widgets/custom_txt_styles.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 40,
                right: 40,
                bottom: 5,
              ),
              child: customizedText(
                "Forgot Password?",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40,
              ),
              child: customizedText(
                "Enter your details to receive a link",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: customTextField(
                        _emailController,
                        AppRegex().emailValidation,
                        AppIconPath.mailIcon,
                        "Your "
                        "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.9,
                    child: customElevatedButton(
                      "Send",
                      () {
                        if(_formKey.currentState!.validate()){}
                      },
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Get.offNamed(signIn);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.blueColor,
                    ),
                    label: customizedText(
                      "Back to Sign In",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blueColor
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
