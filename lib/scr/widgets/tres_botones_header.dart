import 'package:flutter/material.dart';
import 'package:piproy/scr/pages/botonrojo_page.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
//import 'package:piproy/scr/widgets/boton_amarillo.dart';

import 'package:piproy/scr/widgets/boton_verde.dart';
import 'package:provider/provider.dart';

Widget tresBotonesHeader(
  BuildContext context,
  bool rojo,
  String pagina,
) {
  return Container(
    padding: EdgeInsets.only(top: 5, left: 5, right: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        pagina == 'Configurar'
            ? botonHomeHeader(context, pagina)
            : botonBackHeader(context, pagina)
      ], // Ho
    ),
  );
}

botonHomeHeader(BuildContext context, String pagina) {
  double width = MediaQuery.of(context).size.width;
  //double height = MediaQuery.of(context).size.height;
  final pref = Provider.of<Preferencias>(context);
  double ancho = 100;
  double alto = 100;
  double font = 20;
  double icon = 40;
  if (width <= 320) {
    ancho = 80;
    alto = 80;
    font = 15;
    icon = 40;
  }
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BotonRojoPage()));
    },
    child: Container(
      // child: Image(
      //     image: AssetImage('assets/boton_verde.png'), fit: BoxFit.contain),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: icon, color: Colors.white),

          Text(
            'INICIO',
            style: TextStyle(fontSize: font, color: Colors.white),
          ) //color: Colors.red),
        ],
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              //  color: Colors.black,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],
          color: //pref.paleta == '4'
              pref.backgroundColor,
          border: Border.all(color: pref.backgroundColor),
          //  : Colors.green[900],
          borderRadius: BorderRadius.all(Radius.circular(100))),
      //     border:
      //         Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
      height: alto,
      width: ancho,
      //color: Colors.red),
    ),
  );
}
