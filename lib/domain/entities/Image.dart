import 'dart:convert';

Picture userFromJson(String str) => Picture.fromJson(json.decode(str));
String userToJson(Picture data) => json.encode(data.toJson());

class Picture {
  Picture({
    required this.title,
    required this.picture,
  });

  String title;
  String picture;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        title: json["valor1"],
        picture: json["valor2"],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'picture': picture,
      };
}
