import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class listaContato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contate List'), actions: [
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(MyApp.FORMULARIO);
            })
      ]),
      body: ListView(),
    );
  }
}
