import 'package:get/get.dart';
import 'package:meetmax/business_logic/controllers/post_controller.dart';

class PostBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(PostController());
  }

}