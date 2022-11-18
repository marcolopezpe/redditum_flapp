import 'package:get/get.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      doAuth();
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void doAuth() {
    Get.offNamed(AppRoutes.login);
  }
}
