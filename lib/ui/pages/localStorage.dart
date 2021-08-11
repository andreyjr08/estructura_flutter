/*import 'package:estructura_flutter/domain/entities/DataLocalStorage.dart';
import 'package:estructura_flutter/ui/util/general.dart';
import 'package:flutter/material.dart';

class LocalStorage extends StatelessWidget {
  final general = new General();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: _crearBoton(context),
      floatingActionButton: _crearBoton2(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
        future: general.getDataLocalStorage(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DataLocalStorage>> snapshot) {
          if (snapshot.hasData) {
            final dataLocalStorage = snapshot.data;
            return ListView.builder(
              itemCount: dataLocalStorage!.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, dataLocalStorage[i]),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _crearItem(BuildContext context, DataLocalStorage dataLocalStorage) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direccion) {
        print(">>>");
      },
      child: ListTile(
        title: Text('${dataLocalStorage.valor1} ${dataLocalStorage.valor2}'),
        subtitle: Text("Prueba"),
        onTap: () => Navigator.pushNamed(context, 'persona',
            arguments: dataLocalStorage),
      ),
    );
  }

  _crearBoton2(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        general.saveToStorage();
      },
    );
  }

  _crearBoton(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.construction),
            onPressed: () {
              general.getDataLocalStorage();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              general.clearDTO();
            },
          ),
          IconButton(
            icon: Icon(Icons.clear_all_rounded),
            onPressed: () {
              general.clearStorage();
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              general.pruebaDTO();
            },
          ),
        ],
      ),
    );
  }
}*/
