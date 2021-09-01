import 'package:listo/app/domain/repository/login/abstract_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository extends AbstractLoginRepository {
  final FirebaseAuth firebaseAuth;

  LoginRepository(this.firebaseAuth);

  @override
  Future<String> doLogin(String email, String password) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print(user);
    } catch (e) {
      print(e);
      throw (e);
    }

    return "";
  }

  @override
  Future<void> doLogout() => firebaseAuth.signOut();

  void prueba() {}
}
