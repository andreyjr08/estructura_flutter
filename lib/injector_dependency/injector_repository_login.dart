import 'package:estructura_flutter/data/repositories/loginRepository.dart';
import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:injector/injector.dart';

class RepositoryLogin {
  final injector = Injector.appInstance;

  RepositoryLogin() {
    injector.registerDependency<AbstractLoginRepository>(() {
      return LoginRepository();
    });
  }
}
