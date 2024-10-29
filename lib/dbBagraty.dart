// ignore_for_file: avoid_print, duplicate_ignore, non_constant_identifier_names

import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

Database? _database;
List wholeDataList = [];
String nom_n = 'nom_n';

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
$nom_n TEXT NOT NULL, 
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
  Future seConnecter({required int tel}) async {
    final db = await database;
    await db.rawQuery('SELECT * FROM Exploitant WHERE tel_ex=$tel ');

    return print({tel});
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

  Future insertNourriture(
      {motif_n, nom_n, ms_n, ufl_n, pdin_n, pdie_n, ndf_n}) async {
    final db = await database;
    await db.insert("Nourriture", {
      "motif_n": motif_n,
      "nom_n": nom_n,
      "ms_n": ms_n,
      "ufl_n": ufl_n,
      "pdin_n": pdin_n,
      "pdie_n": pdie_n,
      "ndf_n": ndf_n
    });
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print("${motif_n} added successfully");
    return "added";
  }

  late List<String> l = ["aa"];
  Future listeFourrages() async {
    final db = await database;
    final rows = await db
        .rawQuery('SELECT $nom_n FROM Nourriture WHERE motif_n="fourrage"');
    print(rows);
    l = rows.map((element) {
      l.add(element[{'$nom_n'}]);
    });
    return print(l);
  }

  Future listeConcentres() async {
    final db = await database;
    final rows = await db
        .rawQuery('SELECT nom_n FROM Nourriture WHERE motif_n="concentre";');
    print("done {$rows}");
  }
}
