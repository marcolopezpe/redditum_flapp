import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/response/response_sesion_model.dart';
import 'package:redditum_flapp/app/data/providers/sesion_provider.dart';

class SesionRepository {
  final _apiProvider = Get.find<SesionProvider>();

  Future<List<ResponseSesionModel>> getSesionesByUsuarioId({
    required String usuarioId,
    required String token,
  }) =>
      _apiProvider.getSesionesByUsuarioId(usuarioId: usuarioId, token: token);
}
