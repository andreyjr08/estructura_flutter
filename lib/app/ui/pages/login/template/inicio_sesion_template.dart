import 'package:estructura/app/clases/laguage.dart';
import 'package:estructura/app/localizacion/language_constants.dart';
import 'package:estructura/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:estructura/app/ui/pages/login/molecule/formulario_inicio_sesion_molecule.dart';
import 'package:estructura/app/ui/widgets/atom/fondo_atom.dart';
import 'package:estructura/app/ui/widgets/atom/tarjeta_atom.dart';

import '../../../../my_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  InicioSesionTemplate createState() => InicioSesionTemplate();
}

class InicioSesionTemplate extends State<HomePage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    print(S.of(context).homePageAppBarTitle);
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).prueba("Andrey")),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) {
                _changeLanguage(language!);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
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
            child: Icon(
              Icons.person_pin,
              size: 150,
              color: Colors.white,
            ),
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
