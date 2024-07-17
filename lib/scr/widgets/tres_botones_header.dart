import 'package:flutter/material.dart';
//import 'package:piproy/scr/widgets/boton_amarillo.dart';

import 'package:piproy/scr/widgets/boton_verde.dart';

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
        // botonHomeHeader(context, pagina),

        botonBackHeader(context, pagina)
      ], // Ho
    ),
  );
}
