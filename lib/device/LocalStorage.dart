import 'dart:convert';
import 'package:estructura_flutter/domain/entities/DataLocalStorage.dart';
import 'package:localstorage/localstorage.dart';

class InfoLocalStorage {
  final LocalStorage storage = new LocalStorage('todo_app');
  DataLocalStorage dataLocalStorage = new DataLocalStorage();

  saveToStorage(DataLocalStorage dataLocalStorage) {
    storage.setItem('todos', personaModelToJson(dataLocalStorage));
  }

  Future<List<DataLocalStorage>> getDataLocalStorage() async {
    final Map<String, dynamic> decodeData =
        json.decode(storage.getItem('todos'));

    final List<DataLocalStorage> dataLocalStorage = [];
    final dataTemp = DataLocalStorage.fromJson(decodeData);

    dataLocalStorage.add(dataTemp);

    return dataLocalStorage;
  }

  clearStorage() async {
    await storage.clear();
  }
}
