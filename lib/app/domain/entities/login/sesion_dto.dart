/*UsuarioDTO usuariolFromJson(String str) =>
    UsuarioDTO.fromJson(json.decode(str));

String usuarioToJson(UsuarioDTO data) => json.encode(data.toJson());*/

class SesionDTO {
  SesionDTO({
    required this.codigoCliente,
    required this.token,
    required this.tokenRefresh,
  });

  String codigoCliente;
  String token;
  String tokenRefresh;

  factory SesionDTO.fromJson(Map<String, dynamic> json) => SesionDTO(
        codigoCliente: json["codigoCliente"],
        token: json["token"],
        tokenRefresh: json["tokenRefresh"],
      );
      

  Map<String, dynamic> toJson() => {
        "codigoCliente": codigoCliente,
        "token": token,
        "tokenRefresh": tokenRefresh,
      };
}
