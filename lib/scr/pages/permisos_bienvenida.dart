import 'package:flutter/material.dart';

import 'package:piproy/scr/pages/permisos_contactos.dart';

import '../widgets/logo_header.dart';

class BienvenidaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    'Bienvenidos a:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: Color.fromARGB(255, 155, 185, 182)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  logoHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      TextoBienvenida(
                        texto: '    Boton de alerta de emergencia ',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextoBienvenida(
                        texto:
                            '    VitalfonSOS enviara mensaje  indicando su localización y realizrá una llamada de emergencia  a contactos seleccionados.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextoBienvenida(
                        texto:
                            '    A continuación vitalfonSOS necesita autorización para acceder a varias opciones del teléfono cuando esté en uso el app. Estos permisos son indispensables para que vitalfonSOS pueda enviar el mensaje  y realice la llamada de emergencia.		',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InstalacionPage()));

                    // Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      // side: BorderSide() ,
                      backgroundColor: Color.fromARGB(255, 4, 135, 211)),
                  child: Text(
                    'siguiente ->',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ],
          ),
        ),
      )),
    ));
  }
}

class TextoBienvenida extends StatelessWidget {
  final String texto;
  TextoBienvenida({
    required this.texto,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 155, 185, 182)),
    );
  }
}
