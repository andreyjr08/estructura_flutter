import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CampoContraseniaWidget extends StatefulWidget {
  CampoContraseniaWidget({
    Key? key,
    this.sugerenciaCampo,
    this.etiquetaCampo,
    required this.tipoTeclado,
    this.icono,
    this.mensajesError,
    this.nombreFormulario,
  }) : super(key: key);

  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<String>)? mensajesError;
  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final TextInputType tipoTeclado;
  final FaIcon? icono;

  @override
  _CampoContraseniaWidgetState createState() => _CampoContraseniaWidgetState();
}

class _CampoContraseniaWidgetState extends State<CampoContraseniaWidget> {
  bool _ocultar = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReactiveTextField<String>(
        key: widget.key,
        formControlName: widget.nombreFormulario,
        keyboardType: widget.tipoTeclado,
        obscureText: _ocultar,
        decoration: InputDecoration(
            hintText: widget.sugerenciaCampo,
            labelText: widget.etiquetaCampo,
            icon: widget.icono,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _ocultar = !_ocultar;
                });
              },
              child: Icon(_ocultar ? Icons.visibility : Icons.visibility_off),
            )),
        validationMessages: widget.mensajesError,
      ),
    );
  }
}
