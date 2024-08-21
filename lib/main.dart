import 'package:flutter/material.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:piproy/scr/definicion/thema_colores.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';
import 'package:piproy/scr/providers/contactos_provider.dart';
//import 'package:piproy/scr/providers/estado_celular.dart';

import 'package:piproy/scr/pages/permisos_bienvenida.dart';
import 'package:piproy/scr/pages/botonrojo_page.dart';

void main() async {
  await SharedPref().init();
  //await AplicacionesProvider().cargarCategorias();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => new SharedPref()),
      ChangeNotifierProvider(create: (_) => new ContactosProvider()),
      // ChangeNotifierProvider(create: (_) => new EstadoProvider()),
      ChangeNotifierProvider(create: (_) => new AplicacionesProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: TextScaler.linear(0.8)),
          child: child!,
        );
      },
      title: 'vitalfonSOS',
      theme: themaApi('2'),
      //initialRoute: 'instalar',
      initialRoute: SharedPref().instalado ? 'botonRojo' : 'instalar',
      routes: rutasApp,
    );
  }
}

Map<String, WidgetBuilder> get rutasApp {
  return {
    'instalar': (_) => BienvenidaPage(),
    'botonRojo': (_) => BotonRojoPage(),
  };
}
