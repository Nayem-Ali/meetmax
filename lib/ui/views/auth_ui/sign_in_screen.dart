import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/constant/app_regex.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/ui/route/app_route.dart';
import 'package:meetmax/ui/widgets/auth_app_bar.dart';
import 'package:meetmax/ui/widgets/custom_form_field.dart';
import 'package:meetmax/ui/widgets/custom_txt_styles.dart';
import 'package:meetmax/ui/widgets/custome_elevated_button.dart';
import 'package:meetmax/ui/widgets/icon_labeled_button.dart';
import 'package:meetmax/ui/widgets/or_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  RxBool isRemember = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 40,
                  right: 40,
                  bottom: 5,
                ),
                child: customizedText(
                  "Sign In",
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
                  'Welcome back, you’ve been missed!',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          iconLabeledButton(
                            "Log in with Google",
                            AppIconPath.googleIcon,
                          ),
                          iconLabeledButton(
                            "Log in with Apple",
                            AppIconPath.appleIcon,
                          ),
                        ],
                      ),
                      const OrWidget(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customTextField(
                          _emailController,
                          AppRegex().emailValidation,
                          AppIconPath.mailIcon,
                          "Your Email",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () => customTextField(
                            _passwordController,
                            AppRegex().passwordValidation,
                            AppIconPath.lockIcon,
                            "Create Password",
                            isSuffix: true,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Checkbox(
                              value: isRemember.value,
                              activeColor: AppColors.blueColor,
                              onChanged: (val) {
                                isRemember.value = val!;
                              },
                            ),
                          ),
                          customizedText("Remember me"),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Get.offNamed(forgetPassword);
                            },
                            child: customizedText("Forgot Password?"),
                          )
                        ],
                      ),
                      SizedBox(
                        width: Get.width * 0.8,
                        child: customElevatedButton(
                          "Sign In",
                          () {
                            if(_formKey.currentState!.validate()){

                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 18,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.offNamed(signUp);
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "You haven't any account?",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.grayColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "  Sign Up",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.blueColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
