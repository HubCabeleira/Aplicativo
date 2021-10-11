import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contactDao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactDAOFirestore implements ContactDAO {
  CollectionReference contactCollection;

  ContactDAOFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs.map((doc) => Contact(id: doc.reference.id.toString(), nomes: doc['nomes'], email: doc['email'], numeros: doc['numeros'], link_avatar: doc['link_avatar'])).toList();
  }

  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set({
      'nomes': contact.nomes,
      'email': contact.email,
      'numeros': contact.numeros,
      'link_avatar': contact.link_avatar
    });
  }
}
