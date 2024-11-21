// ignore_for_file: unused_local_variable, avoid_print

import 'package:bagraty_app/Bagraty/AjoutVache.dart';
import 'package:bagraty_app/Bagraty/first_page.dart';
import 'package:bagraty_app/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class Apports extends StatefulWidget {
  const Apports({super.key, this.id_v});
  final String? id_v;
  @override
  _ApportsState createState() => _ApportsState();
}

class _ApportsState extends State<Apports> {
  List<dynamic> uflList = [];
  List<dynamic> msList = [];
  List<dynamic> pdieList = [];
  List<dynamic> pdinList = [];
  List<dynamic> stList = [];
  List<dynamic> ciList = [];
  List<dynamic> ndfList = [];
  double _apport = 0.0;
  double _apportms = 0.0;
  double _apportst = 0.0;
  double _apportpdie = 0.0;
  double _apportpdin = 0.0;
  double ci = 0.0;
  double btufl = 0.0;
  double _apportndf = 0.0;

  double btpdi = 0.0;
  double restufl = 0.0;
  double restpdin = 0.0;
  double restpdie = 0.0;
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateUFLTotal();
    _calculateMSTotal();
    _calculatePDIETotal();
    _calculatePDINTotal();
    _calculateCIforComparaison();
    _getResteUFL();
    _getRestePDIE();
    _getRestePDIN();
    _calclNDFTotal();
    _calculateTotalSommeTow();
  }

  Future<double> _calculateTotalSommeTow() async {
    stList = await SQLHelper().calculateTotalSommeTow();
    double apportst = 0.0;
    double totalst = 0.0;

    for (var nourriture in stList) {
      totalst += nourriture['ms_n'];

      apportst = (totalst / 100) * (nourriture['quantite']);
    }

    setState(() {
      _apportst = apportst;
    });
    _apportst = apportst;
    return _apportst;
  }

  Future<double> _calclNDFTotal() async {
    ndfList = await SQLHelper().calculateNDFTotal();
    double apportndf = 0.0;
    double totalndf = 0.0;
    print("ndfList$ndfList");
    for (var nourriture in ndfList) {
      totalndf += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['ndf_n'];

      apportndf = totalndf;
    }

    setState(() {
      _apportndf = apportndf;
    });

    return _apportndf;
  }

  Future<double> _calculateCIforComparaison() async {
    ci = await SQLHelper().calcCITotal(id: widget.id_v);

    return ci;
  }

  Future<void> _calculatePDINTotal() async {
    pdinList = await SQLHelper().calculatePDINTotal();
    double apportpdin = 0.0;
    double totalpdin = 0.0;
    for (var nourriture in pdieList) {
      totalpdin += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['pdin_n'];

      apportpdin = totalpdin;
    }

    setState(() {
      _apportpdin = apportpdin;
    });
  }

  Future<void> _calculatePDIETotal() async {
    pdieList = await SQLHelper().calculateUFLTotal();
    double apportpdie = 0.0;
    double totalpdie = 0.0;
    for (var nourriture in pdieList) {
      totalpdie += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['pdie_n'];

      apportpdie = totalpdie;
    }

    setState(() {
      _apportpdie = apportpdie;
    });
  }

  Future<double?> _calculateMSTotal() async {
    msList = await SQLHelper().calculateMSTotal();
    double apportms = 0.0;
    double totalms = 0.0;
    for (var nourriture in msList) {
      // totalms += nourriture['ms_n'];

      apportms += (nourriture['ms_n'] / 100) * (nourriture['quantite']);
    }
    print("appotsms$apportms");
    setState(() {
      _apportms = apportms;
    });
    return apportms;
  }

  Future<void> _calculateUFLTotal() async {
    uflList = await SQLHelper().calculateUFLTotal();
    double apport = 0.0;
    double total = 0.0;
    for (var nourriture in uflList) {
      apport += (nourriture['ms_n'] / 100) *
          (nourriture['quantite']) *
          nourriture['ufl_n'];
    }

    setState(() {
      _apport = apport;
    });
  }

  Future<double?> _getResteUFL() async {
    btufl = (await SQLHelper().besoinsTotauxComparaisonUFL(id: widget.id_v))!;
    restufl = _apport - btufl;
    setState(() {
      restufl = restufl;
    });
    return null;
  }

  Future<double?> _getRestePDIE() async {
    btpdi = (await SQLHelper().besoinsTotauxComparaisonPDI(id: widget.id_v))!;

    restpdie = _apportpdie - btpdi;

    setState(() {
      restpdie = restpdie;
    });
    return null;
  }

  Future<double?> _getRestePDIN() async {
    btpdi = (await SQLHelper().besoinsTotauxComparaisonPDI(id: widget.id_v))!;
    restpdin = _apportpdin - btpdi;

    setState(() {
      restpdin = restpdin;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.5, 1.0],
              colors: [
                Color(0XFF035B6F),
                Color.fromARGB(255, 193, 192, 192),
                Color(0XFF708908),
              ],
            )),
            child: Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text("Les apports ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 15,
                ),
                DataTable(
                    columnSpacing: 20,
                    horizontalMargin: 10.0,
                    headingRowColor:
                        const WidgetStatePropertyAll(Color(0XFF035B6F)),
                    dataRowColor: const WidgetStatePropertyAll(Colors.white),
                    columns: const [
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            "Apports",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            "MS",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            "UFL",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            "PDIE",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            "PDIN",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                    ],
                    rows: [
                      DataRow(cells: [
                        const DataCell(Text('Total',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(_apportms.toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text(_apport.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text(_apportpdie.toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(_apportpdin.toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Reste PL',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        const DataCell(Text(('//'),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text((restufl.toStringAsFixed(2)),
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text(restpdie.toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(restpdin.toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Lait',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        const DataCell(Text(('//'),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text((restufl / 0.45).toStringAsFixed(2),
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text((restpdie / 48).toStringAsFixed(2),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(
                            (restpdin / 48).toStringAsFixed(2).toString(),
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                      ])
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text("Alerts ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        if (_apportms < ci)
                          const Text(
                              "« Alerte : La capacité d’ingestion de votre vache n’est pas saturée. Augmentez la quantité des fourrages distribuées»",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if (_apportms > ci)
                          const Text(
                              "« Alerte : La capacité d’ingestion de votre vache est sursaturée . Diminuer la quantité des fourrages distribuées. »",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        /*   if (_apportst <= (_apportms / 2))
                          const Text(
                              "« Alerte : Attention vous comptez distribuer plus de 50 % de concentré dans votre ration .Diminuez la quantité de concentré distribuée. »",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)), */
                        const SizedBox(
                          height: 10,
                        ),
                        if (_apportst > (_apportms / 2))
                          Text(
                              "« Alerte : Attention vous comptez distribuer plus de 50 % de concentré dans votre ration .Diminuez la quantité de concentré distribuée. »",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        if ((restufl / 0.45) == (restpdin / 48))
                          const Text(
                              "« Equilibrée : Pas besoin de correcteur. »",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if ((restufl / 0.45) > (restpdin / 48))
                          Text(
                              "« Déséquilibrée : Il faut combler un déficit de ${((restufl / 0.45) - (restpdin / 48)).toStringAsFixed(2)} Kg entre les UFL et les PDIN ==> Sélectionnez un correcteur azoté . »",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if ((restufl / 0.45) < (restpdin / 48))
                          Text(
                              "« Déséquilibrée : Il faut combler un déficit de ${((restpdin / 48) - (restufl / 0.45)).toStringAsFixed(2)}  Kg entre les UFL et les PDIN ==> Sélectionnez un correcteur énergitique . »",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: const Color(0xff708907),
                            minWidth: 2,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () {
                              _showAlertAcidose(context);
                            },
                            child: const Text(
                              "Risque d'acidose",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xffffffff),
                              ),
                            )),
                      ],
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: const Color(0xff708907),
                        minWidth: 2,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FirstPage()));
                        },
                        child: const Text(
                          "Déconnexion",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xffffffff),
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: const Color(0xff708907),
                        minWidth: 2,
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Ajoutvache()));
                        },
                        child: const Text(
                          "Autre Vache",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xffffffff),
                          ),
                        )),
                  ],
                ),
                /*    const SizedBox(
                  height: 15,
                ), */
              ],
            ))),
      ),
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Apports & Alerts',
          style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF035B6F),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showAlertAcidose(BuildContext context) {
    // Calculez la condition avant de passer à la construction du widget
    String message;
    if (_apportndf >= (35 / 100 * _apportms * 1000)) {
      message = "Pas de risque d'acidose";
    } else {
      message = "Risque fort d'acidose";
    }

    // Affichez la boîte de dialogue
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Risque d'acidose"),
          content: Text(
            message,
            style: const TextStyle(
              color: Color.fromARGB(255, 128, 10, 1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Color(0xff708907),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
