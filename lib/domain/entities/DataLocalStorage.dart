import 'dart:convert';

DataLocalStorage personaModelFromJson(String str) =>
    DataLocalStorage.fromJson(json.decode(str));

String personaModelToJson(DataLocalStorage data) => json.encode(data.toJson());

class DataLocalStorage {
  DataLocalStorage({
    this.valor1,
    this.valor2,
    this.valor3,
  });

  int? valor1;
  String? valor2;
  List<dynamic>? valor3;

  factory DataLocalStorage.fromJson(Map<String, dynamic> json) =>
      DataLocalStorage(
        valor1: json["valor1"],
        valor2: json["valor2"],
        valor3: List<dynamic>.from(json["valor3"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "valor1": valor1,
        "valor2": valor2,
        "valor3": List<dynamic>.from(valor3!.map((x) => x)),
      };
}
