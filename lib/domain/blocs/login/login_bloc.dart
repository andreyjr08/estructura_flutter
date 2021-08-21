import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estructura_flutter/data/repositories/loginRepository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //LoginBloc() : super(LoginInitial());
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    Stream<LoginState> mapEventToState(LoginEvent event) async* {
      if (event is LoginWithCredentialsPressed) {
        yield* _mapLoginWithCredentialsPressedToState(
            username: event.email, password: event.password);
      }
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      {required String username, required String password}) async* {
    yield LoginState.loading();
    try {
      await loginRepository.doLogin(username, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
