import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/data/providers/auth_provider.dart';
import 'package:redditum_flapp/app/data/providers/sesion_provider.dart';
import 'package:redditum_flapp/app/data/providers/usuario_provider.dart';
import 'package:redditum_flapp/app/data/repositories/auth_repository.dart';
import 'package:redditum_flapp/app/data/repositories/sesion_repository.dart';
import 'package:redditum_flapp/app/data/repositories/usuario_repository.dart';

class DependencyInjection {
  static load() {
    // Local Storage
    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());

    // Providers
    Get.put<AuthProvider>(AuthProvider());
    Get.put<UsuarioProvider>(UsuarioProvider());
    Get.put<SesionProvider>(SesionProvider());

    // Repositories
    Get.put<AuthRepository>(AuthRepository());
    Get.put<UsuarioRepository>(UsuarioRepository());
    Get.put<SesionRepository>(SesionRepository());
  }
}
