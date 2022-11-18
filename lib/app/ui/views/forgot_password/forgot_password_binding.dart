import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }

}