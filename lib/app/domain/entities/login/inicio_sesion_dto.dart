class InicioSesionDTO {
  InicioSesionDTO({
    required this.correo,
    required this.contrasena,
  });

  String correo;
  String contrasena;

  factory InicioSesionDTO.fromJson(Map<String, dynamic> json) =>
      InicioSesionDTO(
        correo: json["correo"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toMap() => {
        "correo": correo,
        "contrasena": contrasena,
      };

  bool isEqual(InicioSesionDTO? model) {
    return correo == model?.correo;
  }

  /*   SesionDTO sesionDTO = SesionDTO.fromJson( */
  /*          json.decode(jsonEncode(repuesta!.payload).toString())); */

}
