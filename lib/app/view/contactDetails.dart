import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/view/contact_details_back.dart';
import 'package:flutter/material.dart';

class detalhesContatos extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(title: Text('Worning!'), content: Text('Did not can search a APP compatible.'));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;

        return Scaffold(
          body: ListView(
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(contact.link_avatar).isAbsolute)
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(contact.link_avatar),
                      radius: radius,
                    )
                  : CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: width / 2,
                      ),
                      radius: radius,
                    ),
              Center(
                child: Text(
                  '${contact.nomes}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Phone: '),
                  subtitle: Text('${contact.numeros}'),
                  trailing: Container(
                    width: width / 4,
                    child: Row(children: [
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: () {
                            _back.launchSMS(showModalError);
                          }),
                      IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            _back.launchPhone(showModalError);
                          })
                    ]),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("E-mail:"),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              //  _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
