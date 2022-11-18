class ResponseErrorModel {
  ResponseErrorModel({
    this.fecha,
    this.mensaje,
    this.detalles,
  });

  int? fecha;
  String? mensaje;
  String? detalles;

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) =>
      ResponseErrorModel(
        fecha: json["fecha"],
        mensaje: json["mensaje"],
        detalles: json["detalles"],
      );
}
