import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/core/environment/env.dart';
import 'package:redditum_flapp/core/network/interceptors/error_interceptor.dart';
import 'package:redditum_flapp/core/network/interceptors/logger_interceptor.dart';

class DioConfig {
  static void init() {
    Get.lazyPut(
      () => Dio(
        BaseOptions(
            baseUrl: Environment.appConfig["baseUrl"],
            connectTimeout: Environment.appConfig["connectionTimeout"],
            responseType: ResponseType.json),
      )..interceptors.addAll([
          LoggerInterceptor(),
          ErrorInterceptor(),
        ]),
      fenix: true,
    );
  }
}
