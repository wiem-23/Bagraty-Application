// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field

import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/Bagraty/connexion.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';

import 'package:flutter/material.dart';

bool error = false, success = false;
String message = "";

// ignore: must_be_immutable
class InscriptionExp extends StatefulWidget {
  const InscriptionExp({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return InscriptionExpState();
  }
}

class InscriptionExpState extends State<InscriptionExp> {
  @override
  void initState() {
    super.initState();

    message = 'vide';
  }

  List<Map<String, dynamic>> _exp = [];
  void _refreshExploitants() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _exp = data;
    });
  }

  @override
  final TextEditingController nom_exploitant = TextEditingController();
  final TextEditingController nbr_vache = TextEditingController();
  final TextEditingController gouvernorat = TextEditingController();
  final TextEditingController tel = TextEditingController();
  final TextEditingController id_ex = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // height: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(80.0, 100.0, 80.0, 100.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.5, 1.0],
        colors: [
          Color(0XFF035B6F),
          Colors.white,
          Color(0XFF708908),
        ],
      )),
      child: Column(children: [
        TextFormField(
          cursorColor: const Color.fromARGB(255, 255, 255, 255),
          controller: nom_exploitant,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.man_2_outlined,
              color: Colors.white,
            ),
            labelText: 'Nom Exploitant',
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

          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          controller: nbr_vache,

          decoration: const InputDecoration(
            icon: Icon(
              Icons.numbers,
              color: Colors.white,
            ),
            labelText: 'Nombre de vaches',
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
          controller: gouvernorat,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
            labelText: 'Governorat',
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
          controller: tel,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

          decoration: const InputDecoration(
            icon: Icon(
              Icons.line_weight_sharp,
              color: Colors.white,
            ),
            labelText: 'Téléphone',
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
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
              await SQLHelper().insertExploitantData(
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
              }
            },
            child: const Text(
              "S'inscrire",
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
