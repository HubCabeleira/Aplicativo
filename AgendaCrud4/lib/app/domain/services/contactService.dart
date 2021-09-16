import 'package:agenda_crud/app/domain/interfaces/contactDao.dart';
import 'package:agenda_crud/app/domain/exception/domainLayerException.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validateName(contact.nomes);
    validateEmail(contact.email);
    validatePhone(contact.numeros);
    dao.save(contact);
  }

  remove(dynamic id) {
    dao.remove(id);
  }

  Future<List<Contact>> find() {
    return dao.find();
  }

// nome → seja obrigatório, tenha no mínimo 3 caracteres e no máximo 50
  validateName(String nomes) {
    var min = 3;
    var max = 50;

    if (nomes == null) {
      throw new DomainLayerException('O nome é obrigatório.');
    } else if (nomes.length < min) {
      throw new DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    } else if (nomes.length > max) {
      throw new DomainLayerException('O nome deve possuir no máximo $max caracteres.');
    }
  }

// e-mail → seja obrigatório e tenha @
  validateEmail(String email) {
    if (email == null) {
      throw new DomainLayerException('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerException('O e-mail deve possuir @.');
    }
  }

// telefone → seja obrigatório e tenha o formato (99) 9 9999-9999
  validatePhone(String numeros) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (numeros == null) {
      throw new DomainLayerException('O telefone é obrigatório.');
    } else if (!format.hasMatch(numeros)) {
      throw new DomainLayerException('Formato inválido. O formato deve ser (99) 9 9999-9999.');
    }
  }
}
