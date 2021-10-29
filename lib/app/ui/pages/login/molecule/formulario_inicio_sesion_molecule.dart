import 'package:estructura/app/ui/widgets/atom/campo_money_format_atom.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:estructura/app/domain/entities/login/inicio_sesion_dto.dart';
import 'package:intl/intl.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:injector/injector.dart';

import 'package:estructura/app/ui/widgets/atom/campo_contrasenia_atom.dart';
import 'package:estructura/app/ui/widgets/atom/titulo_primario_atom.dart';
import 'package:estructura/app/ui/widgets/atom/alerta_cargando_atom.dart';
import 'package:estructura/app/domain/blocs/login/login_bloc.dart';
import 'package:estructura/app/ui/widgets/atom/boton_atom.dart';
import 'package:estructura/app/ui/widgets/atom/campo_atom.dart';
import 'package:estructura/app/ui/util/alertas_util.dart';
import 'package:estructura/app/ui/routes/routes.dart';

class FormularioInicioSesion extends StatefulWidget {
  FormularioInicioSesion({Key? key}) : super(key: key);

  @override
  FormularioInicioSesionState createState() => FormularioInicioSesionState();
}

class FormularioInicioSesionState extends State<FormularioInicioSesion> {
  List<InicioSesionDTO> list = [
    InicioSesionDTO(contrasena: '2cas', correo: 'carlos'),
    InicioSesionDTO(contrasena: '53453', correo: 'andrey'),
    InicioSesionDTO(contrasena: '65465', correo: 'andres'),
    InicioSesionDTO(contrasena: '76867', correo: 'juan'),
    InicioSesionDTO(contrasena: '76867', correo: 'oscar'),
    InicioSesionDTO(contrasena: '76867', correo: 'ruben'),
  ];

  final FormGroup form = fb.group(<String, Object>{
    'correo': ['', Validators.required],
    'clave': ['', Validators.required, Validators.minLength(6)],
    'menu': FormControl<InicioSesionDTO>(
        validators: [Validators.required],
        value: InicioSesionDTO(contrasena: '2cas', correo: 'cascas')),
  });

  @override
  void initState() {
    super.initState();
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
                    SizedBox(height: 15),
                    //CampoMoneyFormat(nombreFormulario: 'money',),
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

                    ReactiveDropdownSearch<InicioSesionDTO>(
                      label: "Name",
                      formControlName: 'menu',
                      decoration: InputDecoration(
                        helperText: '',
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      showSearchBox: true,
                      items: list,
                      itemAsString: (InicioSesionDTO item) =>
                          item.correo.toString(),
                      dropdownBuilder: _customDropDownExample,
                      popupItemBuilder: _customPopupItemBuilderExample2,
                    ),

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
    print(
      (form.control('menu').value).correo,
    );
    print(
      (form.control('menu').value).contrasena,
    );
    /*if (form.valid) {
      InicioSesionDTO _inicioSesionDTO = InicioSesionDTO(
        correo: form.control('correo').value,
        contrasena: form.control('clave').value,
      );
      _loginBloc
          .add(LoginWithCredentialsPressed(inicioSesionDTO: _inicioSesionDTO));
    } else {
      print("Error en el formulario");
    }*/
  }

  Future<List<InicioSesionDTO>> getData(String filter) async {
    print(">>>>>>>>>>>>>>>>>>>>" + filter);
    return list
        .where((element) => element.correo.toLowerCase().contains(filter))
        .toList();
  }

  Widget _customDropDownExample(
      BuildContext context, InicioSesionDTO? item, String itemDesignation) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(item.correo),
        subtitle: Text(
          item.contrasena.toString(),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, InicioSesionDTO item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.correo),
        subtitle: Text(item.contrasena.toString()),
      ),
    );
  }
}
