import 'package:agenda_crud/app/database/sqlite/script.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class Connection {
  static Database db;

  static Future<Database> get() async {
    if (db == null) {
      var path = join(await getDatabasesPath(), 'banco');
      deleteDatabase(path);
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (dbs, v) {
          dbs.execute(createTable);
          dbs.execute(insert1);
          dbs.execute(insert2);
          dbs.execute(insert3);
        },
      );
    }
    return db;
  }
}
