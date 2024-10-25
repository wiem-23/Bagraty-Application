import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class Bagratydb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'bagraty.db');
    Database mydb =
        await openDatabase(path, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onupgrade done");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "fourrages"(
id_f  INTEGER NOT NULL PRIMARY KEY INTEGER AUTOINCREMENT, 
nom_f TEXT NOT NULL, 
ms_f REAL NOT NULL ,
 ufl_f REAL NOT NULL,
  pdin_f INTEGER NOT NULL , 
  pdie_f INTEGER NOT NULL , 
  ndf_f INTEGER NOT NULL)
''');
    await db.execute('''
CREATE TABLE "concentres"(
id_c INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT, 
nom_c TEXT NOT NULL, 
ms_c REAL NOT NULL ,
 ufl_c REAL NOT NULL,
  pdin_c INTEGER NOT NULL , 
  pdie_c INTEGER NOT NULL , 
  ndf_c INTEGER NOT NULL)
''');
    await db.execute('''
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
''');
    print("oncreate done");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
}
