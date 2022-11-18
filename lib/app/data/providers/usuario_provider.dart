import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_usuario_model.dart';

class UsuarioProvider {
  final _dio = Get.find<Dio>();

  Future<ResponseUsuarioModel> getUsuario({
    required String nombreUsuario,
    required String token,
  }) async {
    final response = await _dio.get(
      "/usuarios/$nombreUsuario",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    return ResponseUsuarioModel.fromJson(response.data);
  }

  Future<dynamic> updatePassword({
    required String contrasenaActual,
    required String nuevaContrasena,
    required String confirmarNuevaContrasena,
    required String id,
    required String token,
  }) async {
    final response = await _dio.put(
      "/usuarios/actualizar-contrasena/$id",
      data: {
        "contrasenaActual": contrasenaActual,
        "nuevaContrasena": nuevaContrasena,
        "confirmarNuevaContrasena": confirmarNuevaContrasena
      },
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        }
      ),
    );
    return response;
  }
}
