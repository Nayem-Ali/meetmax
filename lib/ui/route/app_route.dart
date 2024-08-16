import 'package:get/get.dart';
import 'package:meetmax/ui/views/auth_ui/sign_in_screen.dart';
import 'package:meetmax/ui/views/auth_ui/forget_password_screen.dart';
import 'package:meetmax/ui/views/auth_ui/sign_up_screen.dart';


const signIn = '/signIn';
const signUp = '/signUp';
const forgetPassword = '/forgetPassword';



List<GetPage> getPages = [
  GetPage(name: signIn, page: () => SignInScreen()),
  GetPage(name: signUp, page: () =>  SignUpScreen()),
  GetPage(name: forgetPassword, page: () => ForgetPasswordScreen()),
];