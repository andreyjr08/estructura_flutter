import 'package:estructura_flutter/domain/entities/Image.dart';
import 'package:estructura_flutter/domain/entities/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)",
        );
        await database.execute(
            "CREATE TABLE image(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, picture TEXT NOT NULL)");
      },
      version: 1,
    );
  }

  Future<int> insertUser(List<Note> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('users', user.toMap());
    }
    return result;
  }

  Future<List<Note>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    return queryResult.map((e) => Note.fromMap(e)).toList();
  }

  Future<void> deleteUser(int id) async {
    final db = await initializeDB();
    await db.delete(
      'users',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> insertImage(List<Picture> picture) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var picture in picture) {
      result = await db.insert('image', picture.toJson());
    }
    return result;
  }

  Future<int> updateImage(id, Picture picture) async {
    int result = 0;
    final Database db = await initializeDB();

    await db
        .update('image', picture.toJson(), where: 'id = ?', whereArgs: [id]);

    result = await db.update('image', picture.toJson());

    return result;
  }

  Future<List<Picture>> getPictures() async {
    var dbClient = await initializeDB();
    List<Map> list = await dbClient.rawQuery('SELECT * FROM image');
    List<Picture> pictures = [];
    for (int i = 0; i < list.length; i++) {
      pictures.add(new Picture(
        title: list[i]["title"],
        picture: list[i]["picture"],
      ));
    }

    return pictures;
  }

  Future<void> deleteImage() async {
    final db = await initializeDB();
    await db.delete('image');

    print("DELETE>>>");
  }
}
