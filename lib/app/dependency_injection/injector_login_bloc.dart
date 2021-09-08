import 'package:estructura/app/domain/blocs/login/login_bloc.dart';
import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';
import 'package:injector/injector.dart';

class BlocLogin {
  void loginBlocInyector() {
    final injector = Injector.appInstance;

    injector.registerSingleton<LoginBloc>(() {
      return LoginBloc(
        abstractLoginRepository: injector.get<AbstractLoginRepository>(),
      );
    });
  }
}
