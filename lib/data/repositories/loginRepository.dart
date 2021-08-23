import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository extends AbstractLoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepository() : _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> doLogin(String email, String password) async {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return "";
  }

  @override
  Future<void> doLogout() => _firebaseAuth.signOut();
}
