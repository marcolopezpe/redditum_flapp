import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/request/request_auth_model.dart';
import 'package:redditum_flapp/app/data/repositories/auth_repository.dart';
import 'package:redditum_flapp/app/data/repositories/usuario_repository.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/services/local_storage_service.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';
import 'package:redditum_flapp/core/utils/keys.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    ctrlTextUsername = TextEditingController();
    ctrlTextPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    ctrlTextUsername.dispose();
    ctrlTextPassword.dispose();
    super.onClose();
  }

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final UsuarioRepository _usuarioRepository = Get.find<UsuarioRepository>();

  late TextEditingController ctrlTextUsername;
  late TextEditingController ctrlTextPassword;

  Future<void> signIn() async {
    try {
      // Validar campos obligatorios
      if (ctrlTextUsername.text.isEmpty) {
        CustomAlert.danger(message: "El Usuario es obligatorio.");
        return;
      }

      if (ctrlTextPassword.text.isEmpty) {
        CustomAlert.danger(message: "La Contrase\u{00F1}a es obligatoria.");
        return;
      }

      // Obtener Token
      final responseAuth = await _authRepository.authLogin(
        RequestAuthModel(
          nombreUsuario: ctrlTextUsername.text,
          contrasena: ctrlTextPassword.text,
        ),
      );

      if (responseAuth.token.isNotEmpty) {
        // Obtener datos del usuario autenticado con el token
        final responseUsuario = await _usuarioRepository.getUsuario(
          nombreUsuario: ctrlTextUsername.text,
          token: responseAuth.token,
        );

        await LocalStorageService.set(
          key: Keys.keySessionUsername,
          value: ctrlTextUsername.text,
        );

        await LocalStorageService.set(
          key: Keys.keySessionPassword,
          value: ctrlTextPassword.text,
        );

        await LocalStorageService.set(
          key: Keys.keySessionToken,
          value: responseAuth.token,
        );

        await LocalStorageService.set(
          key: Keys.keySessionUsuario,
          value: json.encode(responseUsuario.toJson()),
        );

        Get.offAllNamed(AppRoutes.home);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        CustomAlert.danger(message: e.response?.data["mensaje"]);
      } else {
        CustomAlert.danger(message: e.error);
      }
    }
  }

  void forgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }
}
