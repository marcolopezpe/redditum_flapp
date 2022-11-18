import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/models/request/request_auth_model.dart';
import 'package:redditum_flapp/app/data/models/response/response_auth_model.dart';
import 'package:redditum_flapp/app/data/providers/auth_provider.dart';

class AuthRepository {
  final _apiProvider = Get.find<AuthProvider>();

  Future<ResponseAuthModel> authLogin(RequestAuthModel requestAuth) =>
      _apiProvider.authLogin(requestAuth);

  Future<bool> authRecuperar(String nombreUsuario) =>
      _apiProvider.authRecuperar(nombreUsuario);
}
