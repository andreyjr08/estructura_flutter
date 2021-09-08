import 'package:estructura/app/data/repository_impl/http.dart';
import 'package:estructura/app/domain/entities/login/generico_dto.dart';
import 'package:estructura/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:estructura/app/domain/entities/login/sesion_dto.dart';
import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AutenticacionRepositoryHttp extends AbstractLoginRepository {
  final storage = FlutterSecureStorage();

  @override
  Future<SesionDTO> doLogin(InicioSesionDTO inicioSesionDTO) async {
    try {
      final Object? repuesta = await HttpService(
        endPoint: 'autenticacion/iniciar-sesion',
        body: inicioSesionDTO.toMap(),
      ).post();

      SesionDTO sesionDTO = SesionDTO.fromJson(
          GenericoDTO().convertirObjectToJson(object: repuesta));

      await storage.write(key: 'tokenSesion', value: sesionDTO.token);

      return sesionDTO;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<void> doLogout() async {
    await storage.delete(key: 'tokenSesion');
  }
}
