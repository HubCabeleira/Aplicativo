import 'package:agenda_crud/app/database/sqlite/connection.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';

class listaContato extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await Connection.get();
    return db.query("contact");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var lista = futuro.data;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Contate Emergency'),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyApp.FORMULARIO);
                        })
                  ],
                ),
                body: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    var avatar = CircleAvatar(
                      backgroundImage: NetworkImage(contato['link_avatar']),
                    );
                    return ListTile(
                      leading: avatar,
                      title: Text(contato['nomes']),
                      subtitle: Text(contato['numeros']),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: null),
                            IconButton(icon: Icon(Icons.delete), onPressed: null),
                          ],
                        ), //Linha
                      ), //Estrutura
                    ); //ListTitle
                  }, //ItemBuilder
                ) //ListView.builder
                ); //Scaffold

          } else {
            return Scaffold();
          }
        });
  }
}
