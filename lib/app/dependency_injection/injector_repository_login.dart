import 'package:estructura/app/data/repository_impl/autenticacion_repository_http.dart';
//import 'package:estructura/app/data/repository_impl/login_repository_firebase.dart';
import 'package:estructura/app/domain/repository/login/abstract_login_repository.dart';

import 'package:injector/injector.dart';

class RepositoryLogin {
  void abstractLoginRepository() {
    final injector = Injector.appInstance;

    injector.registerDependency<AbstractLoginRepository>(() {
      return AutenticacionRepositoryHttp();
    });
  }
}
