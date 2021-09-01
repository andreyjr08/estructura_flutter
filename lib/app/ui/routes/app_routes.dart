import 'package:listo/app/ui/pages/login/login_page.dart';
import 'package:listo/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.splash: (_) => SplashPage(),
      Routes.login: (_) => LoginScreen(),
    };
