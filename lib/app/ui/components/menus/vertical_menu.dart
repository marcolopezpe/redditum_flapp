import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_usuario_model.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/services/local_storage_service.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';
import 'package:redditum_flapp/core/utils/keys.dart';

class VerticalMenu extends StatelessWidget {
  const VerticalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.bgSidebar,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, bottom: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  const SizedBox(height: 15),
                  FutureBuilder(
                    future: getUsuarioAuth(),
                    builder: (BuildContext context,
                        AsyncSnapshot<ResponseUsuarioModel> response) {
                      return Text(
                        "Hola, ${response.data?.nombres}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  FutureBuilder(
                    future: getUsuarioAuth(),
                    builder: (BuildContext context,
                        AsyncSnapshot<ResponseUsuarioModel> response) {
                      return Text(
                        "@${response.data?.nombreUsuario}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => Get.offNamed(AppRoutes.home),
                      leading: const Icon(Icons.home),
                      title: const Text(
                        "Inicio",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(indent: 15, endIndent: 15),
                    ListTile(
                      onTap: () => Get.offNamed(AppRoutes.profile),
                      leading: const Icon(Icons.account_circle),
                      title: const Text(
                        "Mi Perfil",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(indent: 15, endIndent: 15),
                    ListTile(
                      onTap: () {
                        _confirmarCerrarSesion(context);
                      },
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text(
                        "Cerrar Sesi\u{00F3}n",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _confirmarCerrarSesion(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Cerrar Sesi\u{00F3}n?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [Text("¿Esta seguro de Cerrar Sesi\u{00F3}n?")],
          ),
          actions: [
            TextButton(
              onPressed: () => _cerrarSesion(),
              child: const Text("Si"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  Future<ResponseUsuarioModel> getUsuarioAuth() async {
    ResponseUsuarioModel usuarioAuth = ResponseUsuarioModel();

    try {
      usuarioAuth = ResponseUsuarioModel.fromJson(
        json.decode(await LocalStorageService.get(
          Keys.keySessionUsuario,
        )),
      );
    } catch (e) {
      CustomAlert.danger(message: (e as DioError).message);
    }

    return usuarioAuth;
  }

  void _cerrarSesion() {
    LocalStorageService.delete(Keys.keySessionUsuario);
    LocalStorageService.delete(Keys.keySessionToken);
    LocalStorageService.delete(Keys.keySessionUsername);
    LocalStorageService.delete(Keys.keySessionPassword);
    Get.offAllNamed(AppRoutes.login);
  }
}
