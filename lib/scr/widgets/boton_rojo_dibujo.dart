import 'package:flutter/material.dart';

class BotonRojo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    double ancho = 120;
    double alto = 120;
    double font = 20;
    double icon = 60;
    if (width <= 320) {
      ancho = 100;
      alto = 100;
      font = 15;
      icon = 50;
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.call, //Icons.health_and_safety_outlined,
              size: icon, // icon,
              color: Color.fromARGB(255, 255, 230, 7)),
          Text(
            'S O S',
            style: TextStyle(
                fontSize: font, //font,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 246, 242, 4)),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.red[900],
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      // border:
      //     Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
      height: alto,
      width: ancho,
    );
  }
}
