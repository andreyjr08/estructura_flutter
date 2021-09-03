/*import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:estructura_flutter/data/db/database.dart';
import 'package:estructura_flutter/domain/entities/Image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class PhotoPreviewScreen extends StatefulWidget {
  @override
  _PagePhoto createState() => _PagePhoto();
}

class _PagePhoto extends State<PhotoPreviewScreen> {
  late DatabaseHandler databaseImage;

  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
        insertImage();
      });
    } catch (e) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    databaseImage = DatabaseHandler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba Camara"),
      ),
      body: Center(
          child: FutureBuilder(
              future: this.databaseImage.getPictures(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Picture>> snapshot) {
                if (snapshot.hasData && snapshot.data!.length != 0) {
                  final picture = snapshot.data;
                  final UriData? data = Uri.parse(picture![0].picture).data;
                  Uint8List myImage = data!.contentAsBytes();
                  return Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: MemoryImage(myImage), fit: BoxFit.fill)));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            label: 'image_picker_example_from_gallery',
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(ImageSource.gallery, context: context);
              },
              heroTag: 'image0',
              tooltip: 'Pick Image from gallery',
              child: const Icon(Icons.photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image2',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }

  insertImage() {
    final bytes = File(_imageFile!.path).readAsBytesSync();

    String fileName = basename(_imageFile!.path);
    String extension = fileName.split('.').last;

    String base64Image =
        "data:image/" + extension + ";base64," + base64Encode(bytes);

    Picture picture = Picture(title: 'Imagen Perfil', picture: base64Image);

    this.databaseImage.updateImage(1, picture);
  }
}
*/