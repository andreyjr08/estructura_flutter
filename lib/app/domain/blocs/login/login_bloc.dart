import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estructura/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';

//import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AbstractLoginRepository _abstractLoginRepository;

  LoginBloc({required AbstractLoginRepository abstractLoginRepository})
      : _abstractLoginRepository = abstractLoginRepository,
        super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield* _singIn(inicioSesionDTO: event.inicioSesionDTO);
    }
  }

  Stream<LoginState> _singIn(
      {required InicioSesionDTO inicioSesionDTO}) async* {
    yield LoginState.loading();
    try {
      await _abstractLoginRepository.doLogin(inicioSesionDTO);

      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
