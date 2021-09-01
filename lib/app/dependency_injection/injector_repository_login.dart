import 'package:listo/app/data/repository_impl/login_repository.dart';
import 'package:listo/app/domain/repository/login/abstract_login_repository.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/injector.dart';

class RepositoryLogin {
  void abstractLoginRepository() {
    final injector = Injector.appInstance;

    injector.registerDependency<AbstractLoginRepository>(() {
      return LoginRepository(FirebaseAuth.instance);
    });
  }
}
