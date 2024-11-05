// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:bagraty_project/Bagraty/menu.dart';

import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

bool error = false, success = false;

// ignore: must_be_immutable
class Ajoutvache extends StatefulWidget {
  const Ajoutvache({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return AjoutvacheState();
  }
}

class AjoutvacheState extends State<Ajoutvache> {
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

  TextEditingController _dateController = TextEditingController();
  String? _selectedOption;
  bool tarie = false;
  final List<String> _options = ['Tarie', 'Multipare', 'primipare'];
  void initState() {
    super.initState();
    error = false;
    success = false;
    daate = '';
    prod_lait.text = '';
  }

  void _checkTarie() {
    setState(() {
      // Si le texte dans le premier champ est "abc", désactiver le deuxième champ
      tarie = _selectedOption == "Tarie";
      prod_lait.text = '7';
    });
    print(prod_lait.text);
  }

  Future<void> _selectDate(BuildContext context) async {
    // Afficher le DatePicker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    // Si une date a été choisie, mettre à jour le champ de texte
    if (pickedDate != null) {
      setState(() {
        daate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
      daate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(daate);
      return print(DateFormat('yyyy-MM-dd').format(pickedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
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
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: id_v,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'ID vache',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: id_p,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'ID père',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: id_m,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'ID mère',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
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
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: poids_v,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'Poids',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^(100|[1-9]([0-9])?)$')), // Nombre entre 1 et 100
          ],
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: age,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'Age velage',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white), // Couleur de la bordure
          )),
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          elevation: 100,
          hint: const Text('Parité',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.normal)),
          value: _selectedOption,
          onChanged: (String? newValue) {
            _checkTarie();
            setState(() {
              _selectedOption = newValue;
            });
            _selectedOption = newValue;
          },
          items: _options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(color: Color(0XFF035B6F)),
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
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: prod_lait,

          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
            labelText: 'Production du lait',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'^[1-9]$')), // N'accepte que les nombres de 1 à 9
          ],
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: mois_g,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.line_weight_sharp,
              color: Colors.white,
            ),
            labelText: 'Mois de gestation',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: temperature,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.line_weight_sharp,
              color: Colors.white,
            ),
            labelText: 'Température ',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: humidite,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.line_weight_sharp,
              color: Colors.white,
            ),
            labelText: 'Humidité',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
        TextField(
            controller: _dateController,
            readOnly: true, // Rendre le champ en lecture seule
            decoration: InputDecoration(
                labelText: 'Entrez une date (YYYY-MM-DD) ',
                hintText: 'Ex: 2024-11-05',
                suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => {
                          _selectDate(context),
                        }))),
        const Divider(
          height: 40.0,
          color: Color.fromRGBO(0, 0, 0, 0),
        ),
        MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: const Color(0xff708907),
            minWidth: 2,
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            onPressed: () async {
              WidgetsFlutterBinding.ensureInitialized();

              SQLHelper db = SQLHelper();

              await db.setCurrentExp(1);

              int? currentUserId = await db.getCurrentExpId();

              print('ID de l\'utilisateur actuel : $currentUserId');
              if (_selectedOption == "Tarie") {
                await SQLHelper().insertVacheData(
                    parite: _selectedOption,
                    id_v: int.parse(id_v.text),
                    id_m: int.parse(id_m.text),
                    id_p: int.parse(id_p.text),
                    id_ex: int.parse(currentUserId.toString()),
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
                    id_v: int.parse(id_v.text),
                    id_m: int.parse(id_m.text),
                    id_p: int.parse(id_p.text),
                    id_ex: int.parse(currentUserId.toString()),
                    poid: int.parse(poids_v.text),
                    age: int.parse(age.text),
                    prod_lait: int.parse(prod_lait.text),
                    mois_g: int.parse(mois_g.text),
                    humidite: double.parse(humidite.text),
                    temperature: int.parse(temperature.text),
                    date: daate,
                    id_n: 0);
              }
              print(_selectedOption);
              var _ci = await SQLHelper().calcCITotal(id: int.parse(id_v.text));
              print("ci =====> ${_ci}");
              var _thi =
                  await SQLHelper().calcTHITotal(id: int.parse(id_v.text));
              print("thi ====> ${_thi}");
              await SQLHelper.updateVache(
                  id_v: int.parse(id_v.text), ci_v: _ci, thi_v: _thi);
              var res = await SQLHelper.getVache(id: int.parse(id_v.text));

              print('vache updated');
              print(res);
              //  final rows = await db.query('my_table');
              // ignore: duplicate_ignore
              // ignore: avoid_print
            },
            child: const Text(
              "Calculer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
            )),
        MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: const Color(0xff708907),
            minWidth: 2,
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
            onPressed: () async {
              _showCI(id: int.parse(id_v.text));
              var _ci = await SQLHelper().calcCITotal(id: int.parse(id_v.text));
              print("ci =====> ${_ci}");
              var _thi =
                  await SQLHelper().calcTHITotal(id: int.parse(id_v.text));
              print("thi ====> ${_thi}");
              await SQLHelper.updateVache(
                  id_v: int.parse(id_v.text), ci_v: _ci, thi_v: _thi);
              var res = await SQLHelper.getVache(id: int.parse(id_v.text));

              print('vache updated');
              print(res);
              //  final rows = await db.query('my_table');
              // ignore: duplicate_ignore
              // ignore: avoid_print
            },
            child: const Text(
              "Détails",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold,
              ),
            )),
      ]),
    ));
  }

  void _showCI({required int id}) async {
    var ci = await SQLHelper().calcCITotal(id: id);
    var _thi = await SQLHelper().calcTHITotal(id: int.parse(id_v.text));
    await SQLHelper.updateVache(
        id_v: int.parse(id_v.text), ci_v: ci, thi_v: _thi);
    var res = await SQLHelper.getVache(id: int.parse(id_v.text));
    var btPDI = await SQLHelper().besoinsTotauxPDI(id: id);
    var btUFL = await SQLHelper().besoinsTotauxUFL(id: id);
    var blPDI = await SQLHelper().besoinsLactationPDI(id: id);
    var blUFL = await SQLHelper().besoinsLactationUFL(id: id);
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
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text('Capacité d’ingestion (kg/Ms) : '),
                      Text(ci.toString())
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [Text('THI : '), Text(_thi.toString())],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (_thi! < 68)
                    Text(
                        '«THI < 68 donc Pas de stress thermique pour les vaches»'),
                  if (_thi! > 99)
                    Text('« Attention Risque de mort des vaches »'),
                  Row(
                    children: [
                      Text('Besoins totaux en PDI : '),
                      Text(btPDI.toString())
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text('Besoins totaux en UFL : '),
                      Text(btUFL.toString())
                    ],
                  ),
                  Text(
                      "Besoins en UFL et PDI pour produire ${prod_lait.text} Litres du lait standard (4 ‰ TB et 32 ‰ TP)"),
                  Row(
                    children: [
                      Text('Besoin de lactation en UFL : '),
                      Text(blUFL.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Text('Besoin de lactation en BDI : '),
                      Text(blPDI.toString())
                    ],
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                    minWidth: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff708907),
                    onPressed: () async {
                      // Close the bottom sheet
                      Navigator.of(context).pop();
                      await SQLHelper().calculateTotalSommeTow();
                    },
                    child: const Text(
                      'Sortir',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  )
                ],
              ),
            ));
  }
}
