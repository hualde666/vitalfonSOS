import 'package:flutter/material.dart';

import 'package:piproy/scr/widgets/boton_ayuda_dibujo.dart';
import 'package:piproy/scr/widgets/boton_rojo.dart';
import 'package:piproy/scr/widgets/boton_verde.dart';
import 'package:piproy/scr/widgets/header_app.dart';

import 'package:piproy/scr/widgets/inicio_boton.dart';

import 'package:piproy/scr/ayuda_widget/ayuda_introduccion.dart';
import 'package:piproy/scr/ayuda_widget/ayuda_llamada_sos.dart';
import '../ayuda_widget/ayuda_configurar.dart';

import '../ayuda_widget/ayuda_contacs_sms.dart';

import '../ayuda_widget/ayuda_mensaje_emergencia.dart';

class Ayuda extends StatelessWidget {
  final String pagina;
  Ayuda({required this.pagina});
  @override
  Widget build(BuildContext context) {
    // final String pagina = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(
            context,
            'A Y U D A',
            Text(
              pagina,
              style: TextStyle(fontSize: 25, color: Colors.black54),
            ),
            30.0,
            true,
            pagina),
        backgroundColor: Colors.white,
        body: contenido(pagina),
      ),
    );
  }

  Widget contenido(String pagina) {
    Widget ayuda = Center(
        child: Container(
            child: Text(
      pagina,
      style: TextStyle(color: Colors.red),
    )));
    switch (pagina) {
      case 'Introducción':
        ayuda = AyudaIntroduccionPage();
        break;
      case 'Configuración':
        ayuda = AyudaConfigurarPage();
        break;
      case 'Mensaje de emergencia':
        ayuda = AyudaMensajeEmergenciaPage();
        break;
      case 'Contactos SMS de SOS':
        ayuda = AyudaContactosSms();
        break;
      case 'Llamada de emergencia':
        ayuda = AyudaLlamadaSosPage();
        break;
    }
    return ayuda;
  }
}

Widget headerAyuda(BuildContext context, String pagina) {
  return PreferredSize(
    preferredSize: Size.fromHeight(190.0),
    child: Container(
      width: double.infinity,
      child: Column(
        children: [
          tresBotonesHeader(context, pagina),
          SizedBox(
            height: 1,
          ),
          Container(
            child: Text('Ayuda',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 25)),
          ),
        ],
      ),
    ),
  );
}

Widget tresBotonesHeader(BuildContext context, String pagina) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          InicioBoton(pagina: pagina),
          SizedBox(
            height: 10,
          ),
          botonRojoHeader(context, true)
        ]),
        //
        // Reloj(),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // AyudaBoton(pagina: pagina),
            BotonAyudaDibujo(),
            SizedBox(
              height: 10,
            ),

            botonBackHeader(context, 'Ayuda')
          ],
        )
      ], // Ho
    ),
  );
}
