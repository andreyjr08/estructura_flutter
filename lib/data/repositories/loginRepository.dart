import 'dart:convert';

import 'package:estructura_flutter/domain/repositories/abstractLoginRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class LoginRepository extends AbstractLoginRepository {
  final FirebaseAuth _firebaseAuth;
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyADEID6ECsdu78PhYJ2jzmupuJXkZ_KnRM';

  LoginRepository() : _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<String> doLogin(String email, String password) async {
    /*final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );*/

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    print(email);
    print(password);

    return decodedResp['idToken'];
  }

  @override
  Future<void> doLogout() => _firebaseAuth.signOut();
}
