import 'dart:convert';

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

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "contrasena": contrasena,
      };





  /*   SesionDTO sesionDTO = SesionDTO.fromJson( */
  /*          json.decode(jsonEncode(repuesta!.payload).toString())); */

}
