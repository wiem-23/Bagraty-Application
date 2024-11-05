// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'package:bagraty_project/Bagraty/Inscription.dart';
import 'package:bagraty_project/Bagraty/menu.dart';
import 'package:bagraty_project/Bagraty/sqlHelper.dart';

import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ConnexionState();
  }
}

class ConnexionState extends State<Connexion> {
  final TextEditingController tel = TextEditingController();
  final TextEditingController nom_exploitant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          children: [
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              controller: nom_exploitant,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.line_weight_sharp,
                  color: Colors.white,
                ),
                labelText: 'Nom Exploitant',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              controller: tel,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.man_2_outlined,
                  color: Colors.white,
                ),
                labelText: 'Téléphone',
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const Divider(
              height: 40.0,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
            Column(
              children: [
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xff708907),
                    minWidth: 2,
                    padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                    onPressed: () async {
                      await SQLHelper().seConnecter(tel: int.parse(tel.text));

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Menu()));
                    },
                    child: const Text(
                      "Se connecter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InscriptionExp()));
                    },
                    child: Text('creer un compte'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
