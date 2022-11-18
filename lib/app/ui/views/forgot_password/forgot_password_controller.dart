import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/repositories/auth_repository.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';

class ForgotPasswordController extends GetxController {
  @override
  void onInit() {
    ctrlTextUsername = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ctrlTextUsername.dispose();
    super.onClose();
  }

  final AuthRepository _authRepository = Get.find<AuthRepository>();

  late TextEditingController ctrlTextUsername;

  void init() {}

  void sendEmail() async {
    try {
      if (ctrlTextUsername.text.isEmpty) {
        CustomAlert.danger(message: "El Usuario es obligatorio.");
        return;
      }

      final response =
          await _authRepository.authRecuperar(ctrlTextUsername.text);

      if (response) {
        CustomAlert.success(message: "Pasos enviados al e-mail correctamente.");
        ctrlTextUsername.clear();
      } else {
        CustomAlert.danger(message: "Error al enviar pasos.");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        CustomAlert.danger(message: e.response?.data["mensaje"]);
      } else {
        CustomAlert.danger(message: e.error);
      }
    }
  }
}
