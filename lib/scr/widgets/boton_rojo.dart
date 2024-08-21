import 'package:flutter/material.dart';

import 'package:piproy/channel/channel_android.dart';

import 'package:piproy/scr/pages/autorizar_sms.dart';
import 'package:piproy/scr/pages/botonrojo_page.dart';

import 'package:piproy/scr/widgets/boton_rojo_dibujo.dart';

Widget botonRojoHeader(BuildContext context, bool activo) {
  return GestureDetector(
      onTap: () async {
        if (activo) {
          AndroidChannel _androidChannel = AndroidChannel();
          final bool autorizado = await _androidChannel.tengoPermisoSms();
          if (autorizado) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BotonRojoPage()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AutorizarSms()));
          }
        }
      },
      child: activo
          ? BotonRojo()
          : Container(
              height: 100,
              width: 100,
            ));
}
