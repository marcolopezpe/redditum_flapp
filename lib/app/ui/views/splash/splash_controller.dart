import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/request/request_auth_model.dart';
import 'package:redditum_flapp/app/data/repositories/auth_repository.dart';
import 'package:redditum_flapp/app/data/repositories/usuario_repository.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/services/local_storage_service.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';
import 'package:redditum_flapp/core/utils/keys.dart';

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

  final _authRepository = Get.find<AuthRepository>();
  final _usuarioRepository = Get.find<UsuarioRepository>();

  Future<void> doAuth() async {
    try {
      String username = await LocalStorageService.get(Keys.keySessionUsername);
      String password = await LocalStorageService.get(Keys.keySessionPassword);

      if (username.isNotEmpty && password.isNotEmpty) {
        // Obtener Token
        final responseAuth = await _authRepository.authLogin(
          RequestAuthModel(
            nombreUsuario: username,
            contrasena: password,
          ),
        );

        if (responseAuth.token.isNotEmpty) {
          // Obtener datos del usuario autenticado con el token
          final responseUsuario = await _usuarioRepository.getUsuario(
            nombreUsuario: username,
            token: responseAuth.token,
          );

          await LocalStorageService.set(
            key: Keys.keySessionUsername,
            value: username,
          );

          await LocalStorageService.set(
            key: Keys.keySessionPassword,
            value: username,
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
        } else {
          Get.offAllNamed(AppRoutes.login);
        }
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    } catch (e) {
      print(e);
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
