import 'package:agenda_crud/app/my_app.dart';
import 'package:flutter/material.dart';

class listaContato extends StatelessWidget {
  final lista = [
    {
      'Nome': 'Polícia Militar',
      'Telefone': '190',
      'avatar': 'https://alagoasdigital.al.gov.br/uploads/admin/organ/attachment/5975e72b8c36c75066f557f5/xpmal.png.pagespeed.ic.O6R4F-cqsa.png'
    },
    {
      'Nome': 'Polícia Civil',
      'Telefone': '197',
      'avatar': 'https://pbs.twimg.com/profile_images/1052552855704489984/TNAdWnIR.jpg'
    },
    {
      'Nome': 'Samu',
      'Telefone': '192',
      'avatar': 'https://i.pinimg.com/550x/3c/f0/f7/3cf0f76ada24bd0ae332210f91e70747.jpg'
    }
  ];

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
        body: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, i) {
            var contato = lista[i];
            var avatar = CircleAvatar(
              backgroundImage: NetworkImage(contato['avatar']),
            );
            return ListTile(
              leading: avatar,
              title: Text(contato['Nome']),
              subtitle: Text(contato['Telefone']),
              trailing: Container(
                width: 100,
                child: Row(children: [
                  IconButton(icon: Icon(Icons.edit), onPressed: null),
                  IconButton(icon: Icon(Icons.delete), onPressed: null),
                ]), //Linha
              ), //Estrutura    */
            ); //ListTitle
          }, //ItemBuilder
        ) //ListView.builder
        ); //Scaffo
  }
}
