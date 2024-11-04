// ignore_for_file: equal_keys_in_map, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, avoid_print
import 'dart:ffi';

import 'package:bagraty_project/Bagraty/ExpSession.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("PRAGMA foreign_keys = ON");
    print("PRAGMA foreign_keys = ON");
    await database.execute(
        """CREATE TABLE Exploitant(id_ex INTEGER PRIMARY KEY AUTOINCREMENT, 
nom_ex  TEXT NOT NULL ,
nbr_vache  INTEGER NOT NULL , 
gov_ex  TEXT NOT NULL , 
tel_ex INTEGER NOT NULL 
)
      """);
    await database.execute("""CREATE TABLE Vache(
id_v INTEGER  PRIMARY KEY AUTOINCREMENT, 
parite TEXT,
id_m  NOT NULL , 
id_p  NOT NULL , 
poid REAL NOT NULL, 
age INTEGER NOT NULL , 
prod_lait INTEGER  , 
mois_g INTEGER NOT NULL,
temperature INTEGER,
humidite REAL ,
ci_v  REAL ,
thi_v REAL ,
date DATE,
id_ex INTEGER NOT NULL,
id_n INTEGER NOT NULL,
FOREIGN KEY(id_ex) REFERENCES Exploitant(id_ex) ,
FOREIGN KEY(id_n) REFERENCES Nourriture(id_n)              
)
      """);
    await database.execute("""CREATE TABLE Nourriture(
id_n  INTEGER  PRIMARY KEY AUTOINCREMENT, 
motif_n TEXT NOT NULL, 
nom_n TEXT NOT NULL, 
ms_n REAL NOT NULL ,
ufl_n REAL NOT NULL,
pdin_n INTEGER NOT NULL , 
pdie_n INTEGER NOT NULL , 
ndf_n INTEGER NOT NULL,
quantite INTEGER )
      """);
    print("tables created");
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'DB_Bagraty_db.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future insertVacheData(
      {required int id_m,
      required int id_p,
      required int poid,
      required int age,
      required int mois_g,
      required int prod_lait,
      required int temperature,
      required double humidite,
      required String date,
      required int id_ex,
      required int id_n,
      required int id_v}) async {
    final db = await SQLHelper.db();
    await db.insert(
      "Vache",
      {
        "id_v": id_v,
        "id_m": id_m,
        "id_p": id_p,
        "poid": poid,
        "age": age,
        "mois_g": mois_g,
        "prod_lait": prod_lait,
        "temperature": temperature,
        "humidite": humidite,
        "date": date,
        'id_ex': id_ex,
        'id_n': id_n,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print("${id_m} vache added successfully");
    return "added";
  }

  // Create new item (journal)
  static Future<int> createConcentreItem({
    required String motif_n,
    required String nom_n,
    required double ms_n,
    required double ufl_n,
    required int pdin_n,
    required int pdie_n,
    required int ndf_n,
    required int quantite,
  }) async {
    final db = await SQLHelper.db();

    final data = {
      'motif_n': motif_n,
      'nom_n': nom_n,
      'ms_n': ms_n,
      'ufl_n': ufl_n,
      'pdin_n': pdin_n,
      'pdie_n': pdie_n,
      'ndf_n': ndf_n,
      'quantite': quantite,
    };
    final id = await db.insert('Nourriture', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createItem({
    required String motif_n,
    required String nom_n,
    required double ms_n,
    required double ufl_n,
    required int pdin_n,
    required int pdie_n,
    required int ndf_n,
    required int quantite,
    required int id_n,
  }) async {
    final db = await SQLHelper.db();

    final data = {
      'motif_n': motif_n,
      'nom_n': nom_n,
      'ms_n': ms_n,
      'ufl_n': ufl_n,
      'pdin_n': pdin_n,
      'pdie_n': pdie_n,
      'ndf_n': ndf_n,
      'quantite': quantite,
    };
    final id = await db.insert('Nourriture', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createFourrageItem({
    required String motif_n,
    required String nom_n,
    required double ms_n,
    required double ufl_n,
    required int pdin_n,
    required int pdie_n,
    required int ndf_n,
    required int quantite,
  }) async {
    final db = await SQLHelper.db();

    final data = {
      'motif_n': motif_n,
      'nom_n': nom_n,
      'ms_n': ms_n,
      'ufl_n': ufl_n,
      'pdin_n': pdin_n,
      'pdie_n': pdie_n,
      'ndf_n': ndf_n,
      'quantite': quantite,
    };
    final id = await db.insert('Nourriture', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getConcentresItems() async {
    final db = await SQLHelper.db();
    return db.query('Nourriture',
        where: "motif_n = 'concentre'", orderBy: "nom_n");
  }

  static Future<List<Map<String, dynamic>>> getFourragesItems() async {
    final db = await SQLHelper.db();
    return db.query('Nourriture',
        where: "motif_n = 'fourrage'", orderBy: "nom_n");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it

  // Update an item by id
  static Future<int> updateItem(int id_n, int quantite) async {
    final db = await SQLHelper.db();

    final data = {
      'id_n': id_n,
      'quantite': quantite,
    };

    final result = await db
        .update('Nourriture', data, where: "id_n = ?", whereArgs: [id_n]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("Nourriture", where: "id_n = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Delete all items
  static Future<void> deleteAllItems() async {
    final db = await SQLHelper.db();
    try {
      await db.delete("Nourriture");
    } catch (err) {
      debugPrint("Something went wrong when deleting all items: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('Nourriture', where: "id_n = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getVache({required int id}) async {
    final db = await SQLHelper.db();
    return db.query('Vache', where: "id_v = ?", whereArgs: [id], limit: 1);
  }

  Future insertExploitantData({nom_ex, nbr_vache, gov_ex, tel_ex}) async {
    final db = await SQLHelper.db();
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

  Future seConnecter({required int tel}) async {
    final db = await SQLHelper.db();
    await db.rawQuery('SELECT * FROM Exploitant WHERE tel_ex=$tel ');

    return print({tel});
  }

  Future<int?> getCurrentExpId() async {
    return ExpSession.currentExpId;
  }

  Future<void> setCurrentExp(int expId) async {
    ExpSession.currentExpId = expId; // Stocke l'ID de l'utilisateur actif
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('Nourriture', orderBy: "id_n");
  }

  Future getUFLSomme() async {
    final db = await SQLHelper.db();
    return db.queryCursor('SELECT SUM(ufl_n) FROM Nourriture ',
        where: "quantite  =0");
  }

  Future<List> calculateUFLTotal() async {
    final db = await SQLHelper.db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");
    print('reS$result');
    return result.toList();
  }

  double _totalufl = 0.0;
  List uflList = [];

  Future<double?> _calcUFLTotal() async {
    uflList = await SQLHelper().calculateUFLTotal();

    for (var nourriture in uflList) {
      _totalufl = (_totalufl + nourriture['ufl_n']);
    }
    print('here$_totalufl');
    return _totalufl!;
  }

  Future<List> calculateMSTotal() async {
    final db = await SQLHelper.db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");
    print('reS$result');
    return result.toList();
  }

  Future<List> calculateTotalSommeTow() async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery(
        "SELECT * FROM Nourriture WHERE quantite !=0 AND motif_n='concentre'");
    print('reS$result');
    return result.toList();
  }

  Future<List> calculatePDIETotal() async {
    final db = await SQLHelper.db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");
    print('reS$result');
    return result.toList();
  }

  double _totalpdie = 0.0;
  List PDIEList = [];

  Future<double?> _calcPDIETotal() async {
    PDIEList = await SQLHelper().calculatePDIETotal();

    for (var nourriture in PDIEList) {
      _totalpdie = (_totalpdie + nourriture['pdie_n']);
    }
    print('here$_totalpdie');
    return _totalpdie;
  }

  Future<List> calculatePDINTotal() async {
    final db = await SQLHelper.db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");
    print('reS$result');
    return result.toList();
  }

  double _totalpdin = 0.0;
  List PDINList = [];

  Future<double?> _calcPDINTotal() async {
    PDINList = await SQLHelper().calculatePDINTotal();

    for (var nourriture in PDINList) {
      _totalpdin = (_totalpdin + nourriture['pdin_n']);
    }
    print('here$_totalpdin');
    return _totalpdin;
  }

  static Future<int> updateVache(
      {required int id_v, double? ci_v, double? thi_v}) async {
    final db = await SQLHelper.db();

    final data = {
      'id_v': id_v,
      'thi_v': thi_v,
      'ci_v': ci_v,
    };

    final result =
        await db.update('Vache', data, where: "id_v = ?", whereArgs: [id_v]);
    return result;
  }

  static Future<List<Map<String, dynamic>>> calculateCI(
      {required int? id}) async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =$id");

    return result;
  }

  double _ci = 0.0;
  List item = [];
  Future<double?> calcCITotal({int? id}) async {
    item = await SQLHelper.calculateCI(id: id);

    for (var vache in item) {
      _ci = (0.025 * vache['poid']) + (0.15 * vache['prod_lait']);
    }
    print('ci  ===>$_ci');
    return _ci;
  }

  static Future<List<Map<String, dynamic>>> calculateTHI(
      {required int? id}) async {
    final db = await SQLHelper.db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =$id");

    return result;
  }

  double _thi = 0.0;
  List itemTHI = [];

  Future<double?> calcTHITotal({int? id}) async {
    itemTHI = await SQLHelper.calculateTHI(id: id);

    for (var vache in itemTHI) {
      _thi = (0.8 * vache['temperature']) +
          ((vache['humidite'] / 100) * (vache['temperature'] - 14.4)) +
          46.4;
      print('herethi=============================================>$_thi');
      print(id);
    }
    print('herethi===>$_thi');
    return _thi;
  }
}

// ignore: non_constant_identifier_names
class MyTableWidget extends StatelessWidget {
  int? id_n;

  MyTableWidget({
    super.key,
    required this.id_n,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SQLHelper.getItem(id_n!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Map<String, dynamic>> data =
              snapshot.data as List<Map<String, dynamic>>;
          return DataTable(
            columnSpacing: 30,
            horizontalMargin: 20.0,
            headingRowColor: const WidgetStatePropertyAll(Color(0XFF035B6F)),
            dataRowColor: const WidgetStatePropertyAll(Colors.white),
            columns: [
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Text(
                    "Qantité",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                    textAlign: TextAlign.end,
                  )),
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Text(
                    "UFL",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                    textAlign: TextAlign.end,
                  )),
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Text(
                    "PDIE",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                    textAlign: TextAlign.end,
                  )),
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Text(
                    "PDIN",
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                    textAlign: TextAlign.end,
                  )),
            ],
            rows: data
                .map((e) => DataRow(cells: [
                      DataCell(Text(e["quantite"].toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["ufl_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["pdie_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["pdin_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                    ]))
                .toList(),
          );
        }
      },
    );
  }
}
