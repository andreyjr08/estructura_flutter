/*import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CampoMoneyFormat extends StatelessWidget {
  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  const CampoMoneyFormat({
    Key? key,
    this.sugerenciaCampo,
    this.etiquetaCampo,
    this.icono,
    this.nombreFormulario,
    this.mensajesError,
  }) : super(key: key);

  final String? nombreFormulario;
  final Map<String, String> Function(FormControl<String>)? mensajesError;
  final String? sugerenciaCampo;
  final String? etiquetaCampo;
  final FaIcon? icono;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReactiveTextField<String>(
          key: key,
          formControlName: nombreFormulario,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: _currency,
            hintText: sugerenciaCampo,
            labelText: etiquetaCampo,
            icon: icono,
          ),
          validationMessages: mensajesError),
    );
  }

  void cambioCorreo(AbstractControl<dynamic> control) {
    control.valueChanges.listen((value) {
      print(value);
      value = _formatNumber(value.replaceAll(',', ''));
      control.value = value;
    });
  }
}
*/