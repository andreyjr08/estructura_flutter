import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository extends AbstractLoginRepository {

  FirebaseAuth auth = FirebaseAuth.instance;
  //LoginRepository(this.auth);

  @override
  Future<String> doLogin(String email, String password) async {

    final user = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return "";
  }

  @override
  Future<void> doLogout() => auth.signOut();
}
