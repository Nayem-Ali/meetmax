import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meetmax/constant/app_colors.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/data/users.dart';
import 'package:meetmax/ui/widgets/shared_widgets/boxDecotation.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';
import 'event_data.dart';

class Birthday extends StatelessWidget {
  Birthday({Key? key}) : super(key: key);
  final UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 10),
      decoration: boxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              customizedText("Birthdays", fontWeight: FontWeight.bold),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: customizedText("See All", color: Colors.blueAccent),
              ),
            ],
          ),
          Divider(
            color: AppColors.grayColor.withOpacity(0.4),
            height: 1,
          ),
          FutureBuilder(
            future: userData.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                /// For testing set first user birthdate as today
                snapshot.data![0].dob = DateFormat("dd-MM-yyyy").format(DateTime.now());
                return Column(
                  children: snapshot.data!.map((user) {
                    if (userData.isBirthday(user.dob)) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 45.h,
                                    width: 45.h,
                                    child: Image.asset(user.photo!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        /// User Name
                                        customizedText(user.name),
                                        customizedText(
                                          "Birthday Today",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Form(
                                    child: TextFormField(
                                      maxLines: null,
                                      minLines: null,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                          left: 8,
                                          bottom: 10,
                                        ),
                                        errorStyle: const TextStyle(fontSize: 0),
                                        hintText: "Write on his inbox",
                                        hintStyle: GoogleFonts.roboto(fontSize: 14),
                                        filled: true,
                                        fillColor: AppColors.grayColor.withOpacity(0.15),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 42.h,
                                  width: 42.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.blueColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      AppIconPath.sendIcon,
                                      color: Colors.blueAccent,
                                      scale: 3,
                                    ),
                                  ),
                                )
                                // const Spacer(),
                              ],
                            )
                          ],
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }).toList(),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading..."),
                );
              } else {
                return const Center(
                  child: Text("Something went wrong"),
                );
              }
            },
          ),
          InkWell(
            onTap: () {},
            child: eventData(
              AppColors.yellowColor,
              AppIconPath.birthdayIcon,
              "Upcoming birthdays",
              "See 4 more have upcoming birthday",
              []
            ),
          )
        ],
      ),
    );
  }
}
