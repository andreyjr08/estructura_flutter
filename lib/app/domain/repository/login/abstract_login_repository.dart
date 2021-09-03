import 'package:listo/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:listo/app/domain/entities/login/sesion_dto.dart';

abstract class AbstractLoginRepository {
  Future<SesionDTO> doLogin(InicioSesionDTO inicioSesionDTO);

  Future<void> doLogout();
}
