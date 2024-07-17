import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/provider_pref.dart';

import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/pages/ayuda_nueva.dart';
import 'package:piproy/scr/pages/contact_llamada_emergencia.dart';
import 'package:piproy/scr/pages/contacts_por_grupo.dart';
import 'package:piproy/scr/pages/mensaje_emergencia.dart';

import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/db_provider.dart';

import 'package:piproy/scr/widgets/header_app.dart';

class ConfiguracionPage extends StatelessWidget {
  final apiProvider = new AplicacionesProvider();

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);
    final colorBloqueo = Colors.black26;
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(
            context, 'Configuración', Text(''), 0.0, false, 'Configurar'),

        // title: Text('Configuración'),

        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
              leading: Icon(
                Icons.help,
                size: 40.0,
                color: Theme.of(context).primaryColor,
              ),
              title: Text('Ayuda',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                  )),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AyudaNuevaPage()));
              }),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.message,
            texto: 'Redactar mensaje de emergencia',
            onPress: EmergenciaMensaje(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
              leading: Icon(
                Icons.contact_phone,
                size: 35.0,
                color: pref.modoConfig
                    ? Theme.of(context).primaryColor
                    : colorBloqueo,
              ),
              title: Text('Establecer destinatarios del mensaje de emergencia',
                  style: TextStyle(
                    fontSize: 25,
                    color: pref.modoConfig
                        ? Theme.of(context).primaryColor
                        : colorBloqueo,
                  )),
              onTap: () {
                //Navigator.pop(context);
                // Navigator.pushNamed(context, 'emergiContactos');
                if (pref.modoConfig) {
                  final String grupo = 'Emergencia';

                  if (!apiProvider.contactgrupos.contains(grupo)) {
                    Provider.of<AplicacionesProvider>(context, listen: false)
                        .agregarGrupoContact(grupo);
                    final nuevo =
                        new ApiTipos(grupo: grupo, nombre: "", tipo: "2");
                    DbTiposAplicaciones.db.nuevoTipo(nuevo);
                  }
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .tipoSeleccion = grupo;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactsPorGrupoPage()));
                }
              }),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
              leading: Icon(
                Icons.phone_forwarded,
                size: 35.0,
                color: pref.modoConfig
                    ? Theme.of(context).primaryColor
                    : colorBloqueo,
              ),
              title: Text('Establecer destinatario de la llamada de emergencia',
                  style: TextStyle(
                    fontSize: 25,
                    color: pref.modoConfig
                        ? Theme.of(context).primaryColor
                        : colorBloqueo,
                  )),
              onTap: () {
                if (pref.modoConfig) {
                  Provider.of<AplicacionesProvider>(context, listen: false)
                      .tipoSeleccion = 'Emergencia';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactLlamadaEmrgencia()));
                }
              }),
        ]),
      ),
    );
  }
}
