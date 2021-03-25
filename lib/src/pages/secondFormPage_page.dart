import 'package:aplicacion1/src/pages/formulario_page.dart';
import 'package:flutter/material.dart';

class SecondFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Argumentos parametros = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Pagina Login')),
        body: Center(
          child: Text(
              'Bienvenida ${parametros.nombre} ${parametros.email} ${parametros.password}'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
