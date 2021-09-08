import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:estructura/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:estructura/app/domain/entities/login/sesion_dto.dart';
import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InicioSesionRepositoryFirebase extends AbstractLoginRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final storage = FlutterSecureStorage();

  @override
  Future<SesionDTO> doLogin(InicioSesionDTO inicioSesionDTO) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: inicioSesionDTO.correo,
        password: inicioSesionDTO.contrasena,
      );

      final user = firebaseAuth.currentUser;
      final token = await firebaseAuth.currentUser!.getIdToken();

      SesionDTO sesionDTO = SesionDTO(
        codigoCliente: "2",
        token: token.toString(),
        tokenRefresh: user!.refreshToken.toString(),
      );

      storage.write(key: 'tokenSesion', value: token);

      print(sesionDTO.toJson());
      return sesionDTO;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> doLogout() => firebaseAuth.signOut();
}
