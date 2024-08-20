import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetmax/business_logic/controllers/auth_controller.dart';
import 'package:meetmax/constant/app_regex.dart';
import 'package:meetmax/model/user_model.dart';
import 'package:meetmax/ui/style/app_styles.dart';
import 'package:meetmax/ui/widgets/auth_widgets/auth_app_bar.dart';
import 'package:meetmax/ui/widgets/shared_widgets/boxDecotation.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../../route/app_route.dart';
import '../../widgets/shared_widgets/custom_form_field.dart';
import '../../widgets/shared_widgets/custom_txt_styles.dart';
import '../../widgets/shared_widgets/custome_elevated_button.dart';
import '../../widgets/shared_widgets/icon_labeled_button.dart';
import '../../widgets/auth_widgets/or_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();

  final RxInt _isMale = 1.obs;

  final _authController = Get.find<AuthController>();

  Future<void> signUpFunction() async {
    if (_formKey.currentState!.validate()) {
      User user = User(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        uid: "",
        dob: _dobController.text.trim(),
        gender: _isMale.value == 1 ? "male" : "female",
        password: _passwordController.text.trim(),
      );

      Map<String, dynamic> response = await _authController.signUp(user);
      if (response["status"] == "success") {
        Get.offNamed(navigation);
        Get.showSnackbar(AppStyles().successMessage(response["message"]));
      } else {
        Get.showSnackbar(AppStyles().failedMessage(response["message"]));
      }
    }
  }

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
                decoration: boxDecoration(),
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
                          AppRegex().dobValidation,
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
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(8.0),
                        child: customElevatedButton(
                          "Sign Up",
                          signUpFunction,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
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
      ),
    );
  }
}
