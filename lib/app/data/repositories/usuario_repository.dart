import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_usuario_model.dart';
import 'package:redditum_flapp/app/data/providers/usuario_provider.dart';

class UsuarioRepository {
  final _apiProvider = Get.find<UsuarioProvider>();

  Future<ResponseUsuarioModel> getUsuario(
          {required String nombreUsuario, required String token}) =>
      _apiProvider.getUsuario(nombreUsuario: nombreUsuario, token: token);

  Future<dynamic> updatePassword({
    required String contrasenaActual,
    required String nuevaContrasena,
    required String confirmarNuevaContrasena,
    required String id,
    required String token,
  }) =>
      _apiProvider.updatePassword(
        contrasenaActual: contrasenaActual,
        nuevaContrasena: nuevaContrasena,
        confirmarNuevaContrasena: confirmarNuevaContrasena,
        id: id,
        token: token,
      );
}
