import 'package:get/get.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class CustomAlert {
  static void success({
    required String message,
    String? title,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title ?? "Exito",
      message,
      snackPosition: position ?? SnackPosition.BOTTOM,
      backgroundColor: AppColors.green,
      colorText: AppColors.bgWhite,
    );
  }

  static void danger({
    required String message,
    String? title,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title ?? "Error",
      message,
      snackPosition: position ?? SnackPosition.BOTTOM,
      backgroundColor: AppColors.red,
      colorText: AppColors.bgWhite,
    );
  }

  static void warning({
    required String message,
    String? title,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title ?? "Aviso",
      message,
      snackPosition: position ?? SnackPosition.BOTTOM,
      backgroundColor: AppColors.amber,
      colorText: AppColors.bgWhite,
    );
  }

  static void info({
    required String message,
    String? title,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title ?? "Info",
      message,
      snackPosition: position ?? SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.bgWhite,
    );
  }
}
