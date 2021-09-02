import 'package:flutter/material.dart';

class TituloPrimarioWidget extends StatelessWidget {
  const TituloPrimarioWidget({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        texto,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
