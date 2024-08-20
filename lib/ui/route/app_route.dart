import 'package:get/get.dart';
import 'package:meetmax/business_logic/bindings/auth_bindings.dart';
import 'package:meetmax/business_logic/bindings/post_bindings.dart';
import 'package:meetmax/ui/views/auth_ui/forget_password_screen.dart';
import 'package:meetmax/ui/views/auth_ui/sign_in_screen.dart';
import 'package:meetmax/ui/views/auth_ui/sign_up_screen.dart';
import 'package:meetmax/ui/views/home_ui/community_screen.dart';
import 'package:meetmax/ui/views/home_ui/feed_screen.dart';
import 'package:meetmax/ui/views/navigation_screen.dart';

const signIn = '/signIn';
const signUp = '/signUp';
const forgetPassword = '/forgetPassword';
const navigation = '/navigation';
const feed = '/feed';
const community = '/community';

List<GetPage> getPages = [
  GetPage(
    name: signIn,
    page: () => SignInScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: signUp,
    page: () => SignUpScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: forgetPassword,
    page: () => ForgetPasswordScreen(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: navigation,
    page: () => NavigationScreen(),
    bindings: [PostBinding(), AuthBinding()]
  ),
  GetPage(
    name: feed,
    page: () => FeedScreen(),
  ),
  GetPage(
    name: community,
    page: () => const CommunityScreen(),
  )
];
