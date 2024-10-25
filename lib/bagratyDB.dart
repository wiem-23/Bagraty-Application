// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Bagratydb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      // ignore: avoid_print
      print("db vide");
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'bagraty.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);

    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    // ignore: avoid_print
    print("onupgrade done");
  }

  _onCreate(Database db, int version) async {
/*     await db.execute('''
CREATE TABLE "nourriture"(
id_n  INTEGER NOT NULL PRIMARY KEY INTEGER AUTOINCREMENT, 
motif_n TEXT NOT NULL, 
nom_n TEXT NOT NULL, 
ms_n REAL NOT NULL ,
 ufl_n REAL NOT NULL,
  pdin_n INTEGER NOT NULL , 
  pdie_n INTEGER NOT NULL , 
  ndf_n INTEGER NOT NULL)
'''); */

/*     await db.execute('''
CREATE TABLE "vache"(
id_v AUTOINCREMENT NOT NULL PRIMARY KEY INTEGER, 
id_m  NOT NULL , 
id_p  NOT NULL , 
poid REAL NOT NULL, 
age INTEGER NOT NULL , 
prod_lait INTEGER  , 
mois_g INTEGER NOT NULL,
temperature INTEGER NOT NULL,
humidite INTEGER NOT NULL,)
'''); */
    await db.execute('''
CREATE TABLE "exploitant"(
id INTEGER NOT NULL PRIMARY KEY  AUTOINCREMENT , 
note TEXT NOT NULL, 
)
''');
    // ignore: avoid_print
    print("oncreate done");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    List<Map> response = (await mydb!.rawInsert(sql)) as List<Map>;
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    List<Map> response = (await mydb!.rawDelete(sql)) as List<Map>;
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    List<Map> response = (await mydb!.rawUpdate(sql)) as List<Map>;
    return response;
  }
}
