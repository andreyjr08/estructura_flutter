import 'package:estructura_flutter/device/Location.dart';
import 'package:estructura_flutter/ui/pages/localStorage.dart';
import 'package:estructura_flutter/ui/pages/location.dart';
import 'package:estructura_flutter/ui/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/service/auth_service.dart';
import 'data/service/notifications_service.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() )
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
        'login'   : ( _ ) => LoginScreen(),
        'location'   : ( _ ) => CurrentLocation(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    );
  }
}