class RequestAuthModel {
  String nombreUsuario;
  String contrasena;

  RequestAuthModel({
    required this.nombreUsuario,
    required this.contrasena,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nombreUsuario'] = nombreUsuario;
    data['contrasena'] = contrasena;
    return data;
  }
}
