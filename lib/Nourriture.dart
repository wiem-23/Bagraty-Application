// ignore_for_file: file_names

import 'package:bagraty_project/PopupCardConcentre.dart';
import 'package:bagraty_project/PopupCardDetailsFourrage.dart';
import 'package:bagraty_project/PopupCardFourrage.dart';
import 'package:bagraty_project/dbBagraty.dart';

import 'package:bagraty_project/quantaiteLait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

late String message;
List<String> fourragesList = BagratyDatabase().listeFourrages() as List<String>;
@override
int _selectedIndex = 0;
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

void setState(Null Function() param0) {}

class Nourriture extends StatelessWidget {
  const Nourriture({super.key});

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    Future<void> concentreClicked() async {
      showPopupCard<String>(
        context: context,
        builder: (context) {
          return PopupCard(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: const PopupCardConcentre(),
          );
        },
        offset: const Offset(-8, 60),
        alignment: Alignment.topRight,
        useSafeArea: true,
        dimBackground: true,
      );
    }

    Future<void> fourrageClicked() async {
      showPopupCard<String>(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
              child: PopupCard(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: const PopupCardfourrage(),
          ));
        },
        offset: const Offset(-8, 60),
        alignment: Alignment.topRight,
        useSafeArea: true,
        dimBackground: true,
      );
    }

    Future<void> detailsClicked() async {
      showPopupCard<String>(
        context: context,
        builder: (context) {
          return PopupCard(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            child: const PopupCardDetailsFourrage(),
          );
        },
        offset: const Offset(-8, 60),
        alignment: Alignment.topRight,
        useSafeArea: true,
        dimBackground: true,
      );
    }

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
            label: 'Déconnexion',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff708907),
        onTap: _onItemTapped,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(30),
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
              Row(
                children: [
                  const Text(
                    "Fourrages",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0xff708907),
                      minWidth: 2,
                      //  final rows = await db.query('my_table');
                      // ignore: duplicate_ignore
                      // ignore: avoid_print
                      onPressed: () {
                        /* BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Pulpe de Tomate",
                            ms_n: "27",
                            ufl_n: "0,49",
                            pdin_n: "140",
                            pdie_n: "120",
                            ndf_n: "300");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Pulpe de Betterave",
                            ms_n: "28",
                            ufl_n: "1,01",
                            pdin_n: "60",
                            pdie_n: "84",
                            ndf_n: "200");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Orge grain",
                            ms_n: "86,7",
                            ufl_n: "1,09",
                            pdin_n: "79",
                            pdie_n: "101",
                            ndf_n: "110");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Soja grain",
                            ms_n: "90",
                            ufl_n: "1,30",
                            pdie_n: "160",
                            pdin_n: "180",
                            ndf_n: "200");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Grignons d’Olive",
                            ms_n: "90",
                            ufl_n: "0,85",
                            pdie_n: "70",
                            pdin_n: "85",
                            ndf_n: "300");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: "Maïs grain",
                            ms_n: "86",
                            ufl_n: "1,10",
                            pdie_n: "95",
                            pdin_n: "80",
                            ndf_n: "130");
                        BagratyDatabase().insertNourriture(
                            motif_n: "concentre",
                            nom_n: " Tourteau de soja",
                            ms_n: "189",
                            ufl_n: "0,88",
                            pdie_n: "140",
                            pdin_n: "150",
                            ndf_n: "200"); */
                        fourrageClicked();
                      },
                      child: const Text(
                        "+",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  const Text(
                    "Concentrés",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color(0xff708907),
                      minWidth: 2,
                      onPressed: () {
                        concentreClicked();
                      },
                      child: const Text(
                        "+",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 100,
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
                        builder: (context) => const QantaiteLait()));
                  },
                  child: const Text(
                    "Quantité de lait",
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
                  onPressed: () async {
                    await BagratyDatabase().listeFourrages();
                  },
                  child: const Text(
                    "Détail Fourrage",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ],
          )),
    );
  }
}
