import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meetmax/ui/widgets/shared_widgets/boxDecotation.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_strings.dart';
import '../../../data/users.dart';
import '../../../model/user_model.dart';
import '../shared_widgets/custom_txt_styles.dart';

class StoryHead extends StatelessWidget {
  const StoryHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserData().getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Container(
            height: 120,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: boxDecoration(),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 3),
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 85,
                        child: Stack(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                border: Border.all(color: AppColors.blueColor, width: 2),
                                image: DecorationImage(
                                  image: AssetImage(user.photo ?? AppImagePath.avatar1Img),
                                ),
                              ),
                              // child: Image.asset(AppImagePath.profileImg,fit: BoxFit.fitHeight),
                            ),
                            if (index == 0)
                              Positioned(
                                bottom: -1,
                                left: 8,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: AppColors.grayColor,
                                        blurRadius: 15.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            Positioned(
                              bottom: -3,
                              child: Container(
                                padding: const EdgeInsets.only(top: 10),
                                width: 65,
                                child: customizedText(
                                  user.name,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
              child: Image.asset(
                AppIconPath.loadingIcon,
                scale: 3,
              ));
        }
      },
    );
  }
}
