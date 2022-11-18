import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_sesion_model.dart';

class SesionProvider {
  final _dio = Get.find<Dio>();

  Future<List<ResponseSesionModel>> getSesionesByUsuarioId({
    required String usuarioId,
    required String token,
  }) async {
    final response = await _dio.get(
      "/sesiones/usuario/$usuarioId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    List<ResponseSesionModel> sesiones = [];
    for (var i = 0; i < response.data.length; i++) {
      sesiones.add(ResponseSesionModel.fromJson(response.data[i]));
    }

    return sesiones;
  }
}
