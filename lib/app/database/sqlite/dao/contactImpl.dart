import 'package:agenda_crud/app/domain/interfaces/contactDao.dart';
import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:sqflite/sqflite.dart';
import '../connection.dart';

class ContactImple implements ContactDAO {
  Database _db;

  @override
  Future<List<Contact>> find() async {
    //TODO: implement find
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(id: linha['id'], nomes: linha['nomes'], numeros: linha['numeros'], email: linha['email'], link_avatar: linha['link_avatar']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    //TODO: implement find
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [
      id
    ]);
  }

  @override
  save(Contact contact) async {
    //TODO: implement find
    _db = await Connection.get();
    var sql;
    if (contact.id == null) {
      sql = 'INSERT INTO contact( nomes, numeros, email, link_avatar) VALUES (?,?,?,?)';
      _db.rawInsert(sql, [
        contact.nomes,
        contact.numeros,
        contact.email,
        contact.link_avatar
      ]);
    } else {
      sql = 'UPDATE contact SET nomes=? numeros=? email=? link_avatar=? WHERE id=?';
      _db.rawUpdate(sql, [
        contact.nomes,
        contact.numeros,
        contact.email,
        contact.link_avatar,
        contact.id
      ]);
    }
  }
}
