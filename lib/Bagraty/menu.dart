// ignore_for_file: unused_local_variable

import 'package:bagraty_app/Bagraty/AjoutVache.dart';
import 'package:bagraty_app/Bagraty/approvisionnement.dart';
import 'package:bagraty_app/Bagraty/conseils.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            textAlign: TextAlign.center,
            'Menu',
            style: TextStyle(
                fontSize: 16.0,
                color: Color(0XFF035B6F),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 130.0,
                        height: 130.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/etat-corp.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: MaterialButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Ajoutvache()));
                        }),
                      ),
                      const Text(
                        'Rationnement',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10.0,
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  const Divider(
                    height: 10.0,
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        width: 130.0,
                        height: 130.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/conseils.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: MaterialButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Conseils()));
                        }),
                      ),
                      const Text(
                        'conseils',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 10.0,
                    color: Color.fromRGBO(0, 0, 0, 0),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 130.0,
                        height: 130.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/approvisonnement.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: MaterialButton(onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Approvisionnement()));
                        }),
                      ),
                      const Text(
                        'Approvisionnement',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
