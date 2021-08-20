import 'dart:convert';

User userFromJson(String str) =>
    User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
        username: json["valor1"],
        password: json["valor2"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
