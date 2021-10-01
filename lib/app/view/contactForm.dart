import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:agenda_crud/app/view/contact_form_back.dart';

class formularioContatos extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldNome(ContactFormBack back) {
    return TextFormField(validator: back.validateName, onSaved: (newValue) => back.contact.nomes = newValue, initialValue: back.contact.nomes, decoration: InputDecoration(labelText: 'Name: '));
  }

  Widget fieldNumero(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validatePhone,
        onSaved: (newValue) => back.contact.numeros = newValue,
        initialValue: back.contact.numeros,
        inputFormatters: [
          mask
        ],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Number: ', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(validator: back.validateEmail, onSaved: (newValue) => back.contact.email = newValue, initialValue: back.contact.email, decoration: InputDecoration(labelText: 'E-mail: '));
  }

  Widget fieldUrlImagem(ContactFormBack back) {
    return TextFormField(onSaved: (newValue) => back.contact.link_avatar = newValue, initialValue: back.contact.link_avatar, decoration: InputDecoration(labelText: 'Link picture:', hintText: 'http://www.site.com'));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadaster Contact'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState.validate();
                _form.currentState.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldNome(_back),
              fieldEmail(_back),
              fieldNumero(_back),
              fieldUrlImagem(_back)
            ],
          ),
        ), //Formu
      ), // Padding
    ); //Scaffold
  }
}
