import 'package:bagraty_app/Bagraty/Inscription.dart';
import 'package:bagraty_app/Bagraty/menu.dart';
import 'package:bagraty_app/Bagraty/sqlHelper.dart';
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
  final TextEditingController mdp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          'Connexion Exploitant',
          style: TextStyle(
              fontSize: 16.0,
              color: Color(0XFF035B6F),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(40.0, 100.0, 40.0, 100.0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.5, 1.0],
            colors: [
              Color(0XFF035B6F),
              Color.fromARGB(255, 194, 192, 192),
              Color(0XFF708908),
            ],
          )),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      cursorColor: const Color.fromARGB(255, 255, 255, 255),

                      // ignore: prefer_const_constructors
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,

                      cursorColor: const Color.fromARGB(255, 255, 255, 255),

                      // ignore: prefer_const_constructors
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      controller: mdp,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 40.0,
                      color: Color.fromRGBO(0, 0, 0, 0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: const Color(0xff708907),
                            minWidth: 2,
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                              int idTest = await SQLHelper().seConnecter(
                                  tel: int.parse(tel.text), mdp: mdp.text);

                              if (idTest != 0) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Menu()));
                              } else {
                                null;
                              }
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const InscriptionExp()));
                            },
                            child: const Text(
                              'creer un compte',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              selectionColor: Color(0XFF035B6F),
                            )),
                       
                      ],
                    ),
                  ]))),
    );
  }
}
