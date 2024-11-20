// ignore_for_file: non_constant_identifier_names, unused_element, avoid_print

import 'dart:async';

import 'package:bagraty_app/Bagraty/ListeNourritures.dart';
import 'package:bagraty_app/Bagraty/sqlHelper.dart';
import 'package:bagraty_app/BagratyArabic/ListeNourrituresAR.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

bool error = false;
bool isButtonEnabled = false;

// ignore: must_be_immutable
class AjoutVacheAR extends StatefulWidget {
  AjoutVacheAR({super.key, this.id_exp});
  final int? id_exp;

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return AjoutVacheARState();
  }
}

class AjoutVacheARState extends State<AjoutVacheAR> {
  String daate = '';
  @override
  List<Map<String, dynamic>> _exp = [];
  void _refreshvache() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _exp = data;
    });
  }

  @override
  final TextEditingController id_v = TextEditingController();
  final TextEditingController id_p = TextEditingController();
  final TextEditingController id_m = TextEditingController();
  final TextEditingController poids_v = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController prod_lait = TextEditingController();
  final TextEditingController mois_g = TextEditingController();
  final TextEditingController temperature = TextEditingController();
  final TextEditingController humidite = TextEditingController();

  final TextEditingController _dateController = TextEditingController();
  String? _selectedOption;
  bool tarie = false;
  final List<String> _options = ['غارزة', 'أول ولادة', 'ثاني ولادة أو أكثر'];
  @override
  void initState() {
    super.initState();
    error = false;
    isButtonEnabled = false;
    id_v.text = "TN";
    id_p.text = "TN";
    id_m.text = "TN";
  }

  DateTime? pickedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    // Afficher le DatePicker
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        // Personnalisation du thème ici
        return Theme(
          data: ThemeData(
            primaryColor: Color.fromARGB(
                255, 243, 33, 208), // Couleur du titre du calendrier
            hintColor: Colors.blue, // Couleur des éléments interactifs
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary, // Couleur des boutons
            ),
            textTheme: TextTheme(
              titleLarge: TextStyle(color: Colors.blue), // Titre du mois
              bodyMedium: TextStyle(color: Colors.black), // Texte du jour
            ),
          ),
          child: child!,
        );
      },
    );

    // Si une date a été choisie, mettre à jour le champ de texte
    if (pickedDate != null) {
      setState(() {
        daate = DateFormat('yyyy-MM-dd').format(pickedDate!);
      });
      daate = DateFormat('yyyy-MM-dd').format(pickedDate!);

      return print(DateFormat('yyyy-MM-dd').format(pickedDate!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            textAlign: TextAlign.center,
            'إضافة بقرة ',
            style: TextStyle(
                fontSize: 16.0,
                color: Color(0XFF035B6F),
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0XFF035B6F),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            decoration: BoxDecoration(
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 10,
              ),

              TextFormField(
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: id_v,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'معرف البقرة ',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: id_p,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'معرف الاب',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: id_m,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'معرف الام',
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(1000|[1-9]([0-9]){0,2})$')),
                  // Accepte uniquement des nombres de 0 à 1000
                ],
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: poids_v,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'الوزن الحي',
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      r'^(100|[1-9]([0-9])?)$')), // Nombre entre 1 et 100
                ],
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: age,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'Age 1er velage',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Couleur de la bordure
                    )),
                isExpanded: true,
                elevation: 100,
                hint: Text('الولادات',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.normal,
                        fontSize: 13)),
                value: _selectedOption,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });

                  _selectedOption = newValue;
                  if (newValue == 'غارزة') {
                    prod_lait.text = '7';
                  } else {
                    prod_lait.text = '';
                  }
                },
                items: _options.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Color(0XFF035B6F), fontSize: 13),
                    ),
                  );
                }).toList(),
              ),

              // ignore: prefer_const_constructors

              TextFormField(
                enabled: !tarie,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(40|[1-4]([0-9])?)$')), // Nombre entre 1 et 40
                ],
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: prod_lait,

                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'إنتاج الحليب يوميا',
                  labelStyle: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]$')), // N'accepte que les nombres de 1 à 9
                ],
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: mois_g,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'شهر الحمل',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: temperature,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  labelText: 'الحرارة ',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 13,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Color.fromARGB(255, 255, 255, 255),
                controller: humidite,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 13),

                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal),
                  focusColor: Colors.white,
                  hoverColor: Colors.white,
                  labelText: 'الرطوبة ',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 13,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              TextField(
                  controller: _dateController,
                  readOnly: true, // Rendre le champ en lecture seule
                  decoration: InputDecoration(
                      labelText: 'التاريخ',
                      labelStyle: TextStyle(color: Colors.white, fontSize: 13),
                      hintText: DateFormat('yyyy-MM-dd')
                          .format(pickedDate!)
                          .toString(),
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          color: Colors.white,
                          onPressed: () => {
                                _selectDate(context),
                              }))),
              Divider(
                height: 40.0,
                color: Color.fromRGBO(0, 0, 0, 0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xff708907),
                      minWidth: 2,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        isButtonEnabled = false;
                        if (id_v.text == 0 ||
                            id_m.text == 0 ||
                            id_p.text == 0) {
                          _showAlertDialog(context);
                        } else if (_selectedOption == "غارزة") {
                          await SQLHelper().insertVacheData(
                              parite: _selectedOption,
                              id_v: id_v.text,
                              id_m: id_m.text,
                              id_p: id_p.text,
                              id_ex: 1,
                              poid: int.parse(poids_v.text),
                              age: int.parse(age.text),
                              prod_lait: int.parse('7'),
                              mois_g: int.parse(mois_g.text),
                              humidite: double.parse(humidite.text),
                              temperature: int.parse(temperature.text),
                              date: daate,
                              id_n: 0);
                        } else {
                          await SQLHelper().insertVacheData(
                              parite: _selectedOption,
                              id_v: id_v.text,
                              id_m: id_m.text,
                              id_p: id_p.text,
                              id_ex: 1,
                              poid: int.parse(poids_v.text),
                              age: int.parse(age.text),
                              prod_lait: int.parse(prod_lait.text),
                              mois_g: int.parse(mois_g.text),
                              humidite: double.parse(humidite.text),
                              temperature: int.parse(temperature.text),
                              date: daate,
                              id_n: 0);
                        }

                        double ci =
                            await SQLHelper().calcCITotal(id: id_v.text);
                        print("ci$ci");
                        var thi = await SQLHelper().calcTHITotal(id: id_v.text);

                        await SQLHelper.updateVache(
                            id_v: id_v.text, ci_v: ci, thi_v: thi);
                        var res = await SQLHelper.getVache(id: id_v.text);

                        isButtonEnabled = true;
                        setState() {
                          isButtonEnabled = true;
                        }
                      },
                      child: Text(
                        "حساب",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xff708907),
                      minWidth: 2,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        _showCI(id: id_v.text);
                        var ci = await SQLHelper().calcCITotal(id: id_v.text);
                        print("ci$ci");
                        var thi = await SQLHelper().calcTHITotal(id: id_v.text);

                        await SQLHelper.updateVache(
                            id_v: id_v.text, ci_v: ci, thi_v: thi);
                        var res = await SQLHelper.getVache(id: id_v.text);
                      },
                      child: Text(
                        "تفاصيل ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )
            ]),
          ),
        ));
  }

  void _showCI({required String id}) async {
    var ci = await SQLHelper().calcCITotal(id: id_v.text);
    print("ci$ci");
    var thi = await SQLHelper().calcTHITotal(id: id_v.text);
    await SQLHelper.updateVache(id_v: id_v.text, ci_v: ci, thi_v: thi);
    var res = await SQLHelper.getVache(id: id_v.text);
    var btPDI = await SQLHelper().besoinsTotauxPDI(id: id_v.text);
    var btUFL = await SQLHelper().besoinsTotauxUFL(id: id_v.text);
    /*   var blPDI = await SQLHelper().besoinsLactationPDI(id: id_v.text);
    var blUFL = await SQLHelper().besoinsLactationUFL(id: id_v.text); */
    showModalBottomSheet(
        context: context,
        elevation: 6,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 50,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DataTable(
                        columnSpacing: 60,
                        horizontalMargin: 10.0,
                        headingRowColor:
                            WidgetStatePropertyAll(Color(0XFF035B6F)),
                        dataRowColor: WidgetStatePropertyAll(Colors.white),
                        columns: const [
                          DataColumn(
                              headingRowAlignment: MainAxisAlignment.center,
                              label: Text(
                                "القيمة",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                textAlign: TextAlign.end,
                              )),
                          DataColumn(
                              headingRowAlignment: MainAxisAlignment.end,
                              label: Text(
                                "إشارة",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                                textAlign: TextAlign.end,
                              )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text(ci.toStringAsFixed(2).toString(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                            DataCell(Text("                القدرة على الإبتلاع",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(thi!.toStringAsFixed(2).toString(),
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                            DataCell(Text("مؤشر درجة الحرارة والرطوبة",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(btPDI.toString(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                            DataCell(Text('الاحتياجات الجملية من البروتين',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                          ]),
                          DataRow(cells: [
                            DataCell(Text(btUFL!.toStringAsFixed(2).toString(),
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                            DataCell(Text('الاحتياجات الجملية من الطاقة',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0XFF035B6F)))),
                          ]),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    if (thi < 68)
                      Text('THI < 68  لا يوجد ضغط الحرارة للأبقار',
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 10, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    if (thi >= 68 && thi <= 98)
                      Text(' THI > 68 بقرة تحت ضغط الحرارة',
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 10, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    if (thi >= 99)
                      Text('تحذير خطر موت الأبقار',
                          style: TextStyle(
                              color: Color.fromARGB(255, 128, 10, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          minWidth: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color(0xff708907),
                          onPressed: () async {
                            // Close the bottom sheet
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'إغلاق',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          minWidth: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color(0xff708907),
                          onPressed: () async {
                            // Close the bottom sheet
                            Navigator.of(context).pop();
                            id_m.text = "TN";
                            id_p.text = "TN";
                            id_v.text = "TN";
                            age.text = "";
                            mois_g.text = "";
                            prod_lait.text = "";
                            temperature.text = "";
                            humidite.text = "";
                            poids_v.text = "";
                          },
                          child: Text(
                            'إعادة',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MaterialButton(
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          minWidth: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Color(0xff708907),
                          onPressed: () {
                            /*  _showListeNourriture(id: int.parse(id_v.text)); */
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ListenourrituresAR(id_v: id_v.text)));
                          },
                          child: Text(
                            'عليقة  ',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ]),
            ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تنبيه'),
          content: Text("الرجاء إدخال الرقم التعريفي"),
          actions: <Widget>[
            TextButton(
              child: Text('موافق'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
          ],
        );
      },
    );
  }

  void _showListeNourriture({required String id}) async {
    showModalBottomSheet(
        context: context,
        elevation: 6,
        isScrollControlled: true,
        builder: (_) => Container(child: ListenourrituresAR(id_v: id)));
  }
}
