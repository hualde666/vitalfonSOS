import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:piproy/scr/models/contactos_modelo.dart';

import 'package:piproy/scr/providers/provider_pref.dart';

import 'package:piproy/scr/widgets/avatar_contacto.dart';

class WidgetContacto extends StatelessWidget {
  const WidgetContacto({
    super.key,
    required this.contacto,
    required this.seleccionado,
  });

  final ContactoDatos contacto;

  final bool seleccionado;

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    // final bool seleccionado =
    //     contacto.telefono == SharedPref().telefonoEmergencia;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.infinity,
      padding: EdgeInsets.only(left: 4),
      height: 120.0,
      decoration: BoxDecoration(
          color: seleccionado
              ? pref.backgroundColor
              : pref.backgroundColor.withOpacity(0.3), //Colors.grey[700],
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AvatarContacto(contacto),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(contacto.nombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: seleccionado
                                ? Colors.white //Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                            fontSize: 30))),
                Center(
                    child: Text(contacto.telefono,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: seleccionado
                                ? Colors.white //Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                            fontSize: 25)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
