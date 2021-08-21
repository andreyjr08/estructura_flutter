import 'package:estructura_flutter/ui/pages/location.dart';
import 'package:estructura_flutter/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/loginRepository.dart';
import 'data/service/notifications_service.dart';
import 'domain/blocs/login/login_bloc.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginRepository loginRepository = LoginRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                LoginBloc(loginRepository: loginRepository))
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'location': (_) => CurrentLocation(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
