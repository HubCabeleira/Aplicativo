import 'package:agenda_crud/app/database/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class Connection {
  static Database db;
  static Future<Database> get() async {
    if (db == null) {
      String path = join(await getDatabasesPath(), 'banco');
      Database db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return db;
  }
}
