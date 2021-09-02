import 'package:flutter/material.dart';

class BotonWidget extends StatelessWidget {
  final String texto;
  final Color? color;
  final Color? colorTexto;
  final double? tamano;
  final VoidCallback accion;

  const BotonWidget(
      {Key? key,
      required this.texto,
      this.color,
      this.tamano,
      this.colorTexto,
      required this.accion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          child: Center(
        child: Text(
          texto,
          style: TextStyle(fontSize: tamano, color: colorTexto ?? Colors.white),
        ),
      )),
      onPressed: () => accion(),
    );
  }
}
