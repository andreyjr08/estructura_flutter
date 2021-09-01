part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  List<Object> get props => [];
}

class ValidateEmailOnChange extends LoginEvent {
  final String email;

  ValidateEmailOnChange({required this.email});

  @override
  List<Object> get props => [email];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
