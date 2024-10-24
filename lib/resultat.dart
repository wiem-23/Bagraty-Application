import 'package:flutter/material.dart';

class Resultat extends StatelessWidget {
  const Resultat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(50.0, 60.0, 50.0, 30.0),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Capacité d'ingestion",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text("Valeur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
            const Text(
                'message message message message message message message'),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Besoins totaux en PDIE",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text("Valeur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Besoins totaux en UFL",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text("Valeur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
            const Text(
                'message message message message message message message'),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "UFL: Besoin de lactation",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text("Valeur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "PDIE:Besoins de lactation",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text("Valeur",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ]),
            const Divider(
              height: 40.0,
              color: Color.fromRGBO(0, 0, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xff708907),
                    minWidth: 2,
                    padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Resultat()));
                      print("cliqued");
                    },
                    child: const Text(
                      "Menu",
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Resultat()));
                      print("cliqued");
                    },
                    child: const Text(
                      "Recalculer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
