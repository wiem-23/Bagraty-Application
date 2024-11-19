import 'package:flutter/material.dart';

class Approvisionnement extends StatefulWidget {
  const Approvisionnement({super.key});

  @override
  ApprovisionnementState createState() {
    // ignore: no_logic_in_create_state
    return ApprovisionnementState();
  }
}

class ApprovisionnementState extends State<Approvisionnement> {
  final TextEditingController tel = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController nom_exploitant = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Approvisionnement',
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
