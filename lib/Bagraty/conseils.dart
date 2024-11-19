// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Conseils extends StatefulWidget {
  const Conseils({super.key});

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
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Conseils',
          style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF035B6F),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 100.0),
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
          "Section en cours de construction",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0XFF035B6F),
            fontWeight: FontWeight.w900,
          ),
        )),
      ),
    );
  }
}
