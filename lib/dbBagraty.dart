// ignore_for_file: avoid_print, duplicate_ignore

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

Database? _database;
List wholeDataList = [];

class BagratyDatabase {
  Future get database async {
    if (_database != null) {
      print("bd non null");
      return _database;
    }

    _database = await _initializeDB('Bagratydb.db');
    return _database;
  }

  Future _initializeDB(String filepath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filepath);
    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("upgrade =======================================================");
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE Exploitant(id_ex INTEGER PRIMARY KEY AUTOINCREMENT, 
nom_ex  TEXT NOT NULL ,
nbr_vache  INTEGER NOT NULL , 
gov_ex  TEXT NOT NULL , 
tel_ex INTEGER NOT NULL 
)
''');
    await db.execute('''
CREATE TABLE Vache(
id_v INTEGER  PRIMARY KEY AUTOINCREMENT, 
id_m  NOT NULL , 
id_p  NOT NULL , 
poid REAL NOT NULL, 
age INTEGER NOT NULL , 
prod_lait INTEGER  , 
mois_g INTEGER NOT NULL,
temperature INTEGER NOT NULL,
humidite INTEGER NOT NULL
)
''');
    await db.execute('''
CREATE TABLE Nourriture(
id_n  INTEGER  PRIMARY KEY AUTOINCREMENT, 
motif_n TEXT NOT NULL, 
nom_n TEXT NOT NULL, 
ms_n REAL NOT NULL ,
ufl_n REAL NOT NULL,
pdin_n INTEGER NOT NULL , 
pdie_n INTEGER NOT NULL , 
ndf_n INTEGER NOT NULL)
''');
    print("db created");
  }

// ignore: non_constant_identifier_names
  Future insertData({nom_ex, nbr_vache, gov_ex, tel_ex}) async {
    final db = await database;
    await db.insert("Exploitant", {
      "nom_ex": nom_ex,
      "nbr_vache": nbr_vache,
      "gov_ex": gov_ex,
      "tel_ex": tel_ex
    });
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print("${nom_ex} added successfully");
    return "added";
  }

  // ignore: non_constant_identifier_names
  Future seConnecter({required int tel_ex}) async {
    final db = await database;
    return await db
        .query("Exploitant", where: "id_ex = ?", whereargs: [tel_ex]);
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await database;
    return db.query('Exploitant', orderBy: "id_ex");
  }
/*   Future readData() async {
    // ignore: await_only_futures
    final db = await database;

    final allData = await db!.query("Exploitant");
// ignore: avoid_print
    wholeDataList = allData.print(allData);
    return "lue";
  } */
}
