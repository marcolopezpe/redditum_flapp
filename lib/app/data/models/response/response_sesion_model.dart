class ResponseSesionModel {
  ResponseSesionModel({
    this.id,
    this.token,
    this.ip,
    this.fecha,
    this.sistemaOperativo,
    this.navegador,
  });

  String? id;
  String? token;
  String? ip;
  int? fecha;
  String? sistemaOperativo;
  String? navegador;

  factory ResponseSesionModel.fromJson(Map<String, dynamic> json) =>
      ResponseSesionModel(
        id: json["id"],
        token: json["token"],
        ip: json["ip"],
        fecha: json["fecha"],
        sistemaOperativo: json["sistemaOperativo"],
        navegador: json["navegador"],
      );
}
