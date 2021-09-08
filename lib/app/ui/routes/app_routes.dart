import 'package:estructura/app/ui/pages/login/page/inicio_sesion_page.dart';
import 'package:estructura/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/widgets.dart' show Widget, BuildContext;

import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.splash: (_) => SplashPage(),
      Routes.login: (_) => InicioSesionPage(),
    };
