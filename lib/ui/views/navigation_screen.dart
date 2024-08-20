import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/ui/views/home_ui/community_screen.dart';
import 'package:meetmax/ui/views/home_ui/explore_screen.dart';
import 'package:meetmax/ui/views/home_ui/feed_screen.dart';
import 'package:meetmax/ui/views/home_ui/notification_screen.dart';
import 'package:meetmax/ui/views/home_ui/setting_screen.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';

import '../../business_logic/controllers/post_controller.dart';
import '../widgets/shared_widgets/custom_form_field.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);
  final TextEditingController _srarchController = TextEditingController();
  final _postController = Get.find<PostController>();
  final _pages = [
    const FeedScreen(),
    const CommunityScreen(),
    const ExploreScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];
  RxInt activeIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Image.asset(AppImagePath.profileImg),
        ),
        title: SizedBox(
          height: 35,
          width: Get.width,
          child: customTextField(
            _srarchController,
            (val) {},
            AppIconPath.searchIcon,
            "Search for "
            "something here",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppIconPath.messageIcon,
              width: 25,
            ),
          ),
        ],
      ),
      body: Obx(() => _pages[activeIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: activeIndex.value,
          onTap: (value) => activeIndex.value = value,
          elevation: 20,
          items: [
            bottomNavItem("Feed", AppIconPath.homeIcon),
            bottomNavItem("My Community", AppIconPath.communityIcon),
            bottomNavItem("Explore", AppIconPath.exploreIcon),
            bottomNavItem("Notification", AppIconPath.notificationIcon),
            bottomNavItem("Setting", AppIconPath.settingIcon)
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

BottomNavigationBarItem bottomNavItem(String iconName, String iconPath) {
  return BottomNavigationBarItem(
    icon: Stack(
      alignment: Alignment.topRight,
      children: [
        Image.asset(iconPath, width: 25),
        if (iconName == "Notification")
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: AppColors.redColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: customizedText("3", color: Colors.white, fontSize: 10),
            ),
          )
      ],
    ),
    label: iconName,
  );
}
