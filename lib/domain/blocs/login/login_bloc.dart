import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:estructura_flutter/ui/util/validator.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AbstractLoginRepository _abstractLoginRepository;

  LoginBloc({required AbstractLoginRepository abstractLoginRepository})
      : _abstractLoginRepository = abstractLoginRepository,
        super(LoginState.initial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ValidateEmailOnChange) {
      yield* _validateEmail(event.email);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _singIn(email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _validateEmail(String email) async* {
    yield state.update(
        isEmailValid: Validators.isValidEmail(email), isPasswordValid: true);
  }

  Stream<LoginState> _singIn(
      {required String email, required String password}) async* {
    yield LoginState.loading();
    try {
      final token = await _abstractLoginRepository.doLogin(email, password);
      // ignore: unnecessary_null_comparison
      if (token == null) {
        yield LoginState.failure();
      } else {
        yield LoginState.success();
      }
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
