import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CampoWidget extends StatelessWidget {
  const CampoWidget({
    Key? key,
    this.sugerenciaCampo,
    this.etiquetaCampo,
    required this.tipoTeclado,
    this.icono,
    this.nombreFormulario,
    this.mensajesError,
  }) : super(key: key);

  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<String>)? mensajesError;
  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final TextInputType tipoTeclado;
  final FaIcon? icono;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReactiveTextField<String>(
          key: key,
          formControlName: nombreFormulario,
          keyboardType: tipoTeclado,
          decoration: InputDecoration(
            hintText: sugerenciaCampo,
            labelText: etiquetaCampo,
            icon: icono,
          ),
          validationMessages: mensajesError),
    );
  }
}
