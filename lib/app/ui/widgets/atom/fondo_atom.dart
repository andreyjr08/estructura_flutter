import 'package:flutter/material.dart';

class FondoWidget extends StatelessWidget {
  final Color colorPrimario;
  final Color colorSegundario;
  final Widget? children;
  final double? porcentajeAlto;
  final Alignment? direccionGradiente;

  FondoWidget({
    required this.colorPrimario,
    required this.colorSegundario,
    this.children,
    this.porcentajeAlto,
    this.direccionGradiente,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * (porcentajeAlto ?? 1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [colorPrimario, colorSegundario],
          begin: direccionGradiente ?? Alignment.topLeft,
        )),
        child: children);
  }
}
