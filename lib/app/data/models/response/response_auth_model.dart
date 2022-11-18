class ResponseAuthModel {
  ResponseAuthModel({
    this.nombreUsuario = "",
    this.token = "",
  });

  String nombreUsuario;
  String token;

  factory ResponseAuthModel.fromJson(Map<String, dynamic> json) =>
      ResponseAuthModel(
        nombreUsuario: json["nombreUsuario"],
        token: json["token"],
      );
}
