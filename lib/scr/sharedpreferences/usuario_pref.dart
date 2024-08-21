import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends ChangeNotifier {
  static final SharedPref _instancia = new SharedPref._internal();
  factory SharedPref() {
    return _instancia;
  }
  SharedPref._internal() {
    // init();
  }
  static late SharedPreferences _pref;
  static String _telefonoEmergencia = "";
  static bool _instalado = false;
  static bool _modoConfig = true;
  //static Color _backgroundColor = Color.fromARGB(255, 117, 149, 133);

  init() async {
    WidgetsFlutterBinding.ensureInitialized();

    _pref = await SharedPreferences.getInstance();
    telefonoEmergencia =
        _pref.getString('telefonoEmergencia') ?? _telefonoEmergencia;
  }

  set telefonoEmergencia(String nuevoTelefono) {
    _telefonoEmergencia = nuevoTelefono;

    _pref.setString('telefonoEmergencia', nuevoTelefono);
    notifyListeners();
  }

  String get telefonoEmergencia {
    return _pref.getString('telefonoEmergencia') ?? _telefonoEmergencia;
  }

  bool get modoConfig {
    if (_pref.getBool('modoconfig') == null) {
      _modoConfig = true;
    } else {
      _modoConfig = _pref.getBool('modoconfig')!;
    }
    return _modoConfig;
  }

  set modoConfig(bool modo) {
    _modoConfig = modo;
    _pref.setBool('modoconfig', modo);
    notifyListeners();
  }

  bool get instalado {
    _instalado = _pref.getBool('instalado') ?? false;

    return _instalado;
  }

  set instalado(bool estatus) {
    _instalado = estatus;
    _pref.setBool('instalado', estatus);
  }

  eliminarLLamadaEmergencia() {
    _pref.remove(telefonoEmergencia);
    _telefonoEmergencia = '';
  }
}
