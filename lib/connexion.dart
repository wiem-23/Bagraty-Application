import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

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

              decoration: const InputDecoration(
                icon: Icon(
                  Icons.line_weight_sharp,
                  color: Colors.white,
                ),
                labelText: 'ID Exploitant',
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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

              // ignore: prefer_const_constructors
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),

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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextFormField(
              cursorColor: const Color.fromARGB(255, 255, 255, 255),

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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
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
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Connexion()));
                  print("cliqued");
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
          ],
        ),
      ),
    );
  }
}
