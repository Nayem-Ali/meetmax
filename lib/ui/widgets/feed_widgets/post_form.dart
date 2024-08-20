import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';
import 'package:meetmax/constant/app_strings.dart';
import 'package:meetmax/ui/style/app_styles.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custom_txt_styles.dart';
import 'package:meetmax/ui/widgets/shared_widgets/custome_elevated_button.dart';

import '../../../constant/app_colors.dart';

List<String> visibility = ["Friends", "Public", "Me"];
RxString onSelect = visibility[0].obs;

class PostForm extends StatelessWidget {
  PostForm({Key? key}) : super(key: key);
  RxList<String> filePaths = RxList<String>([]);
  final _captionController = TextEditingController();

  addPost() async {
    if (_captionController.text.isEmpty && filePaths.isEmpty) {
      Get.showSnackbar(
        AppStyles().failedMessage("Please add caption or media"),
      );
    } else {
      final response = await Get.find<PostController>().addPost(
        _captionController.text,
        filePaths,
        onSelect.value,
      );
      if (response["status"] == "success") {
        Get.showSnackbar(AppStyles().successMessage(response["message"]));
      } else {
        Get.showSnackbar(AppStyles().failedMessage(response["message"]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: Get.height * 0.12,
            color: Colors.transparent,
          ),
          Container(
            height: Get.height * 0.8,
            color: Colors.white,
            // padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      customizedText("Create a Post", fontWeight: FontWeight.bold),
                      const Spacer(),
                      customizedText("Visible for: ", fontSize: 14),
                      Obx(
                        () => Container(
                          height: 30,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.grayColor.withOpacity(0.1),
                          ),
                          child: DropdownButton(
                            value: onSelect.value,
                            items: visibility
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
                            style: GoogleFonts.roboto(color: AppColors.blueColor),
                            elevation: 3,
                            underline: const SizedBox(),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(height: 1, color: AppColors.grayColor.withOpacity(0.6)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImagePath.profileImg),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.grayColor.withOpacity(0.2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _captionController,
                                maxLines: null,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: "What's happening?",
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                ),
                              ),
                              Obx(
                                () {
                                  if (filePaths.isNotEmpty) {
                                    return SizedBox(
                                      height: 300,
                                      child: GridView.builder(
                                        itemCount: filePaths.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: [
                                              Image.file(
                                                File(filePaths[index]),
                                                // width: 300,
                                                // height: 100,
                                              ),
                                              Positioned(
                                                right: 30,
                                                child: IconButton(
                                                  onPressed: () {
                                                    filePaths.remove(filePaths[index]);
                                                  },
                                                  icon: const Icon(Icons.cancel_outlined),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: customizedText("Live Video", fontSize: 12),
                    icon: Image.asset(
                      AppIconPath.liveIcon,
                      scale: 3,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      final ImagePicker picker = ImagePicker();
                      final List<XFile?> images = await picker.pickMultiImage();
                      if (images.isEmpty) return;
                      for (var img in images) {
                        filePaths.add(img!.path);
                      }
                    },
                    label: customizedText("Image/Video", fontSize: 12),
                    icon: Image.asset(
                      AppIconPath.pictureIcon,
                      scale: 3,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: customizedText("Feeling", fontSize: 12),
                    icon: Image.asset(
                      AppIconPath.smileIcon,
                      scale: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: Get.width,
                      child: customElevatedButton("Post", addPost),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: Get.height * .12,
            color: Colors.transparent,
          ),
          // Container(height: Get.height*.1, color: Colors.transparent,),
        ],
      ),
    );
  }
}
