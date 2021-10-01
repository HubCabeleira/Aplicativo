import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/services/contactService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _nameIsValid;
  bool _emailIsValid;
  bool _phoneIsValid;

  @action
  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null) ? Contact() : parameter;
  }

  save() async {
    await _service.save(contact);
  }

  String validateName(String name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toStrind();
    }
  }

  String validateEmail(String email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toStrind();
    }
  }

  String validatePhone(String phone) {
    try {
      _service.validatePhone(phone);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toStrind();
    }
  }
}
