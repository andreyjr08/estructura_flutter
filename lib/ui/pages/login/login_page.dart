import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estructura_flutter/domain/blocs/login/login_bloc.dart';
import 'package:estructura_flutter/ui/widgets/widgets.dart';
import 'package:estructura_flutter/data/repositories/loginRepository.dart';
import 'package:injector/injector.dart';

import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final LoginRepository _loginRepository;
  

  const LoginScreen({Key? key, required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(key: key);

        

  @override
  Widget build(BuildContext context) {
    final injector = Injector.appInstance;
    return Scaffold(
        body: BlocProvider<LoginBloc>(
            create: (context) => injector.get<LoginBloc>(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 250),
                  CardContainer(
                      child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Login',
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 30),
                      Container(
                        child: LoginForm(),
                      ),
                    ],
                  )),
                ],
              ),
            )));
  }
}
