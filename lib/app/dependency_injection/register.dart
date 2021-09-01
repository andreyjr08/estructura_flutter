import 'injector_login_bloc.dart';
import 'injector_repository_login.dart';

class Register {
  void regist() {
    BlocLogin().loginBlocInyector();
    RepositoryLogin().abstractLoginRepository();
  }
}
