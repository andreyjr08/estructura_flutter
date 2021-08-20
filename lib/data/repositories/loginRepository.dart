import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginRepository extends AbstractLoginRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseLoginRepository(this.auth);

  @override
  Future<String> doLogin(
      {required String username, required String password}) async {
    final user = await auth.signInWithEmailAndPassword(
      email: username,
      password: password,
    );

    return "";
  }

  @override
  Future<void> doLogout() => auth.signOut();
}
