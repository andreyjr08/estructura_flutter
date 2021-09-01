import 'package:listo/app/domain/blocs/login/login_bloc.dart';
import 'package:listo/app/ui/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  //LoginRepository loginRepository = LoginRepository(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    //final injector = Injector.appInstance;
    return Scaffold(
        body: BlocProvider<LoginBloc>(
            create: (context) => Injector.appInstance.get<LoginBloc>(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  CardContainer(
                      child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text('Login',
                          style: Theme.of(context).textTheme.headline4),
                      const SizedBox(height: 30),
                      LoginForm(),
                    ],
                  )),
                ],
              ),
            )));
  }
}
