import 'package:bagraty_project/dbBagraty.dart';
import 'package:bagraty_project/inscription.dart';
import 'package:bagraty_project/menu.dart';
import 'package:flutter/material.dart';

class Conseils extends StatefulWidget {
  const Conseils({super.key});
  void initState() {
    error = false;

    success = false;
  }

  @override
  ConseilsState createState() {
    // ignore: no_logic_in_create_state
    return ConseilsState();
  }
}

class ConseilsState extends State<Conseils> {
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
        child: const Center(
            child: Text(
          "Section encours de construction",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            color: Color(0XFF035B6F),
            fontWeight: FontWeight.w900,
          ),
        )),
      ),
    );
  }
}
