import 'package:estructura_flutter/domain/blocs/login/login_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:estructura_flutter/data/service/auth_service.dart';
import 'package:estructura_flutter/data/service/notifications_service.dart';
import 'package:estructura_flutter/data/repositories/loginRepository.dart';
import 'package:estructura_flutter/ui/widgets/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final LoginRepository _loginRepository;

  const LoginForm({Key? key, required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // print(state);
        if (state.isFailure) {
          _showError(context, "Login failed");
        }

        if (state.isSuccess) {
          Navigator.pushNamed(context, 'location');
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Container(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _emailController,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                  ),
                  validator: (_) {
                    return !state.isEmailValid ? 'Invalid Email' : null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Password",
                  ),
                  autocorrect: false,
                  obscureText: true,
                  validator: (_) {
                    return !state.isPasswordValid ? 'Invalid Password' : null;
                  },
                ),
                SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    child: Text(
                      state.isSubmitting ? 'Logging In...' : 'LogIn',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: state.isSubmitting
                      ? null
                      : () async {
                          if (isButtonEnabled(state)) {
                            _onFormSubmitted();
                          }
                        },
                  /* onPressed: () {
                    if (isButtonEnabled(state)) {
                      _onFormSubmitted();
                    }
                  },*/
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onEmailChange() {
    _loginBloc.add(ValidateEmailOnChange(email: _emailController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginWithCredentialsPressed(
        email: _emailController.text, password: _passwordController.text));
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
