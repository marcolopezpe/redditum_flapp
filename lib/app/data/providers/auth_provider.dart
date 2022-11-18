import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/request/request_auth_model.dart';
import 'package:redditum_flapp/app/data/models/response/response_auth_model.dart';

class AuthProvider {
  final _dio = Get.find<Dio>();

  Future<ResponseAuthModel> authLogin(RequestAuthModel requestAuth) async {
    final response = await _dio.post(
      "/auth/login",
      data: {
        "nombreUsuario": requestAuth.nombreUsuario,
        "contrasena": requestAuth.contrasena,
      },
    );
    return ResponseAuthModel.fromJson(response.data);
  }

  Future<bool> authRecuperar(String nombreUsuario) async {
    final response = await _dio.post(
      "/auth/recuperar/$nombreUsuario",
    );
    return response.data;
  }
}
