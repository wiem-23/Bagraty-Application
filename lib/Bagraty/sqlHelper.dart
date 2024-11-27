// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:path/path.dart';
//import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  Future<Database> db() async {
    return await openDatabase(
        // join method is used to join the path of the database with the path of the app's document directory.
        join(await getDatabasesPath(), 'Bagraty_Bd_Bd_Bd.db'),
        // The version of the database. This is used to manage database schema changes.
        version: 1,
        // onCreate is a callback function that is called ONLY when the database is created for the first time.
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }

  Future<void> createTables(Database database) async {
    await database.execute("PRAGMA foreign_keys = ON");

    await database.execute(
        """CREATE TABLE Exploitant(id_ex INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
nom_ex  TEXT NOT NULL ,
nbr_vache  INTEGER NOT NULL , 
gov_ex  TEXT NOT NULL , 
tel_ex INTEGER NOT NULL,
mdp TEXT
)
      """);

    await database.execute("""CREATE TABLE Vache(
id_v TEXT  PRIMARY KEY , 
parite TEXT,
id_m TEXT NOT NULL , 
id_p  TEXT NOT NULL , 
poid REAL NOT NULL, 
age INTEGER , 
prod_lait INTEGER  , 
mois_g INTEGER NOT NULL,
temperature INTEGER,
humidite REAL ,
ci_v  REAL ,
thi_v REAL ,
date TEXT,
id_ex INTEGER NOT NULL,
id_n INTEGER NOT NULL,
FOREIGN KEY(id_ex) REFERENCES Exploitant(id_ex)             
)
      """);
    await database.execute("""CREATE TABLE Nourriture(
id_n  INTEGER  PRIMARY KEY AUTOINCREMENT, 
motif_n TEXT NOT NULL, 
nom_n TEXT , 
nom_ar TEXT , 
ms_n REAL NOT NULL ,
ufl_n REAL NOT NULL,
pdin_n REAL NOT NULL , 
pdie_n REAL NOT NULL , 
ndf_n REAL NOT NULL,
quantite REAL  
)
      """);
    List<Map<String, dynamic>> defaultData = [
      {
        'id_n': 1,
        'motif_n': "concentré",
        'nom_ar': 'مخلفات اللفت السكري',
        'nom_n': "Pulpe de Betterave",
        'ms_n': 28,
        'ufl_n': 1.01,
        'pdin_n': 60,
        'pdie_n': 84,
        'ndf_n': 200,
        'quantite': 0
      },
      {
        'id_n': 2,
        'motif_n': "concentré",
        'nom_n': "Orge grain",
        'nom_ar': 'شعير',
        'ms_n': 86.7,
        'ufl_n': 1.09,
        'pdin_n': 79,
        'pdie_n': 101,
        'ndf_n': 110,
        'quantite': 0
      },
      {
        'id_n': 3,
        'motif_n': "concentré",
        'nom_n': "Soja grain",
        'nom_ar': 'صوجا',
        'ms_n': 90,
        'ufl_n': 1.3,
        'pdin_n': 180,
        'pdie_n': 160,
        'ndf_n': 200,
        'quantite': 0
      },
      {
        'id_n': 4,
        'motif_n': "concentré",
        'nom_n': "Grignons d’Olive",
        'nom_ar': 'فيتورة الزيتون',
        'ms_n': 90,
        'ufl_n': 0.85,
        'pdin_n': 85,
        'pdie_n': 70,
        'ndf_n': 300,
        'quantite': 0
      },
      {
        "id_n": 5,
        'motif_n': "concentré",
        "nom_n": "Maïs grain",
        'nom_ar': 'ذرة',
        "ms_n": 86,
        "ufl_n": 1.1,
        "pdin_n": 80,
        "pdie_n": 95,
        "ndf_n": 130,
        "quantite": 0
      },
      {
        "id_n": 7,
        'nom_ar': 'قرط قصيبة',
        "motif_n": "fourrage",
        "nom_n": "Foin d’avoine",
        "ms_n": 86.8,
        "ufl_n": 0.65,
        "pdin_n": 50,
        "pdie_n": 65,
        "ndf_n": 520,
        "quantite": 0
      },
      {
        "id_n": 8,
        'nom_ar': '  تبن الشعير ',
        "motif_n": "fourrage",
        "nom_n": "Paille d'Orge",
        "ms_n": 88,
        "ufl_n": 0.44,
        "pdin_n": 46,
        "pdie_n": 24,
        "ndf_n": 780,
        "quantite": 0
      },
      {
        'nom_ar': ' سيلاج الذرة  ',
        "id_n": 9,
        "motif_n": "fourrage",
        "nom_n": "Ensilage Maïs Faible Valeur",
        "ms_n": 35,
        "ufl_n": 0.85,
        "pdin_n": 67,
        "pdie_n": 42,
        "ndf_n": 495,
        "quantite": 0
      },
      {
        "id_n": 11,
        "motif_n": "fourrage",
        "nom_n": "Foin de luzerne",
        'nom_ar': 'قرط الفصة ',
        "ms_n": 87.5,
        "ufl_n": 0.67,
        "pdin_n": 130,
        "pdie_n": 90,
        "ndf_n": 425,
        "quantite": 0
      },
      {
        "id_n": 12,
        "nom_ar": ' سلة سوسة ',
        "motif_n": "fourrage",
        "nom_n": "Sulla en vert",
        "ms_n": 18,
        "ufl_n": 0.88,
        "pdin_n": 108,
        "pdie_n": 98,
        "ndf_n": 300,
        "quantite": 0
      },
      {
        "id_n": 14,
        "nom_ar": ' قرط المنجور ',
        "motif_n": "fourrage",
        "nom_n": "Foin de rye grass",
        "ms_n": 68.8,
        "ufl_n": 0.58,
        "pdin_n": 48,
        "pdie_n": 61,
        "ndf_n": 600,
        "quantite": 0
      },
      {
        "id_n": 15,
        "motif_n": "fourrage",
        "nom_ar": 'ضلف الهندي ',
        "nom_n": "Raquette de cactus âgée",
        "ms_n": 11.5,
        "ufl_n": 0.44,
        "pdin_n": 39,
        "pdie_n": 16,
        "ndf_n": 385,
        "quantite": 0
      },
      {
        "id_n": 16,
        "motif_n": "fourrage",
        "nom_ar": 'أوراق وأغصان الزيتون',
        "nom_n": "Feuilles et rameaux d’olivier",
        "ms_n": 20,
        "ufl_n": 0.55,
        "pdin_n": 45,
        "pdie_n": 50,
        "ndf_n": 350,
        "quantite": 0
      },
      {
        "id_n": 17,
        "nom_ar": 'أزولا',
        "motif_n": "fourrage",
        "nom_n": "Azolla",
        "ms_n": 17.5,
        "ufl_n": 1,
        "pdin_n": 145,
        "pdie_n": 90,
        "ndf_n": 275,
        "quantite": 0
      },
      {
        "id_n": 18,
        "motif_n": "concentré",
        "nom_ar": 'علف مركب رقم 7',
        "nom_n": "Concentré N7 ACN",
        "ms_n": 88,
        "ufl_n": 0.75,
        "pdin_n": 130,
        "pdie_n": 90,
        "ndf_n": 425,
        "quantite": 0
      },
    ];
    for (var item in defaultData) {
      await database.insert('Nourriture', item);
    }
  }

// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  Future insertVacheData(
      {required String? parite,
      required String id_m,
      required String id_p,
      required int poid,
      required int age,
      required int mois_g,
      required int prod_lait,
      required int temperature,
      required double humidite,
      required String date,
      required int id_ex,
      required int id_n,
      required String id_v}) async {
    final db = await SQLHelper().db();
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
        'parite': parite,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return "lait $prod_lait";
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
    final db = await SQLHelper().db();

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
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createItemAR({
    int? id_n,
    required String motif_n,
    required String nom_ar,
    required double ms_n,
    required double ufl_n,
    required int pdin_n,
    required int pdie_n,
    required int ndf_n,
    required int quantite,
  }) async {
    final db = await SQLHelper().db();

    final data = {
      'id_n': id_n,
      'motif_n': motif_n,
      'nom_ar': nom_ar,
      'ms_n': ms_n,
      'ufl_n': ufl_n,
      'pdin_n': pdin_n,
      'pdie_n': pdie_n,
      'ndf_n': ndf_n,
      'quantite': quantite,
    };
    final id = await db.insert('Nourriture', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createItem({
    int? id_n,
    required String motif_n,
    required String nom_n,
    required double ms_n,
    required double ufl_n,
    required int pdin_n,
    required int pdie_n,
    required int ndf_n,
    required int quantite,
  }) async {
    final db = await SQLHelper().db();

    final data = {
      'id_n': id_n,
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
        conflictAlgorithm: ConflictAlgorithm.replace);
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
    required double quantite,
  }) async {
    final db = await SQLHelper().db();

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
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getConcentresItems() async {
    final db = await SQLHelper().db();
    return db.query('Nourriture',
        where: "motif_n = 'concentre'", orderBy: "nom_n");
  }

  static Future<List<Map<String, dynamic>>> getFourragesItems() async {
    final db = await SQLHelper().db();
    return db.query('Nourriture',
        where: "motif_n = 'fourrage'", orderBy: "nom_n");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it

  // Update an item by id
  static Future<int> updateItem(int id_n, double quantite) async {
    final db = await SQLHelper().db();

    final data = {
      'id_n': id_n,
      'quantite': quantite,
    };

    final result = await db
        .update('Nourriture', data, where: "id_n = ?", whereArgs: [id_n]);
    return result;
  }

  static Future<int> reloadItem(int id_n, double quantite) async {
    final db = await SQLHelper().db();

    final data = {
      'id_n': id_n,
      'quantite': 0,
    };

    final result = await db
        .update('Nourriture', data, where: "id_n = ?", whereArgs: [id_n]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper().db();
    try {
      await db.delete("Nourriture", where: "id_n = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Delete all items
  static Future<void> deleteAllItems() async {
    final db = await SQLHelper().db();
    try {
      await db.delete("Nourriture");
    } catch (err) {
      debugPrint("Something went wrong when deleting all items: $err");
    }
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper().db();
    return db.query('Nourriture', where: "id_n = ?", whereArgs: [id], limit: 1);
  }

  static Future<List<Map<String, dynamic>>> getVache(
      {required String id}) async {
    final db = await SQLHelper().db();
    return db.query('Vache', where: "id_v = ?", whereArgs: [id], limit: 1);
  }

  Future insertExploitantData(
      {required nom_ex,
      required nbr_vache,
      required gov_ex,
      required tel_ex,
      required mdp}) async {
    final db = await SQLHelper().db();
    await db.insert("Exploitant", {
      "nom_ex": nom_ex,
      "nbr_vache": nbr_vache,
      "gov_ex": gov_ex,
      "tel_ex": tel_ex,
      "mdp": mdp
    });

    return "added";
  }

  int? id;
  Future seConnecter({required int tel, required String mdp}) async {
    final db = await SQLHelper().db();
    List result = await db.rawQuery(
        "SELECT * FROM Exploitant WHERE tel_ex='$tel' AND mdp='$mdp' ");

    for (var exp in result.toList()) {
      id = exp['id_ex'];
    }

    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper().db();
    return db.query('Nourriture', orderBy: "motif_n");
  }

  static Future<List<Map<String, dynamic>>> getAllExp() async {
    final db = await SQLHelper().db();
    return db.query('Exploitant', orderBy: "id_ex");
  }

  static Future<List<Map<String, dynamic>>> getAllVaches() async {
    final db = await SQLHelper().db();
    return db.query('Vache', orderBy: "id_v");
  }

  Future getUFLSomme() async {
    final db = await SQLHelper().db();
    return db.queryCursor('SELECT SUM(ufl_n) FROM Nourriture ',
        where: "quantite  =0");
  }

  Future<List> calculateUFLTotal() async {
    final db = await SQLHelper().db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");

    return result.toList();
  }

  double _totalufl = 0.0;
  List uflList = [];

  Future<double?> _calcUFLTotal() async {
    uflList = await SQLHelper().calculateUFLTotal();

    for (var nourriture in uflList) {
      _totalufl = (_totalufl + nourriture['ufl_n']);
    }

    return _totalufl;
  }

  Future<List> calculateNDFTotal() async {
    final db = await SQLHelper().db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");

    return result.toList();
  }

  double _totalndf = 0.0;
  List ndfList = [];

  Future<double?> _calcNDFTotal() async {
    uflList = await SQLHelper().calculateNDFTotal();

    for (var nourriture in ndfList) {
      _totalndf = (_totalndf +
          nourriture['ndf_n'] *
              nourriture['quantite'] *
              (nourriture['ms_n'] / 100));
    }

    return _totalndf;
  }

  Future<List> calculateMSTotal() async {
    final db = await SQLHelper().db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");

    return result.toList();
  }

  Future<List> calculateTotalSommeTow() async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery(
        "SELECT * FROM Nourriture WHERE quantite !=0 AND motif_n='concentré'");

    return result.toList();
  }

  Future<List> calculatePDIETotal() async {
    final db = await SQLHelper().db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");

    return result.toList();
  }

  double _totalpdie = 0.0;
  List PDIEList = [];

  Future<double?> _calcPDIETotal() async {
    PDIEList = await SQLHelper().calculatePDIETotal();

    for (var nourriture in PDIEList) {
      _totalpdie = (_totalpdie + nourriture['pdie_n']);
    }

    return _totalpdie;
  }

  Future<List> calculatePDINTotal() async {
    final db = await SQLHelper().db();
    var result =
        await db.rawQuery("SELECT * FROM Nourriture WHERE quantite !=0");

    return result.toList();
  }

  double _totalpdin = 0.0;
  List PDINList = [];

  Future<double?> _calcPDINTotal() async {
    PDINList = await SQLHelper().calculatePDINTotal();

    for (var nourriture in PDINList) {
      _totalpdin = (_totalpdin + nourriture['pdin_n']);
    }

    return _totalpdin;
  }

  static Future<int> updateVache(
      {required String id_v, double? ci_v, double? thi_v}) async {
    final db = await SQLHelper().db();

    final data = {
      'id_v': id_v,
      'thi_v': thi_v,
      'ci_v': ci_v,
    };

    final result =
        await db.update('Vache', data, where: "id_v = ?", whereArgs: [id_v]);
    return result;
  }

  static Future<List<Map<String, dynamic>>> calculateTHI(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _thi = 0.0;
  List itemTHI = [];

  Future<double?> calcTHITotal({String? id}) async {
    itemTHI = await SQLHelper.calculateTHI(id: id);

    for (var vache in itemTHI) {
      _thi = (0.8 * vache['temperature']) +
          ((vache['humidite'] / 100) * (vache['temperature'] - 14.4)) +
          46.4;
    }

    return _thi;
  }

  static Future<List<Map<String, dynamic>>> calculateCI(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _ciReduit = 0.0;
  double _ci = 0.0;
  List item = [];
  int thiSeuil = 68;
  double? thiR = 0.0;
  Future<double> calcCITotal({String? id}) async {
    item = await SQLHelper.calculateCI(id: id);
    thiR = await SQLHelper().calcTHITotal(id: id);

    for (var vache in item) {
      // _ci = (0.025 * vache['poid']) + (0.15 * vache['prod_lait']);
      if (vache['parite'] == 'Tarie' && thiR! < 68) {
        _ci = 1.4 * ((vache['poid'] / 100) + 2) - 1.5;
      } else if (vache['parite'] == 'Primipare' && thiR! < 68 ||
          vache['parite'] == 'Multipare' && thiR! < 68) {
        _ci = 1.4 * ((vache['poid'] / 100) + 2) + (0.3 * vache['prod_lait']);
      } else if (thiR! > 68 && vache['parite'] == 'Tarie') {
        _ciReduit = (thiR! - thiSeuil) * 0.45;
        _ci = (1.4 * ((vache['poid'] / 100) + 2) - 1.5) - _ciReduit;
      } else if (thiR! > 68 &&
          (vache['parite'] == 'Primipare' || vache['parite'] == 'Multipare')) {
        _ciReduit = (thiR! - thiSeuil) * 0.45;
        _ci = (1.4 * ((vache['poid'] / 100) + 2) + (0.3 * vache['prod_lait'])) -
            _ciReduit;
      } else if (vache['parite'] == 'غارزة' && thiR! < 68) {
        _ci = 1.4 * ((vache['poid'] / 100) + 2) - 1.5;
      } else if (vache['parite'] == 'أول ولادة' && thiR! < 68 ||
          vache['parite'] == 'ثاني ولادة أو أكثر' && thiR! < 68) {
        _ci = 1.4 * ((vache['poid'] / 100) + 2) + (0.3 * vache['prod_lait']);
      } else if (thiR! > 68 && vache['parite'] == 'غارزة') {
        _ciReduit = (thiR! - thiSeuil) * 0.45;
        _ci = (1.4 * ((vache['poid'] / 100) + 2) - 1.5) - _ciReduit;
      } else if (thiR! > 68 &&
          (vache['parite'] == 'أول ولادة' ||
              vache['parite'] == 'ثاني ولادة أو أكثر')) {
        _ciReduit = (thiR! - thiSeuil) * 0.45;
        _ci = (1.4 * ((vache['poid'] / 100) + 2) + (0.3 * vache['prod_lait'])) -
            _ciReduit;
      }
    }

    return _ci;
  }

  static Future<List<Map<String, dynamic>>> calculateUFLBE(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _BE = 0.0;
  List itemBE = [];

  Future<double> besoinsEntretienUFL({String? id}) async {
    itemBE = await SQLHelper.calculateUFLBE(id: id);

    for (var vache in itemBE) {
      _BE = 1.4 + 0.6 * (vache['poid'] / 100);
    }

    return _BE;
  }

  static Future<List<Map<String, dynamic>>> calculateUFLBC(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _BC = 0.0;
  List itemBC = [];

  Future<double> besoinsCroissanceUFL({String? id}) async {
    itemBC = await SQLHelper.calculateUFLBC(id: id);

    for (var vache in itemBC) {
      if (vache['age'] >= 24 && vache['age'] <= 28) {
        _BC = 2.0;
      } else if (vache['age'] >= 32 && vache['age'] <= 36) {
        _BC = 1.3;
      } else
        _BC = 0.0;
    }

    return _BC;
  }

  static Future<List<Map<String, dynamic>>> calculateUFLBG(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _BG = 0.0;
  List itemBG = [];

  Future<double> besoinsGestationUFL({String? id}) async {
    itemBG = await SQLHelper.calculateUFLBG(id: id);

    for (var vache in itemBG) {
      if (vache['mois_g'] == 7) {
        _BG = 0.9;
      } else if (vache['mois_g'] == 8) {
        _BG = 1.6;
      } else if (vache['mois_g'] == 9) {
        _BG = 2.6;
      } else
        _BG = 0.0;
    }

    return _BG;
  }

  static Future<List<Map<String, dynamic>>> calculateUFLBL(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _BL = 0.0;
  List itemBL = [];

  Future<double> besoinsLactationUFL({String? id}) async {
    itemBL = await SQLHelper.calculateUFLBL(id: id);

    for (var vache in itemBL) {
      _BL = vache['prod_lait'] * 0.44;
    }

    return _BL;
  }

  double besoinsG = 0.0;
  double besoinsC = 0.0;
  double besoinsE = 0.0;
  double besoinsT = 0.0;
  double besoinsL = 0.0;
  Future<double?> besoinsTotauxUFL({String? id}) async {
    besoinsG = await SQLHelper().besoinsGestationUFL(id: id);
    besoinsC = await SQLHelper().besoinsCroissanceUFL(id: id);
    besoinsE = await SQLHelper().besoinsEntretienUFL(id: id);
    besoinsL = await SQLHelper().besoinsLactationUFL(id: id);
    besoinsT = besoinsG + besoinsC + besoinsE + besoinsL;

    return besoinsT;
  }

  static Future<List<Map<String, dynamic>>> calculatePDIBE(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  double _BEPDI = 0.0;
  List itemBEPDI = [];

  Future<double> besoinsEntretienPDI({String? id}) async {
    itemBEPDI = await SQLHelper.calculatePDIBE(id: id);

    for (var vache in itemBEPDI) {
      _BEPDI = 95 + (0.6 * vache['poid']);
    }

    return _BEPDI;
  }

  static Future<List<Map<String, dynamic>>> calculatePDIBC(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  int _BCPDI = 0;
  List itemBCPDI = [];

  Future<int> besoinsCroissancePDI({String? id}) async {
    itemBCPDI = await SQLHelper.calculatePDIBC(id: id);

    for (var vache in itemBCPDI) {
      if (vache['age'] >= 24 && vache['age'] <= 28) {
        _BCPDI = 240;
      } else if (vache['age'] >= 32 && vache['age'] <= 36) {
        _BCPDI = 140;
      } else
        _BCPDI = 0;
    }

    return _BCPDI;
  }

  static Future<List<Map<String, dynamic>>> calculatePDIBG(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  int _BGPDI = 0;
  List itemBGPDI = [];

  Future<int> besoinsGestationPDI({String? id}) async {
    itemBGPDI = await SQLHelper.calculatePDIBG(id: id);

    for (var vache in itemBGPDI) {
      if (vache['mois_g'] == 7) {
        _BGPDI = 75;
      } else if (vache['mois_g'] == 8) {
        _BGPDI = 135;
      } else if (vache['mois_g'] == 9) {
        _BGPDI = 205;
      } else
        _BGPDI = 0;
    }

    return _BGPDI;
  }

  static Future<List<Map<String, dynamic>>> calculatePDIBL(
      {required String? id}) async {
    final db = await SQLHelper().db();
    var result = await db.rawQuery("SELECT * FROM Vache WHERE id_v =?", [id]);

    return result;
  }

  int _BLPDI = 0;
  List itemBLPDI = [];

  Future<int> besoinsLactationPDI({String? id}) async {
    itemBLPDI = await SQLHelper.calculatePDIBL(id: id);

    for (var vache in itemBLPDI) {
      _BLPDI = vache['prod_lait'] * 50;
    }

    return _BLPDI;
  }

  int besoinsGPDI = 0;
  int besoinsCPDI = 0;
  int besoinsLPDI = 0;
  double besoinsEPDI = 0.0;
  double besoinsTPDI = 0.0;
  Future<double?> besoinsTotauxPDI({String? id}) async {
    besoinsGPDI = await SQLHelper().besoinsGestationPDI(id: id);
    besoinsCPDI = await SQLHelper().besoinsCroissancePDI(id: id);
    besoinsEPDI = await SQLHelper().besoinsEntretienPDI(id: id);
    besoinsLPDI = await SQLHelper().besoinsLactationPDI(id: id);
    besoinsTPDI = besoinsGPDI + besoinsCPDI + besoinsEPDI + besoinsLPDI;

    return besoinsTPDI;
  }

  Future<double?> besoinsTotauxComparaisonPDI({String? id}) async {
    besoinsGPDI = await SQLHelper().besoinsGestationPDI(id: id);
    besoinsCPDI = await SQLHelper().besoinsCroissancePDI(id: id);
    besoinsEPDI = await SQLHelper().besoinsEntretienPDI(id: id);

    besoinsTPDI = besoinsGPDI + besoinsCPDI + besoinsEPDI;

    return besoinsTPDI;
  }

  Future<double?> besoinsTotauxComparaisonUFL({String? id}) async {
    besoinsG = await SQLHelper().besoinsGestationUFL(id: id);
    besoinsC = await SQLHelper().besoinsCroissanceUFL(id: id);
    besoinsE = await SQLHelper().besoinsEntretienUFL(id: id);

    besoinsT = besoinsG + besoinsC + besoinsE;

    return besoinsT;
  }
}

class MyTableWidget extends StatelessWidget {
  int? id_n;

  MyTableWidget({
    super.key,
    required this.id_n,
  });
  double qte = 0;
  bool qteIsNull = false;
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
            columns: const [
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
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["ufl_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["pdie_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color(0XFF035B6F)))),
                      DataCell(Text(
                          (e["pdin_n"] * (e["quantite"] * e["ms_n"] / 100))
                              .toStringAsFixed(2)
                              .toString(),
                          style: const TextStyle(
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
