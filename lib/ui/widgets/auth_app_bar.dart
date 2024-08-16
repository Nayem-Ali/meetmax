import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetmax/ui/widgets/custom_txt_styles.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';

List<String> languages = ["English (UK)", "English (USA)", "English (AUS)"];
RxString onSelect = languages[0].obs;

AppBar authAppBar() {
  return AppBar(
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Image.asset(
            AppIconPath.logoPath,
            width: 25,
          ),
        ),
        customizedText(
          AppString.appName,
          fontSize: 18,
        ),
      ],
    ),
    centerTitle: false,
    actions: [
      Container(
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: AppColors.grayColor.withOpacity(0.1),
                offset: const Offset(2,2),
                blurRadius: 10,
                spreadRadius: 2
              ),
              const BoxShadow(
                  color: Colors.white,
                  offset: Offset(0,0),
                  blurRadius: 0,
                  spreadRadius: 0
              ),
            ]),
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => DropdownButton(
            value: onSelect.value,
            items: languages
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) {
              onSelect.value = value!;
            },
            style: GoogleFonts.roboto(color: AppColors.grayColor.withOpacity(0.7)),
            elevation: 5,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      )
    ],
  );
}
