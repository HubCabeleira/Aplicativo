import 'package:agenda_crud/app/view/formularioContato.dart';
import 'package:agenda_crud/app/view/listaContato.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const FORMULARIO = 'contact-form';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter trial',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        HOME: (context) => listaContato(),
        FORMULARIO: (context) => formularioContato(),
      },
    );
  }
}
