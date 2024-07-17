import 'package:flutter/material.dart';
import 'package:piproy/scr/sharedpreferences/usuario_pref.dart';

class Preferencias extends ChangeNotifier {
  static final Preferencias _instancia = new Preferencias._internal();
  factory Preferencias() {
    return _instancia;
  }
  Preferencias._internal() {}

  static String _telefonoEmergencia = SharedPref().telefonoEmergencia;
  //static bool _instalado = SharedPref().instalado;
  static bool _modoConfig = SharedPref().modoConfig;
  static Color _backgroundColor = Color.fromARGB(255, 117, 149, 133);
  Color get backgroundColor {
    return _backgroundColor;
  }

  bool get modoConfig {
    return _modoConfig;
  }

  set modoConfig(bool modo) {
    _modoConfig = modo;

    notifyListeners();
  }

  String get telefonoEmergencia {
    return _telefonoEmergencia;
  }

  set telefonoEmergencia(String nuevoTelefono) {
    _telefonoEmergencia = nuevoTelefono;

    notifyListeners();
  }

  eliminarLLamadaEmergencia() {
    _telefonoEmergencia = '';
  }
}
