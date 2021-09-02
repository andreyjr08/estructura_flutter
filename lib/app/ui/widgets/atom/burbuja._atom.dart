import 'package:flutter/material.dart';

class BurbujaWidget extends StatelessWidget {

  const BurbujaWidget({Key? key, this.color, this.child}) : super(key: key);
    final Color? color;
    final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color ?? Colors.white),
    );
  }
}


/* Color.fromRGBO(255, 255, 255, 0.05) */