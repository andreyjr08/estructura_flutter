import 'package:estructura_flutter/domain/blocs/login/login_bloc.dart';
import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:injector/injector.dart';

class BlocLogin {
  final injector = Injector.appInstance;

  BlocLogin() {
    injector.registerSingleton<LoginBloc>(() {
      return LoginBloc(
        abstractLoginRepository: injector.get<AbstractLoginRepository>(),
      );
    });
  }
}
