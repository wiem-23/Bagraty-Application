import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class Apports extends StatefulWidget {
  @override
  _ApportsState createState() => _ApportsState();
}

class _ApportsState extends State<Apports> {
  List<dynamic> uflList = [];
  List<dynamic> msList = [];
  List<dynamic> pdieList = [];
  List<dynamic> pdinList = [];
  List<dynamic> stList = [];
  double _apport = 0.0;
  double _apportms = 0.0;
  double _apportst = 0.0;
  double _apportpdie = 0.0;
  double _apportpdin = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateUFLTotal();
    _calculateMSTotal();
    _calculatePDIETotal();
    _calculatePDINTotal();
  }

  Future<void> _calculatePDINTotal() async {
    pdinList = await SQLHelper().calculatePDINTotal();
    double apportpdin = 0.0;
    double totalpdin = 0.0;
    pdieList.forEach((nourriture) {
      totalpdin += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['pdin_n'];

      apportpdin = totalpdin;
    });

    setState(() {
      _apportpdin = apportpdin;
    });

    print('Totalufl: $_apportpdin');
  }

  Future<void> _calculatePDIETotal() async {
    pdieList = await SQLHelper().calculateUFLTotal();
    double apportpdie = 0.0;
    double totalpdie = 0.0;
    pdieList.forEach((nourriture) {
      totalpdie += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['pdie_n'];
      print(nourriture['quantite'] * (nourriture['ms_n'] / 100));
      print('ufl  ${nourriture['pdie']}');
      print('tot  $totalpdie');
      apportpdie = totalpdie;
    });

    setState(() {
      _apportpdie = apportpdie;
    });

    print('Totalufl: $_apportpdie');
  }

  Future<void> _calculateTotalSommeTow() async {
    stList = await SQLHelper().calculateTotalSommeTow();
    double apportst = 0.0;
    double totalst = 0.0;
    stList.forEach((nourriture) {
      totalst += nourriture['ms_n'];

      apportst = (totalst / 100) * (nourriture['quantite']);
    });

    setState(() {
      _apportst = apportst;
    });

    print('Total: $_apportst');
  }

  Future<void> _calculateMSTotal() async {
    msList = await SQLHelper().calculateMSTotal();
    double apportms = 0.0;
    double totalms = 0.0;
    msList.forEach((nourriture) {
      totalms += nourriture['ms_n'];

      apportms = (totalms / 100) * (nourriture['quantite']);
    });

    setState(() {
      _apportms = apportms;
    });

    print('Total: $_apportms');
  }

  Future<void> _calculateUFLTotal() async {
    uflList = await SQLHelper().calculateUFLTotal();
    double apport = 0.0;
    double total = 0.0;
    uflList.forEach((nourriture) {
      total += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['ufl_n'];
      print(nourriture['quantite'] * (nourriture['ms_n'] / 100));
      print('ufl  ${nourriture['ufl_n']}');
      print('tot  $total');
      apport = total;
    });

    setState(() {
      _apport = apport;
    });

    print('Totalufl: $_apport');
  }

  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 30,
        horizontalMargin: 20.0,
        headingRowColor: const WidgetStatePropertyAll(Color(0XFF035B6F)),
        dataRowColor: const WidgetStatePropertyAll(Colors.white),
        columns: const [
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "App MS",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.end,
              )),
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "App UFL",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.end,
              )),
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "App PDIE",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.end,
              )),
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                "App PDIN",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                textAlign: TextAlign.end,
              )),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text((_apportms.toStringAsFixed(2)).toString(),
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: Color(0XFF035B6F)))),
            DataCell(
              Text(_apport.toStringAsFixed(2),
                  style: const TextStyle(
                      fontStyle: FontStyle.italic, color: Color(0XFF035B6F))),
            ),
            DataCell(Text(_apportpdie.toStringAsFixed(2).toString(),
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: Color(0XFF035B6F)))),
            DataCell(Text(_apportpdin.toStringAsFixed(2).toString(),
                style: const TextStyle(
                    fontStyle: FontStyle.italic, color: Color(0XFF035B6F)))),
          ])
        ]);
  }
}
 /*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total UFL: ${_apport.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ID',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Valeur UFL',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                ...uflList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var nourriture = entry.value;
                  double Ms = nourriture['ms_n'] ?? 0.0; // Si null, utilise 0.0
                  double uFL =
                      nourriture['ufl_n'] ?? 0.0; // Si null, utilise 0.0
                  int qT = nourriture['quantite'] ?? 0.0;
                  double produit = qT * uFL * Ms;
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((index + 1).toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(produit.toString()),
                    ),
                  ]);
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

    
    
    
    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total UFL: ${_apport.toStringAsFixed(2)}'),
            SizedBox(height: 20),
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ID',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Valeur UFL',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                ...uflList.asMap().entries.map((entry) {
                  int index = entry.key;
                  var nourriture = entry.value;
                  double Ms = nourriture['ms_n'] ?? 0.0; // Si null, utilise 0.0
                  double uFL =
                      nourriture['ufl_n'] ?? 0.0; // Si null, utilise 0.0
                  int qT = nourriture['quantite'] ?? 0.0;
                  double produit = qT * uFL * Ms;
                  return TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((index + 1).toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(produit.toString()),
                    ),
                  ]);
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  } */