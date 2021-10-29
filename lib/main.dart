import 'package:flutter/material.dart';

import 'app/dependency_injection/register.dart';
import 'app/my_app.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Register().regist();
  runApp(MyApp());
}
