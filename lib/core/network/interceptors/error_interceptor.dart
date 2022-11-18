import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:redditum_flapp/app/data/models/response/response_error_model.dart';
import 'package:redditum_flapp/app/ui/components/alerts/custom_alert.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("onRequest");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print("onResponse");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print("onError: ${err.response?.statusCode}");
    if (err.response != null) {
      String jsonString = err.response.toString();
      ResponseErrorModel errorModel =
          ResponseErrorModel.fromJson(json.decode(jsonString));
      CustomAlert.danger(message: errorModel.mensaje!);
    }
    return handler.next(err); // <--- THE TIP IS HERE
  }
}
