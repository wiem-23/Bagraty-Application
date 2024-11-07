import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/material.dart';

class Apports extends StatefulWidget {
  const Apports({super.key, this.id_v});
  final int? id_v;
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
  double _ci = 0.0;
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
    _calculateNDFTotal();
  }

  Future<void> _calculateNDFTotal() async {
    pdieList = await SQLHelper().calculateNDFTotal();
    double apportndf = 0.0;
    double totalndf = 0.0;
    ndfList.forEach((nourriture) {
      totalndf += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['ndf_n'];

      apportndf = totalndf;
    });

    setState(() {
      _apportndf = apportndf;
    });
  }

  Future<void> _calculateCIforComparaison() async {
    var _ci = await SQLHelper().calcCITotal(id: widget.id_v);

    print('CIIIIIIIIII: $_ci');
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

      apportpdie = totalpdie;
    });

    setState(() {
      _apportpdie = apportpdie;
    });
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
  }

  Future<void> _calculateUFLTotal() async {
    uflList = await SQLHelper().calculateUFLTotal();
    double apport = 0.0;
    double total = 0.0;
    uflList.forEach((nourriture) {
      total += (nourriture['quantite'] * (nourriture['ms_n'] / 100)) *
          nourriture['ufl_n'];

      apport = total;
    });

    setState(() {
      _apport = apport;
    });

    print('Totalufl: $_apport');
  }

  Future<double?> _getResteUFL() async {
    btufl = (await SQLHelper().besoinsTotauxUFL(id: 1))!;
    restufl = _apport - btufl;
    return restufl;
  }

  Future<double?> _getRestePDIE() async {
    btpdi = (await SQLHelper().besoinsTotauxPDI(id: 1))!;

    restpdie = _apportpdie - btpdi;

    return restpdie;
  }

  Future<double?> _getRestePDIN() async {
    btpdi = (await SQLHelper().besoinsTotauxPDI(id: 1))!;
    restpdin = _apportpdin - btpdi;
    return restpdin;
  }

  Widget build(BuildContext context) {
    return Container(
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
              height: 30,
            ),
            const Text("Les apports ",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 30,
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
                            fontStyle: FontStyle.italic, color: Colors.white),
                        textAlign: TextAlign.end,
                      )),
                  DataColumn(
                      headingRowAlignment: MainAxisAlignment.center,
                      label: Text(
                        "MS",
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
                    const DataCell(Text('Qté Lait',
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
                    DataCell(Text((restpdin / 48).toStringAsFixed(2).toString(),
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0XFF035B6F)))),
                  ])
                ]),
            const SizedBox(
              height: 30,
            ),
            if (_apportms < _ci)
              const Text(
                  "« Alerte : La capacité d’ingestion de votre vache n’est pas saturée. Augmentez la quantité des fourrages distribuées»",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            if (_apportms > _ci)
              const Text(
                  "« Alerte : La capacité d’ingestion de votre vache est sursaturée. Diminuer la quantité des fourrages distribuées. »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            if (_apportst > (_apportms / 2))
              const Text(
                  "« Alerte : Attention vous comptez distribuer plus de 50 % de concentré dans votre ration .Diminuez la quantité de concentré distribuée. »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            if ((restufl / 0.45) == (restpdie / 48))
              const Text("« Equilibrée : Pas besoin de correcteur. »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            if ((restufl / 0.45) > (restpdie / 48))
              const Text(
                  "« Déséquilibrée : Il faut combler un déficit de {(restufl / 0.45) - (restpdie / 48)} Kg entre les UFL et les PDIN ==> Sélectionnez un correcteur azoté . »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            if ((restufl / 0.45) < (restpdie / 48))
              const Text(
                  "« Déséquilibrée : Il faut combler un déficit de {((restpdie / 48) - (restufl / 0.45))}  Kg entre les UFL et les PDIN ==> Sélectionnez un correcteur énergitique . »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            if ((_apportndf >= (35 / 100 * _apportms * 1000)))
              const Text("«Pas de risque d'acidose »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            if ((_apportndf < (35 / 100 * _apportms * 1000)))
              const Text("«Risque fort d'acidose »",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 128, 10, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
          ],
        )));
  }
}
