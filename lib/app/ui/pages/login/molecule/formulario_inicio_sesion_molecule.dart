import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listo/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:injector/injector.dart';

import 'package:listo/app/ui/widgets/atom/campo_contrasenia_atom.dart';
import 'package:listo/app/ui/widgets/atom/titulo_primario_atom.dart';
import 'package:listo/app/ui/widgets/atom/alerta_cargando_atom.dart';
import 'package:listo/app/domain/blocs/login/login_bloc.dart';
import 'package:listo/app/ui/widgets/atom/boton_atom.dart';
import 'package:listo/app/ui/widgets/atom/campo_atom.dart';
import 'package:listo/app/ui/util/alertas_util.dart';
import 'package:listo/app/ui/routes/routes.dart';

class FormularioInicioSesion extends StatefulWidget {
  FormularioInicioSesion({Key? key}) : super(key: key);

  @override
  FormularioInicioSesionState createState() => FormularioInicioSesionState();
}

class FormularioInicioSesionState extends State<FormularioInicioSesion> {
  final FormGroup form = fb.group(<String, Object>{
    'correo': ['', Validators.required, Validators.email],
    'clave': ['', Validators.required, Validators.minLength(6)],
  });

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => Injector.appInstance.get<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSubmitting) {
            AlertaCargandoWidget().cargando(context);
          }

          if (state.isFailure) {
            Navigator.pop(context); //pop dialog

            Alertas().mostrarAlerta(
              context: context,
              mensaje: "Credenciales Inválidas",
              tipoError: true,
            );
          }

          if (state.isSuccess) {
            Navigator.pop(context); //pop dialog
            Navigator.pushNamed(context, Routes.splash);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) => (ReactiveFormBuilder(
                form: () => form,
                builder: (context, form, child) {
                  return Column(children: [
                    TituloPrimarioWidget(
                      texto: 'Iniciar sesión',
                    ),
                    SizedBox(height: 15),
                    CampoWidget(
                      nombreFormulario: 'correo',
                      tipoTeclado: TextInputType.emailAddress,
                      sugerenciaCampo: 'ejemplo@gmail.com',
                      icono: FaIcon(
                        FontAwesomeIcons.at,
                      ),
                      mensajesError: (errores) => {
                        ValidationMessage.required: 'Name must not be Titulo',
                      },
                    ),
                    SizedBox(height: 10),
                    CampoContraseniaWidget(
                      nombreFormulario: 'clave',
                      tipoTeclado: TextInputType.text,
                      sugerenciaCampo: '************',
                      icono: FaIcon(
                        FontAwesomeIcons.lock,
                      ),
                      mensajesError: (errores) => {
                        ValidationMessage.required: 'Name must not be Titulo',
                      },
                    ),
                    SizedBox(height: 10),
                    BotonWidget(
                      texto: 'Ingresar',
                      color: Colors.blueAccent,
                      accion: _iniciarSesion,
                    )
                  ]);
                }))),
      ),
    );
  }

  void _iniciarSesion() {
    if (form.valid) {
      InicioSesionDTO _inicioSesionDTO = InicioSesionDTO(
        correo: form.control('correo').value,
        contrasena: form.control('clave').value,
      );
      _loginBloc
          .add(LoginWithCredentialsPressed(inicioSesionDTO: _inicioSesionDTO));
    } else {
      print("Formulario no valido");
    }
  }
}
