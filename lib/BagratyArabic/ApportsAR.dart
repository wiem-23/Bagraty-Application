// ignore_for_file: unused_local_variable, avoid_print

import 'package:bagraty_app/Bagraty/AjoutVache.dart';
import 'package:bagraty_app/Bagraty/first_page.dart';
import 'package:bagraty_app/Bagraty/sqlHelper.dart';
import 'package:bagraty_app/BagratyArabic/AjoutVacheAR.dart';
import 'package:flutter/material.dart';

class ApportsAR extends StatefulWidget {
  const ApportsAR({super.key, this.id_v});
  final String? id_v;
  @override
  _ApportsARState createState() => _ApportsARState();
}

class _ApportsARState extends State<ApportsAR> {
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

  Future<double?> _calculateMSTotal() async {
    msList = await SQLHelper().calculateMSTotal();
    double apportms = 0.0;
    double totalms = 0.0;
    for (var nourriture in msList) {
      // totalms += nourriture['ms_n'];

      apportms += (nourriture['ms_n'] / 100) * (nourriture['quantite']);
    }

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
                  child: const Text("الإضافات",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 15,
                ),
                DataTable(
                    columnSpacing: 14,
                    horizontalMargin: 5.0,
                    headingRowColor:
                        const WidgetStatePropertyAll(Color(0XFF035B6F)),
                    dataRowColor: const WidgetStatePropertyAll(Colors.white),
                    columns: const [
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.start,
                          label: Text(
                            "MS",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.start,
                          label: Text(
                            "UFL",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.start,
                          label: Text(
                            "PDIE",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.start,
                          label: Text(
                            "PDIN",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.end,
                          )),
                      DataColumn(
                          headingRowAlignment: MainAxisAlignment.end,
                          label: Text(
                            "الإضافات",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text(_apportms.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text(_apport.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text(_apportpdie.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(_apportpdin.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text('مجموع الإضافات',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: Color(0XFF035B6F),
                            ))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text(('//'),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text((restufl.toStringAsFixed(2)),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text(restpdie.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(restpdin.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        const DataCell(Text('الباقي لإنتاج الحليب',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text(('//'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        DataCell(
                          Text((restufl / 0.45).toStringAsFixed(2),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: Color(0XFF035B6F))),
                        ),
                        DataCell(Text((restpdie / 48).toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                fontStyle: FontStyle.italic,
                                color: Color(0XFF035B6F)))),
                        DataCell(Text(
                            (restpdin / 48).toStringAsFixed(2).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                        const DataCell(Text(' إنتاج الحليب ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Color(0XFF035B6F)))),
                      ])
                    ]),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text("التنبيهات ",
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
                              "«  تنبيه: قدرة البقرة على الابتلاع غير مشبعة. أضف من كمية العلف الموزعة »",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if (_apportms > ci)
                          const Text(
                              "« تنبيه: قدرة البقرة على الابتلاع فوق المشبعة. قلل من كمية العلف الموزعة. »",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 15,
                        ),
                        /*   if (_apportst <= (_apportms / 2))
                          const Text(
                              "« Alerte : Attention vous comptez distribuer plus de 50 % de concentré dans votre ration .Diminuez la quantité de concentré distribuée. »",
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)), */
                        if (_apportst > (_apportms / 2))
                          const Text(
                              "« تحذير: لقد أضفت أكثر من 50% من الأعلاف المركبة في العليقة. قلل كمية الأعلاف المركبة »",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 15,
                        ),
                        if ((restufl / 0.45) == (restpdin / 48))
                          const Text("« عليقة متوازنة»",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if ((restufl / 0.45) > (restpdin / 48))
                          Text(
                              "« عليقة غير متوازنة: يجب تعويض عجز  ${((restufl / 0.45) - (restpdin / 48)).toStringAsFixed(2)} كغ اختر علف مركب غني بالبروتينات »",
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        if ((restufl / 0.45) < (restpdin / 48))
                          Text(
                              "« عليقة غير متوازنة: يجب تعويض عجز  ${((restpdin / 48) - (restufl / 0.45)).toStringAsFixed(2)}  كغ اختر علف مركب غني بالطاقة. »",
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 128, 10, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
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
                              "خطر الإصابة بالبشمة",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xffffffff),
                              ),
                            )),
                      ],
                    )),
                const SizedBox(
                  height: 20,
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
                          "خروج   ",
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
                              builder: (context) => AjoutVacheAR()));
                        },
                        child: const Text(
                          "بقرة اخرى ",
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
          'الإضافات والتنبيهات ',
          style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF035B6F),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showAlertAcidose(BuildContext context) async {
    // Calculez la condition avant de passer à la construction du widget
    String message;

    if (_apportndf >= (35 / 100 * _apportms * 1000)) {
      message = "عدم وجود احتمالية الإصابة بالبشمة ";
    } else {
      message = " ارتفاع خطر الإصابة بالبشمة";
    }

    // Affichez la boîte de dialogue
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("خطر الإصابة بالبشمة"),
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
                'موافق',
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
