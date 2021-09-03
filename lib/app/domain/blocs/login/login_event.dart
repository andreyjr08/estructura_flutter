part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {

  /*@override
   final InicioSesionDTO inicioSesionDTO =  InicioSesionDTO(contrasena: "",correo: "") ;*/
}

class LoginWithCredentialsPressed extends LoginEvent {
  final InicioSesionDTO inicioSesionDTO;

  LoginWithCredentialsPressed({required this.inicioSesionDTO});

   /*  @override
     inicioSesionDTO*/

  
}
