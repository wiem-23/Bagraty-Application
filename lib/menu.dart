import 'package:flutter/material.dart';

int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.back_hand),
              label: 'Retour',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: 'Déconn',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff708907),
          onTap: _onItemTapped,
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
                children: [
                  Column(
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
                      ),
                      const Text(
                        'calcul besoins',
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
                      ),
                      const Text(
                        'calcul ration',
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
                          image: DecorationImage(
                            image: AssetImage('assets/images/etat-corp.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
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
