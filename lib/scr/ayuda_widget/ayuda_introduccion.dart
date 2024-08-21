import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:piproy/scr/providers/provider_SharedPref().dart';
import '../widgets/parrafos_ayuda.dart';

class AyudaIntroduccionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _listaAyudaHome(context);
  }

  Widget _listaAyudaHome(BuildContext context) {
    List<Widget> _listaAyuda = _crearListaAyuda(context);

    return ListView.builder(
        itemCount: _listaAyuda.length,
        itemBuilder: (contest, i) {
          return _listaAyuda[i];
        });
  }

  List<Widget> _crearListaAyuda(BuildContext context) {
    //final pref = Provider.of<Preferencias>(context);
    List<Widget> lista = [];
    //lista.addAll(ayudaEncabezado(context, 'Introducción'));
    List<Widget> lista2 = [
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            AyudaParrafo(
              texto:
                  '     VitalfonSOS es un boton de emergencia. Al  pulsarlo envía un SMS, con mensaje y la geolocalización actual, a todos los contactos seleccionados previamente.',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '     Tambien realiza una llamada a un contacto seleccionado .',
            ),
            SizedBox(
              height: 10,
            ),
            AyudaParrafo(
              texto:
                  '     El acceso a la configuración se hace a través del ícono de la llave que aparece en la pagina de inicio.',
            ),
          ],
        ),
      ),
    ];

    lista.addAll(lista2);
    return lista;
  }
}
