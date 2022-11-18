class ResponseUsuarioModel {
  String? id;
  String? nombres;
  String? apellidos;
  String? email;
  String? nombreUsuario;
  bool? activo;

  ResponseUsuarioModel({
    this.id,
    this.nombres,
    this.apellidos,
    this.email,
    this.nombreUsuario,
    this.activo,
  });

  factory ResponseUsuarioModel.fromJson(Map<String, dynamic> json) =>
      ResponseUsuarioModel(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        email: json["email"],
        nombreUsuario: json["nombreUsuario"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombres': nombres,
      'apellidos': apellidos,
      'email': email,
      'nombreUsuario': nombreUsuario,
      'activo': activo,
    };
  }
}
