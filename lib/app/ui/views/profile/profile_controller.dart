import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_sesion_model.dart';
import 'package:redditum_flapp/app/data/models/response/response_usuario_model.dart';
import 'package:redditum_flapp/app/data/repositories/sesion_repository.dart';
import 'package:redditum_flapp/app/data/repositories/usuario_repository.dart';
import 'package:redditum_flapp/app/services/local_storage_service.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';
import 'package:redditum_flapp/core/utils/keys.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    usuarioAuth = ResponseUsuarioModel();
    ctrlTextNombres = TextEditingController();
    ctrlTextApellidos = TextEditingController();
    ctrlTextNombreUsuario = TextEditingController();
    ctrlTextEmail = TextEditingController();

    ctrlTextContrasenaActual = TextEditingController();
    ctrlTextNuevaContrasena = TextEditingController();
    ctrlTextConfirmarNuevaContrasena = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    init();
    super.onReady();
  }

  @override
  void onClose() {
    ctrlTextNombres.dispose();
    ctrlTextApellidos.dispose();
    ctrlTextNombreUsuario.dispose();
    ctrlTextEmail.dispose();

    ctrlTextContrasenaActual.dispose();
    ctrlTextNuevaContrasena.dispose();
    ctrlTextConfirmarNuevaContrasena.dispose();

    super.onClose();
  }

  final UsuarioRepository _usuarioRepository = Get.find<UsuarioRepository>();
  final SesionRepository _sesionRepository = Get.find<SesionRepository>();

  late ResponseUsuarioModel usuarioAuth;
  late TextEditingController ctrlTextNombres;
  late TextEditingController ctrlTextApellidos;
  late TextEditingController ctrlTextNombreUsuario;
  late TextEditingController ctrlTextEmail;

  late TextEditingController ctrlTextContrasenaActual;
  late TextEditingController ctrlTextNuevaContrasena;
  late TextEditingController ctrlTextConfirmarNuevaContrasena;

  RxList<ResponseSesionModel> sesiones = RxList<ResponseSesionModel>([]);
  RxBool isLoadingSesiones = RxBool(false);

  void init() async {
    await loadUsuarioAuth();
    await refreshSesiones();
  }

  Future<void> loadUsuarioAuth() async {
    try {
      usuarioAuth = ResponseUsuarioModel.fromJson(
        json.decode(
          await LocalStorageService.get(
            Keys.keySessionUsuario,
          ),
        ),
      );

      ctrlTextNombres.text = usuarioAuth.nombres!;
      ctrlTextApellidos.text = usuarioAuth.apellidos!;
      ctrlTextNombreUsuario.text = usuarioAuth.nombreUsuario!;
      ctrlTextEmail.text = usuarioAuth.email!;
    } catch (e) {
      CustomAlert.danger(message: (e as DioError).message);
    }
  }

  Future<void> updatePassword() async {
    try {
      // Valildar campos
      if (ctrlTextContrasenaActual.text.isEmpty) {
        CustomAlert.danger(
            message: "La Contrase\u{00F1}a Actual es obligatoria.");
        return;
      }

      if (ctrlTextNuevaContrasena.text.isEmpty) {
        CustomAlert.danger(
            message: "La Nueva Contrase\u{00F1}a es obligatoria.");
        return;
      }

      if (ctrlTextConfirmarNuevaContrasena.text.isEmpty) {
        CustomAlert.danger(message: "La Confirmaci\u{00F3}n es obligatoria.");
        return;
      }

      _usuarioRepository.updatePassword(
        contrasenaActual: ctrlTextContrasenaActual.text,
        nuevaContrasena: ctrlTextNuevaContrasena.text,
        confirmarNuevaContrasena: ctrlTextConfirmarNuevaContrasena.text,
        id: usuarioAuth.id!,
        token: await LocalStorageService.get(Keys.keySessionToken),
      );

      CustomAlert.success(
          message: "Contrase\u{00F1}a actualizada correctamente.");
      LocalStorageService.set(
        key: Keys.keySessionPassword,
        value: ctrlTextConfirmarNuevaContrasena.text,
      );

      ctrlTextContrasenaActual.clear();
      ctrlTextNuevaContrasena.clear();
      ctrlTextConfirmarNuevaContrasena.clear();
    } catch (e) {
      print(e);
    }
  }

  Future<void> refreshSesiones() async {
    try {
      isLoadingSesiones.value = true;

      final response = await _sesionRepository.getSesionesByUsuarioId(
        usuarioId: usuarioAuth.id!,
        token: await LocalStorageService.get(Keys.keySessionToken),
      );

      sesiones.value = response;

      isLoadingSesiones.value = false;
    } catch (e) {
      print(e);
    }
  }
}
