// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field, prefer_typing_uninitialized_variables

import 'package:bagraty_project/Bagraty/CalculCI.dart';
import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/Bagraty/connexion.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';
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
  @override
  void initState() {
    super.initState();
    error = false;
    success = false;
  }

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

  final List<String> _options = ['Tarie', 'Multipare', 'primipare'];

  Future<void> _selectDate(BuildContext context) async {
    // Afficher le DatePicker
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    // Si une date a été choisie, mettre à jour le champ de texte
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
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
            setState(() {
              _selectedOption = newValue;
            });
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
                labelText: 'Date ',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context), // Ouvrir le DatePicker
                ))),
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

              await SQLHelper().insertVacheData(
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
                  date: _dateController.text,
                  id_n: 0);
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

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculci(
                        ci: _ci,
                        thi: _thi,
                        id: id_v,
                      )));
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
      ]),
    ));
  }
}
