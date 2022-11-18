import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/views/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
