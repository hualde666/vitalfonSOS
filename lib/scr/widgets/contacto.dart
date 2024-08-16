import 'package:flutter/material.dart';
import 'package:piproy/scr/pages/contact_llamada_emergencia.dart';
import 'package:piproy/scr/providers/provider_pref.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';
import 'package:piproy/scr/widgets/avatar_contacto.dart';
import 'package:provider/provider.dart';

class WidgetContacto extends StatelessWidget {
  const WidgetContacto({
    super.key,
    required this.widget,
    required this.seleccionado,
  });

  final Contacto widget;

  final bool seleccionado;

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    final bool seleccionado =
        widget.contacto.telefono == SharedPref().telefonoEmergencia;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: double.infinity,
      padding: EdgeInsets.only(left: 4),
      height: 120.0,
      decoration: BoxDecoration(
          color: widget.contacto.telefono == pref.telefonoEmergencia
              ? pref.backgroundColor
              : pref.backgroundColor.withOpacity(0.3), //Colors.grey[700],
          borderRadius: BorderRadius.circular(60.0),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AvatarContacto(widget.contacto),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: Text(widget.contacto.nombre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: seleccionado
                                ? Colors.white //Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                            fontSize: 30))),
                Center(
                    child: Text(widget.contacto.telefono,
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
