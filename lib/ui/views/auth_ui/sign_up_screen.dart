import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetmax/constant/app_regex.dart';
import 'package:meetmax/ui/widgets/auth_app_bar.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../../route/app_route.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/custom_txt_styles.dart';
import '../../widgets/custome_elevated_button.dart';
import '../../widgets/icon_labeled_button.dart';
import '../../widgets/or_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();

  RxInt _isMale = 1.obs;

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
                    "Getting Started",
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
                      'Creating an account to continue and connect with the people',
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center),
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
                          child: customTextField(
                            _nameController,
                            AppRegex().nameValidation,
                            AppIconPath.smileIcon,
                            "Your Name",
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customTextField(
                            _dobController,
                            (val) {},
                            AppIconPath.calenderIcon,
                            "Date of Birth",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(), borderRadius: BorderRadius.circular(5)),
                          child: Obx(
                            () => Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  child: Image.asset(
                                    _isMale.value == 1
                                        ? AppIconPath.maleIcon
                                        : AppIconPath.femaleIcon,
                                    scale: 2.5,
                                  ),
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: _isMale.value,
                                  onChanged: (int? val) {
                                    _isMale.value = val!;
                                  },
                                  activeColor: AppColors.blueColor,
                                ),
                                customizedText("Male  "),
                                Radio(
                                  value: 2,
                                  groupValue: _isMale.value,
                                  onChanged: (val) {
                                    _isMale.value = val!;
                                  },
                                  activeColor: AppColors.blueColor,
                                ),
                                customizedText("Female")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.8,
                          child: customElevatedButton(
                            "Sign Up",
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
                              Get.offNamed(signIn);
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already haven an account?",
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.grayColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Sign In",
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
        ));
  }
}
