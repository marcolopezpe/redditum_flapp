import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
