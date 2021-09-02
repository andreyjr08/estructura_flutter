import 'package:flutter/material.dart';
import 'package:listo/app/ui/pages/login/molecule/formulario_inicio_sesion_molecule.dart';
import 'package:listo/app/ui/widgets/atom/fondo_atom.dart';
import 'package:listo/app/ui/widgets/atom/tarjeta_atom.dart';

class InicioSesionTemplate extends StatelessWidget {
  const InicioSesionTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          FondoWidget(
            colorPrimario: Colors.blueAccent,
            colorSegundario: Colors.white,
            direccionGradiente: Alignment.topRight,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Icon(Icons.person_pin,size: 150, color: Colors.white,),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: mediaQueryData.size.width * 0.95,
                child: TarjetaWidget(
                  child: FormularioInicioSesion(),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
