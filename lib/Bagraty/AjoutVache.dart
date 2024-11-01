// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field

import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/Bagraty/connexion.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

bool error = false, success = false;
String message = "";

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

    message = 'vide';
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
  final TextEditingController date = TextEditingController();
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
      padding: const EdgeInsets.fromLTRB(80.0, 0, 80.0, 0),
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
            labelText: 'Poidst',
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
              /*      await SQLHelper().insertExploitantData(
                nom_ex: nom_exploitant.text,
                nbr_vache: int.parse(nbr_vache.text),
                gov_ex: gouvernorat.text,
                tel_ex: int.parse(tel.text),
              );
              setState(() {
                message = 'exploitant inscrit avec succés';
              });
              //  final rows = await db.query('my_table');
              // ignore: duplicate_ignore
              // ignore: avoid_print
              print(message);
              if (message == 'exploitant inscrit avec succés') {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Connexion()));
              } */
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
